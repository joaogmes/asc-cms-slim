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

        if (!inputVal) {
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
        console.log(inputData);
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
