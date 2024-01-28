function sleep(time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

const Bot = {
  chatSequence,
  inputElement: "#message-input",
  submitElement: "#send-button",
  currentStepIndex: 0,
  userData: {},

  init: () => {
    if (Bot.chatSequence != null) {
      setTimeout(() => {
        Bot.processConversation(Bot.currentStepIndex);
      }, 500);
    }
  },

  showError: (error) => {
    console.error(error);
  },

  processConversation: async () => {
    for (let index = Bot.currentStepIndex; index < Bot.chatSequence.length; index++) {
      var step = Bot.chatSequence[index];
      await Bot.handleStep(step);
    }
  },

  handleStep: async (step) => {
    switch (step.type) {
      case "message":
        await Bot.displayMessage(step.content, step.type);
        break;
      case "input":
        await Bot.promptInput(step.mask, step.name);
        break;
      case "select":
        await Bot.promptSelect(step.options, step.name);
        break;
      default:
        Bot.showError("Tipo de passo não suportado");
    }
  },

  displayMessage: async (content, type) => {
    console.log("displaying", content);
    var typeClass = type === "message" ? "received" : "sent";
    var timeout = typeClass === "received" ? 1500 : 0;

    var onlineStatus = $("#chat-header .status.online");
    var typingStatus = $("#chat-header .status.typing");

    onlineStatus.hide();
    typingStatus.show();

    await sleep(timeout);

    onlineStatus.show();
    typingStatus.hide();

    var template = $(`#template .message.${typeClass}`).clone();
    template.find(".baloon").html(content);
    $("#chat-body").append(template);
  },

  promptInput: async (mask, name) => {
    $(`${Bot.inputElement}`).attr("data-name", name);
    $(`${Bot.submitElement}`).attr("data-name", name);

    if (mask) {
      $(`${Bot.inputElement}`).mask(mask);
    }

    await new Promise((resolve) => {
      $(`${Bot.submitElement}[data-name="${name}"]`).on("click", () => {
        Bot.userData[name] = $(`${Bot.inputElement}`).val();
        Bot.displayMessage(Bot.userData[name], "sent");
        resolve();
      });
    });
  },

  promptSelect: async (options, name) => {
    // Implement the logic for handling select prompts here
  },
};

// Inicie a conversa aqui
Bot.init();
