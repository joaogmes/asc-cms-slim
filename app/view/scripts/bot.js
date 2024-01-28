function sleep(time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

const Bot = {
  chatSequence,
  inputElement: "#message-input",
  submitElement: "#send-button",
  currentStepIndex: 0,
  currentField: null,
  userData: {},

  init: () => {
    if (Bot.chatSequence != null) {
      // setTimeout(() => {
      Bot.processConversation(Bot.currentStepIndex);
      // }, 500);
    }

    $("#message-input").keypress(function (event) {
      if (event.which === 13) {
        event.preventDefault();
        $("#send-button").click();
      }
    });
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
    $("#chat-body").scrollTop($("#chat-body")[0].scrollHeight);
  },

  promptInput: async (mask, name) => {
    Bot.currentField = name;
    $(`${Bot.inputElement}`).attr("data-name", name);
    $(`${Bot.submitElement}`).attr("data-name", name);

    $(`${Bot.inputElement}`).attr("placeholder", mask);
    if (mask) {
      $(`${Bot.inputElement}`).mask(mask);
    } else {
      $(`${Bot.inputElement}`).unmask();
    }

    Bot.enableInput();

    await new Promise((resolve) => {
      $(`${Bot.submitElement}[data-name="${name}"]`).on("click", function (e) {
        var scopeName = Bot.currentField;

        var inputVal = $(`${Bot.inputElement}`).val();
        if (inputVal == null || inputVal == "") {
          return false;
        }

        Bot.userData[scopeName] = inputVal;
        console.log(Bot.userData);

        Bot.displayMessage(Bot.userData[scopeName], "sent");
        Bot.disableInput();

        resolve();
      });
    });
  },

  promptSelect: async (options, name) => {
    // Implement the logic for handling select prompts here
  },

  enableInput: () => {
    $(`${Bot.inputElement}`).prop("disabled", false).removeAttr("disabled");
    $(`${Bot.inputElement}`).focus();
  },

  disableInput: () => {
    $(`${Bot.inputElement}`).prop("disabled", true).attr("disabled", "disabled");
    $(`${Bot.inputElement}`).blur();

    $(`${Bot.inputElement}`).attr("placeholder", "Mensagem");
    $(`${Bot.inputElement}`).val("");
    $(`${Bot.inputElement}`).unmask();
  },
};

$(document).ready(() => {
  Bot.init();
});
