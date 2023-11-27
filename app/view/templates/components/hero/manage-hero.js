if (!typeof ManageHero === "undefined") {
  delete ManageHero;
}

var ManageHero = {
  id: $(".manage-hero").data("id"),
  tempComponent: null,
  init: () => {
    //console.log("Start hero manager!");
    ManageHero.openModal();

    // $("body").on("click", `.jsComponentLink[data-path="hero"]`, function (e) {
    //   e.preventDefault();
    //   e.stopPropagation();
    //   ManageHero.openModal();
    //   return false;
    // });

    $("body").on("click", ".manage-hero .jsAddCard", function (e) {
      e.preventDefault();
      e.stopPropagation();

      var example = $(".manage-hero .jsCardExample");
      var lastCard = $(".manage-hero .jsCards .accordion-item:last");

      var lastCardTitle = lastCard.find(".jsCardTitle").text();
      var exampleTitle = example.find(".jsCardTitle").text();

      if (lastCardTitle === exampleTitle) {
      } else {
        $(".manage-hero .jsCards").append(example.html());
      }

      return false;
    });

    $("body").on("keyup change keydown keypress", ".manage-hero .jsCardItem input[name='cardTitle']", function (e) {
      var elem = $(this);
      elem.parents(".jsCardItem").find(".jsCardTitle").html(elem.val());
    });

    $("body").on("click", ".manage-hero .jsSave", function (e) {
      e.preventDefault();
      e.stopPropagation();
      var id = $(this).parents(".manage-hero").data("id");
      ManageHero.updateForm(id);
      return false;
    });
  },
  openModal: () => {
    $(".manage-hero").modal("show");
  },
  closeModal: () => {
    $(".manage-hero").modal("hide");
  },
  updateForm: (id) => {
    var updateData = {};

    updateData.ctaTitle = $(".manage-hero").find(`input[name="titulo-cta"]`).val();
    updateData.ctaImage = $(".manage-hero").find(`input[name="imagem-cta"]`).val();

    updateData.cards = {};

    $(".manage-hero .jsCards .jsCardItem").each(function (index) {
      var card = $(this);
      var cardData = {};

      cardData.cardIcon = ManageHero.fixChars(card.find(`input[name='cardIcon']`).val());
      cardData.cardTitle = ManageHero.fixChars(card.find(`input[name='cardTitle']`).val());
      cardData.cardText = ManageHero.fixChars(card.find(`input[name='cardText']`).val());
      cardData.cardButtonText = ManageHero.fixChars(card.find(`input[name='cardButtonText']`).val());
      cardData.cardButtonLink = ManageHero.fixChars(card.find(`input[name='cardButtonLink']`).val());

      updateData.cards[index] = cardData;
    });

    ManageHero.tempComponent = updateData;
    console.log(updateData);

    ManageHero.editPageComponent(id, { data: /* btoa */(JSON.stringify(updateData)) });
    return false;
  },
  editPageComponent: (id, data) => {
    pageClass.editPageComponent(id, data).then((result) => {
      if (result.status == "success") {
        Toastify({
          text: "Componente editado!",
          close: true,
        }).showToast();
        window.components[id].data = ManageHero.tempComponent;
        console.log(window.components);
      } else {
        Toastify({
          text: "Não foi possível editar o componente!",
          close: true,
          style: {
            background: "#f60",
          },
        }).showToast();
      }
    });
  },
  fixChars: function (input) {
    const htmlEntityMap = {
      á: "&aacute;",
      é: "&eacute;",
      í: "&iacute;",
      ó: "&oacute;",
      ú: "&uacute;",
      à: "&agrave;",
      è: "&egrave;",
      ì: "&igrave;",
      ò: "&ograve;",
      ù: "&ugrave;",
      â: "&acirc;",
      ê: "&ecirc;",
      î: "&icirc;",
      ô: "&ocirc;",
      û: "&ucirc;",
      ã: "&atilde;",
      õ: "&otilde;",
      ñ: "&ntilde;",
      ç: "&ccedil;",
    };

    try {
      // Garante que input não é nulo ou indefinido e é uma string antes de usar replace
      const inputString = input != null && typeof input === "string" ? input : "";

      // Substitui caracteres especiais pelos equivalentes HTML
      const replacedText = inputString.replace(/[^\x00-\x7F]/g, (char) => {
        return char in htmlEntityMap ? htmlEntityMap[char] : char;
      });

      return replacedText;
    } catch (error) {
      console.error("Erro ao corrigir caracteres:", error);
      return input; // Retorna a string original em caso de erro
    }
  },
};

ManageHero.init();
