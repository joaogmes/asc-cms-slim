if (!typeof InsertComponents === "undefined") {
  delete InsertComponents;
}

var InsertComponents = {
  id: $(".insert-components").data("id"),
  tempComponent: null,
  init: () => {
    InsertComponents.openModal();

    $("body").on("click", ".insert-components .jsSave", function (e) {
      e.preventDefault();
      e.stopPropagation();
      var selectedComponent = $(".insert-components").find('select[name="component"]');
      var page = $(".insert-components ").data("page");
      InsertComponents.insertComponent(page, selectedComponent.val());
      return false;
    });
  },
  openModal: () => {
    $(".insert-components").modal("show");
  },
  closeModal: () => {
    $(".insert-components").modal("hide");
  },
  insertComponent: (page, component) => {
    pageClass.insertPageComponent(page, component).then((result) => {
      if (result.status == "success") {
        Toastify({
          text: "Componente inserido!",
          close: true,
        }).showToast();
      } else {
        Toastify({
          text: "Não foi possível editar o componente!",
          close: true,
          style: {
            background: "#f60",
          },
        }).showToast();
      }

      InsertComponents.closeModal();
      $(".page-list-pills").find(`.jsPageLink[data-id='${page}']`).trigger("click");
    });
  },
};

InsertComponents.init();
