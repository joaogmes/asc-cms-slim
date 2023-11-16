PageListPills = {
  init: () => {
    console.log("page-list-pills init");
    /* watchers */
    $("body").on("click", ".jsPageLink", function (e) {
      e.preventDefault();
      e.stopPropagation();
      var pageId = $(this).data("id");
      var pageText  = $(this).text();
      pageClass.getPageComponents(pageId).then((components) => {
        console.log(components);
        pageClass.handleComponent("components-list-pills", { page: pageText, items: components.response }, ".fit-content");
      });
      return false;
    });
  },
};
PageListPills.init();
