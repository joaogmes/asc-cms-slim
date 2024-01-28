function sleep(time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

var Bot = {
  chatSequence: chatSequence,
  inputElement: "#message-input",
  submitElement: "#send-button",
  currentStepIndex: 0,
  currentField: null,
  userData: {},

  init: function () {
    if (Bot.chatSequence != null) {
      Bot.processConversation();
    }

    $("#message-input").keypress(function (event) {
      if (event.which === 13) {
        event.preventDefault();
        $("#send-button").click();
      }
    });
  },

  showError: function (error) {
    console.error(error);
  },

  processConversation: async function () {
    Bot.disableInput();

    for (var index = Bot.currentStepIndex; index < Bot.chatSequence.length; index++) {
      var step = Bot.chatSequence[index];
      await Bot.handleStep(step);
    }
  },

  handleStep: async function (step) {
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

  displayMessage: async function (content, type) {
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

  promptInput: async function (mask, name) {
    Bot.currentField = name;
    var inputElement = $(`${Bot.inputElement}`);
    var submitElementSelector = `${Bot.submitElement}[data-name="${name}"]`;

    inputElement.attr("data-name", name);
    $(`${Bot.submitElement}`).attr("data-name", name);

    inputElement.attr("placeholder", mask);
    if (mask) {
      inputElement.mask(mask);
    } else {
      inputElement.unmask();
    }

    Bot.enableInput();

    await new Promise(function (resolve) {
      var handleButtonClick = function (e) {
        var scopeName = Bot.currentField;
        var inputVal = inputElement.val();

        if (!inputVal) {
          return false;
        }

        Bot.userData[scopeName] = inputVal;
        console.log(Bot.userData);

        Bot.displayMessage(Bot.userData[scopeName], "sent");
        Bot.disableInput();

        resolve();
      };

      // Remove todos os manipuladores de eventos de clique antes de adicionar um novo
      $(submitElementSelector).off("click");
      $(submitElementSelector).on("click", handleButtonClick);
    });
  },

  promptSelect: async function (options, name) {
    // Implemente a lógica para manipular seleções aqui
  },

  enableInput: function () {
    $(`${Bot.inputElement}`).prop("disabled", false).removeAttr("disabled").focus();
  },

  disableInput: function () {
    var inputElement = $(`${Bot.inputElement}`);
    inputElement.prop("disabled", true).attr("disabled", "disabled").blur();

    inputElement.attr("placeholder", "Mensagem");
    inputElement.val("").unmask();
  },
};

$(document).ready(function () {
  Bot.init();
});
