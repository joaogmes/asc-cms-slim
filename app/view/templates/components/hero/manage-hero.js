const ManageHero = {
  init: () => {
    console.log("Start hero manager!");
    ManageHero.openModal();

    $(`.jsComponentLink[data-path="hero"]`).on("click", function (e) {
      e.preventDefault();
      e.stopPropagation();
      ManageHero.openModal();
      return false;
    });

    $("body").on("click", ".manage-hero .jsAddCard", function (e) {
      e.preventDefault();
      e.stopPropagation();

      var example = $(".manage-hero .jsCardExample");
      var lastCard = $(".manage-hero .jsCards .accordion-item:last");

      var lastCardTitle = lastCard.find(".jsCardTitle").text();
      var exampleTitle = example.find(".jsCardTitle").text();

      if (lastCardTitle === exampleTitle) {
        console.log("O último card já tem o mesmo título do exemplo. Não adicionando novo card.");
      } else {
        console.log("Duplicando exemplo");
        $(".manage-hero .jsCards").append(example.html());
      }

      return false;
    });

    $("body").on("keyup, change, keydown, keypress", ".manage-hero .jsCardItem input[name='cardTitle']", function (e) {
      // e.preventDefault();
      // e.stopPropagation();
      var elem = $(this);
      console.log(elem.val());
      elem.parents('.jsCardItem').find('.jsCardTitle').html(elem.val());
      // return false;
    });
  },
  openModal: () => {
    $(".manage-hero").modal("show");
  },
  closeModal: () => {
    $(".manage-hero").modal("hide");
  },
};

ManageHero.init();
