const ComponentListPills = {
  init: () => {
    console.log("components-list-pills");

    $(".jsSortableList").sortable({
      update: function (event, ui) {
        /*  console.log(event);
        console.log(ui); */
        ComponentListPills.getUpdatedOrder();
      },
    });

    $(".jsComponentLink").on("click", function (e) {
      e.preventDefault();
      e.stopPropagation();
      var path = $(this).data("path");
      var scriptPath = `./app/view/templates/components/${path}/manage-${path}.js`;
      var globalModules = window.modules;

      if (!globalModules.includes(scriptPath)) {
        pageClass.manageComponent(path, {}, ".jsManagement");
      }
    });
  },
  getUpdatedOrder: () => {
    $(".jsSortableList .jsSortableItem").each(function (index) {
      var itemId = $(this).data("id");
      var itemOrder = $(this).data("order");
      if (itemOrder != index) {
        ComponentListPills.updateOrder(itemId, index);
      }
    });
  },
  updateOrder: (pageId, order) => {
    pageClass.updateComponentOrder(pageId, order).then((result) => {
      console.log(result);
      if (result.status == "success") {
        Toastify({
          text: "A ordem foi alterada com sucesso!",
          close: true,
        }).showToast();
        $(`.jsSortableItem[data-id="${pageId}"]`).attr("data-order", order);
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
  showSuccessToast: () => {
    Toastify({
      text: "A ordem foi alterada com sucesso!",
      close: true,
    }).showToast();
  },
};

ComponentListPills.init();
