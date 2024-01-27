const Bot = {
  chatSequence,
  inputElement: $("#message-input"),
  field: null,
  fieldVal: null,
  init: () => {
    console.log("Bot started");
    console.log(Bot.chatSequence);

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
        Bot.displayMessage(step.content);
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
  displayMessage: (content) => {
    console.log(`Mensagem exibida: ${content}`);
  },
  promptInput: (mask, name) => {
    console.log(`Solicitar entrada do usuário (máscara: ${mask}, nome: ${name})`);
  },
  promptSelect: (options, name) => {
    console.log(`Solicitar seleção do usuário (opções: ${options}, nome: ${name})`);
  },
};

Bot.init();
