PageListPills = {
  init: () => {
    console.log("page-list-pills init");
    $("body").on("click", ".jsPageLink", function (e) {
      e.preventDefault();
      e.stopPropagation();
      var pageId = $(this).data("id");
      var pageText = $(this).text();
      pageClass.getPageComponents(pageId).then((components) => {
        components.forEach((componentItem) => {
          window.components = window.components || {};
          window.components[componentItem.component.id] = componentItem;
        });
        pageClass.handleComponent("components-list-pills", { page: pageText, items: components }, ".fit-content");
      });
      return false;
    });
  },
};
PageListPills.init();
