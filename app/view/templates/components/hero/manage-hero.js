if (typeof ManageHero === "undefined") {
  const ManageHero = {
    id: $(".manage-hero").data("id"),
    init: () => {
      console.log("Start hero manager!");
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
        ManageHero.updateForm();
        return false;
      });
    },
    openModal: () => {
      $(".manage-hero").modal("show");
    },
    closeModal: () => {
      $(".manage-hero").modal("hide");
    },
    updateForm: () => {
      var updateData = {};

      updateData.ctaTitle = $(".manage-hero").find(`input[name="titulo-cta"]`).val();
      updateData.ctaImage = $(".manage-hero").find(`input[name="imagem-cta"]`).val();

      updateData.cards = [];

      $(".manage-hero .jsCards .jsCardItem").each(function (e) {
        var card = $(this);
        var cardData = {};

        cardData.cardIcon = card.find(`input[name='cardIcon']`).val();
        cardData.cardTitle = card.find(`input[name='cardTitle']`).val();
        cardData.cardText = card.find(`input[name='cardText']`).val();
        cardData.cardButtonText = card.find(`input[name='cardButtonText']`).val();
        cardData.cardButtonLink = card.find(`input[name='cardButtonLink']`).val();

        updateData.cards.push(cardData);
      });

      console.log(updateData);
      return false;
    },
    editPageComponent: (id, data) => {
      pageClass.updateComponentOrder(id, data).then((result) => {
        if (result.status == "success") {
          Toastify({
            text: "A ordem foi alterada com sucesso!",
            close: true,
          }).showToast();
        } else {
          Toastify({
            text: "Não foi possível alterar a ordem no momento!",
            close: true,
            style: {
              background: "#f60",
            },
          }).showToast();
        }
      });
    },
  };

  ManageHero.init();
} else {
  ManageHero.init();
}
