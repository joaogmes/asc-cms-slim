const Bot = {
  chatSequence,
  inputElement: $("#message-input"),
  field: null,
  fieldVal: null,
  init: () => {
    if (Bot.chatSequence != null) {
      Bot.processConversation(Bot.chatSequence);
    }
  },
  showError: (error) => {
    console.error(error);
  },
  processConversation: (conversation) => {
    conversation.forEach((step, index) => {
      setTimeout(() => {
        Bot.handleStep(step);
      }, index * 2000);
    });
  },
  handleStep: (step) => {
    switch (step.type) {
      case "message":
        Bot.displayMessage(step.content, step.type);
        break;
      case "input":
        Bot.promptInput(step.mask, step.name);
        break;
      case "select":
        Bot.promptSelect(step.options, step.name);
        break;
      default:
        Bot.showError("Tipo de passo não suportado");
    }
  },
  displayMessage: (content, type) => {
    var typeClass = type == "message" ? "received" : "sent";
    var template = $(`#template .message.${typeClass}`).clone();
    template.find(".baloon").html(content);
    $("#chat-body").append(template);
  },
  promptInput: (mask, name) => {
    // console.log(`Solicitar entrada do usuário (máscara: ${mask}, nome: ${name})`);

    Bot.inputElement.on("input", () => {
      Bot.fieldVal = Bot.inputElement.val();
      console.log(`Valor do campo atualizado: ${Bot.fieldVal}`);
    });
  },
  promptSelect: (options, name) => {
    // console.log(`Solicitar seleção do usuário (opções: ${options}, nome: ${name})`);
  },
};

Bot.init();
