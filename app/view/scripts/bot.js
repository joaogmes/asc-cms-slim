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

  async displayButton(buttonElement) {
    this.chatBody.append(buttonElement[0]);
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
      case "birth":
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

  promptSelect(options, name, mode = "simple") {
    this.currentField = name;

    this.inputElement.attr("data-name", name);
    this.submitElement.attr("data-name", name);

    this.inputElement.unmask();

    $("#extra-options .tags").html("");

    switch (mode) {
      case "simple":
        options.forEach((option) => {
          const template = $(`#template li.tag`).clone();
          template.html(option);
          $("#extra-options .tags").append(template);

          template.on("click", function () {
            $("#message-input").val(option);
          });
        });
        break;

      case "composed":
        Object.entries(options).forEach(([key, value]) => {
          const template = $(`#template li.tag`).clone();
          template.html(key);
          $("#extra-options .tags").append(template);

          template.on("click", function () {
            $("#message-input").val(key);
          });
        });
        break;

      default:
        break;
    }

    $("#extra-options").show();
    $("#chat-body").scrollTop($("#chat-body")[0].scrollHeight);

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
        $("#extra-options").hide();
        resolve({ [scopeName]: inputVal });
      };

      this.submitElement.off("click");
      this.submitElement.on("click", handleButtonClick);
    });
  }

  promptButton(text, url) {
    const messageTemplate = $(`#template li.message`).clone();
    messageTemplate.removeClass("sent");
    messageTemplate.find(".balloon").remove();
    const buttonTemplate = $(`#template a`).clone();
    buttonTemplate.attr("href", url);
    buttonTemplate.attr("target", "_blank");
    buttonTemplate.text(text);
    messageTemplate.append(buttonTemplate);
    return messageTemplate;
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

class RegisterHandler {
  constructor(data) {
    this.userData = data != null ? data : {};
  }

  registerLead(phone = this.userData.phone, origin = this.userData.origin) {
    console.log("registering");

    return $.ajax({
      url: "/api/lead/register",
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify({ phone: phone, origin: origin }),
    })
      .then((response) => {
        if (response.status === "success") {
          this.userData.id = response.insertedId;
          return response.insertedId;
        } else {
          console.error("Error while registering");
          console.error(response);
          return null;
        }
      })
      .catch((error) => {
        console.error("Error during registration:", error);
        return null;
      });
  }

  updateLead(id = this.userData.id, newData) {
    console.log("updating");
    var updateRequest = {
      leadId: id,
      updateData: newData,
    };
    return $.ajax({
      url: "/api/lead/update",
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify(updateRequest),
    })
      .then((response) => {
        console.log(response);
        return response.status;
      })
      .catch((error) => {
        console.error("Error during registration:", error);
        return null;
      });
  }
}

class Bot {
  constructor(chatSequence, inputHandler, messageHandler, registerHandler, sequence) {
    this.sequence = sequence;
    this.chatSequence = chatSequence;
    this.inputHandler = inputHandler;
    this.messageHandler = messageHandler;
    this.registerHandler = registerHandler;
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
        var content = this.parseUserData(step.content);
        await this.messageHandler.displayMessage(content, step.type);
        break;
      case "input":
        var inputData = await this.inputHandler.promptInput(step.mask, step.name);
        this.userData[[step.name]] = inputData[step.name];
        await this.messageHandler.displayMessage(inputData[step.name], step.type);
        this.storeData(inputData, step);
        break;
      case "select":
        var inputData = await this.inputHandler.promptSelect(step.options, step.name, step.mode);
        this.userData[[step.name]] = inputData[step.name];
        await this.messageHandler.displayMessage(inputData[step.name], step.type);
        this.storeData(inputData, step);
        break;
      case "button":
        var link = this.parseUserData(step.link);
        var button = await this.inputHandler.promptButton(step.text, link);
        await this.messageHandler.displayButton(button);
        console.log(button);
        console.log(button[0]);
        // await this.messageHandler.displayMessage(inputData[step.name], step.type);
        // this.storeData(inputData, step);
        break;
      default:
        console.error("Tipo de passo não suportado");
    }
  }

  storeData(data, step) {
    if (this.userData.id) {
      console.log("trying to updateLead");
      this.registerHandler.updateLead(this.userData.id, data);
    } else {
      console.log("trying to registerLead");
      this.registerHandler.registerLead(data[step.name], this.sequence).then((leadId) => {
        this.userData.id = leadId;
        console.log(this.userData);
      });
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

  parseUserData(content) {
    console.log(content);
    const regex = /{{(.*?)}}/g;
    let match;

    while ((match = regex.exec(content)) !== null) {
      const variavel = match[1];

      if (this.userData.hasOwnProperty(variavel)) {
        content = content.replace(match[0], this.userData[variavel]);
      }
    }

    return content;
  }

  async init() {
    await this.processConversation();
  }
}

$(document).ready(() => {
  const messageHandler = new MessageHandler("#chat-body");
  const inputHandler = new InputHandler("#message-input", "#send-button");
  const registerHandler = new RegisterHandler(null);
  const bot = new Bot(chatSequence, inputHandler, messageHandler, registerHandler, sequence);

  bot.init();
});
