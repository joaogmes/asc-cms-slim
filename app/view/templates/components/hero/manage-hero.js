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
  },
  openModal: () => {
    $(".manage-hero").modal("show");
  },
  closeModal: () => {
    $(".manage-hero").modal("hide");
  },
};

ManageHero.init();
