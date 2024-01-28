function sleep(time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

class MessageHandler {
  constructor(chatBodySelector) {
    this.chatBody = $(chatBodySelector);
  }

  async displayMessage(content, type) {
    const typeClass = type === "message" ? "received" : "sent";
    const timeout = typeClass === "received" ? 1500 : 0;

    const onlineStatus = $("#chat-header .status.online");
    const typingStatus = $("#chat-header .status.typing");

    onlineStatus.hide();
    typingStatus.show();

    await sleep(timeout);

    onlineStatus.show();
    typingStatus.hide();

    const template = $(`#template .message.${typeClass}`).clone();
    template.find(".balloon").html(content);
    this.chatBody.append(template);
    this.chatBody.scrollTop(this.chatBody[0].scrollHeight);
  }
}

class InputHandler {
  constructor(inputElement, submitElement) {
    this.inputElement = $(inputElement);
    this.submitElement = $(submitElement);
    this.currentField = null;
  }

  showAlert(message, type = "info") {
    Toastify({
      text: message,
      duration: 3000,
      gravity: "top",
      position: "right",
      backgroundColor: type === "error" ? "#ff6347" : "#2ecc71", // Red for errors, green for info (customize as needed)
    }).showToast();
  }

  validateInput(type, data) {
    switch (type) {
      case "cpf":
        data = data.replace(/\D/g, "");
        if (data.length !== 11 || /^(\d)\1+$/.test(data)) return { status: false, message: "CPF inválido" };
        let sum = 0;
        let remainder;
        for (let i = 1; i <= 9; i++) sum += parseInt(data.substring(i - 1, i)) * (11 - i);
        remainder = (sum * 10) % 11;
        if (remainder === 10 || remainder === 11) remainder = 0;
        if (remainder !== parseInt(data.substring(9, 10))) return { status: false, message: "CPF inválido" };
        sum = 0;
        for (let i = 1; i <= 10; i++) sum += parseInt(data.substring(i - 1, i)) * (12 - i);
        remainder = (sum * 10) % 11;
        if (remainder === 10 || remainder === 11) remainder = 0;
        return { status: remainder === parseInt(data.substring(10, 11)), message: "CPF inválido" };
      case "phone":
        const digitsOnly = data.replace(/\D/g, "");
        return { status: digitsOnly.length >= 10, message: "Telefone incompleto" };
      case "name":
        return { status: data.length >= 4, message: "Nome incompleto" };
      case "birthdate":
        const dateRegex = /^\d{2}\/\d{2}\/\d{4}$/;
        if (!dateRegex.test(data)) return { status: false, message: "Formato de data inválido (use MM/DD/YYYY)" };

        const [day, month, year] = data.split("/").map(Number);
        const currentYear = new Date().getFullYear();

        const isValidDate = !(isNaN(month) || isNaN(day) || isNaN(year) || month < 1 || month > 12 || day < 1 || day > 31);
        const isValidYear = year >= 1900 && year <= currentYear;

        return {
          status: isValidDate && isValidYear,
          message: isValidDate && isValidYear ? "" : "Data de nascimento inválida",
        };

      default:
        // return { status: false, message: "Tipo incorreto" };
        return { status: true };
    }
  }

  promptInput(mask, name) {
    this.currentField = name;

    this.inputElement.attr("data-name", name);
    this.submitElement.attr("data-name", name);

    this.inputElement.attr("placeholder", mask);
    if (mask) {
      this.inputElement.mask(mask);
    } else {
      this.inputElement.unmask();
    }

    this.enableInput();

    return new Promise((resolve) => {
      const handleButtonClick = () => {
        const scopeName = this.currentField;
        const inputVal = this.inputElement.val();

        var inputValidation = this.validateInput(scopeName, inputVal);
        if (!inputValidation.status) {
          this.showAlert(`${inputValidation.message}`, "error");
          return false;
        }

        this.disableInput();
        resolve({ [scopeName]: inputVal });
      };

      this.submitElement.off("click");
      this.submitElement.on("click", handleButtonClick);
    });
  }

  enableInput() {
    this.inputElement.prop("disabled", false).removeAttr("disabled").focus();
  }

  disableInput() {
    this.inputElement.prop("disabled", true).attr("disabled", "disabled").blur();

    this.inputElement.attr("placeholder", "Mensagem");
    this.inputElement.val("").unmask();
  }
}

class Bot {
  constructor(chatSequence, inputHandler, messageHandler) {
    this.chatSequence = chatSequence;
    this.inputHandler = inputHandler;
    this.messageHandler = messageHandler;
    this.currentStepIndex = 0;
    this.userData = {};

    this.inputHandler.disableInput();
  }

  async processConversation() {
    this.startKeyCodeListener();
    for (let index = this.currentStepIndex; index < this.chatSequence.length; index++) {
      const step = this.chatSequence[index];
      await this.handleStep(step);
    }
  }

  async handleStep(step) {
    switch (step.type) {
      case "message":
        await this.messageHandler.displayMessage(step.content, step.type);
        break;
      case "input":
        var inputData = await this.inputHandler.promptInput(step.mask, step.name);
        this.userData[[step.name]] = inputData[step.name];
        console.log(this.userData);
        await this.messageHandler.displayMessage(inputData[step.name], step.type);
        break;
      case "select":
        // Implemente a lógica para manipular seleções aqui
        break;
      default:
        console.error("Tipo de passo não suportado");
    }
  }

  startKeyCodeListener() {
    $("#message-input").keypress(function (event) {
      if (event.which === 13) {
        event.preventDefault();
        $("#send-button").click();
      }
    });
  }

  async init() {
    await this.processConversation();
  }
}

$(document).ready(() => {
  const messageHandler = new MessageHandler("#chat-body");
  const inputHandler = new InputHandler("#message-input", "#send-button");
  const bot = new Bot(chatSequence, inputHandler, messageHandler);

  bot.init();
});
