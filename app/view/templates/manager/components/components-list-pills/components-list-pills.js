if (typeof ComponentListPills === "undefined") {
  ComponentListPills = {
    init: () => {
      //console.log("components-list-pills");

      //console.log(window.components);

      $(".jsSortableList").sortable({
        update: function (event, ui) {
          /*  //console.log(event);
        //console.log(ui); */
          ComponentListPills.getUpdatedOrder();
        },
      });

      $("body").on("click", ".components-list-pills .jsComponentLink", function (e) {
        e.preventDefault();
        e.stopPropagation();
        var path = $(this).data("path");
        var id = $(this).data("id");
        var scriptPath = `./app/view/templates/components/${path}/manage-${path}.js`;
        /* var globalModules = window.modules;

      if (!globalModules.includes(scriptPath)) {
        pageClass.manageComponent(path, window.components[id], ".components-list-pills .jsManagement");
      } */
        pageClass.manageComponent(path, window.components[id], ".components-list-pills .jsManagement");
      });
    },
    getUpdatedOrder: () => {
      $(".components-list-pills .jsSortableList .jsSortableItem").each(function (index) {
        var itemId = $(this).data("id");
        var itemOrder = $(this).data("order");
        if (itemOrder != index) {
          ComponentListPills.updateOrder(itemId, index);
        }
      });
    },
    updateOrder: (pageId, order) => {
      pageClass.updateComponentOrder(pageId, order).then((result) => {
        if (result.status == "success") {
          Toastify({
            text: "A ordem foi alterada com sucesso!",
            close: true,
          }).showToast();
          $(`.components-list-pills .jsSortableItem[data-id="${pageId}"]`).attr("data-order", order);
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
} else {
  ComponentListPills.init();
}
