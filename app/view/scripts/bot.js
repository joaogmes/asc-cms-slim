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
      }, 3000);
    }
  },

  showError: (error) => {
    console.error(error);
  },

  processConversation: async (startIndex) => {
    for (let index = startIndex; index < Bot.chatSequence.length; index++) {
      const step = Bot.chatSequence[index];
      await Bot.handleStep(step);

      if (step.type === "input" || step.type === "select") {
        // Pause execution and wait for user input
        await new Promise((resolve) => {
          Bot.resolveInput = resolve;
        });
      }
    }
  },

  handleStep: (step) => {
    return new Promise((resolve) => {
      switch (step.type) {
        case "message":
          Bot.displayMessage(step.content, step.type);
          resolve();
          break;
        case "input":
          Bot.promptInput(step.mask, step.name, resolve);
          break;
        case "select":
          Bot.promptSelect(step.options, step.name, resolve);
          break;
        default:
          Bot.showError("Tipo de passo não suportado");
          resolve();
      }
    });
  },

  displayMessage: (content, type) => {
    var typeClass = type == "message" ? "received" : "sent";
    var template = $(`#template .message.${typeClass}`).clone();
    template.find(".baloon").html(content);
    $("#chat-body").append(template);
  },

  promptInput: (mask, name, resolve) => {
    $(`${Bot.inputElement}`).attr("data-name", name);
    $(`${Bot.submitElement}`).attr("data-name", name);

    if (mask) {
      $(`${Bot.inputElement}`).mask(mask);
    }

    $(`${Bot.submitElement}[data-name="${name}"]`).on("click", () => {
      Bot.userData[name] = $(`${Bot.inputElement}`).val();
      console.log(Bot.userData);
      console.log(`Valor do campo atualizado: ${Bot.userData}`);
    });

    Bot.resolveInput = () => {
      $(`${Bot.inputElement}`).off("input");
      resolve();
    };
  },

  promptSelect: (options, name, resolve) => {
    // Implement the logic for handling select prompts here
    // Call resolve() when user input is received
  },
};

// Inicie a conversa aqui
Bot.init();
