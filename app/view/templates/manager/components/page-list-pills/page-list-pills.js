PageListPills = {
  init: () => {
    console.log("page-list-pills init");
    /* watchers */
    $("body").on("click", ".jsPageLink", function (e) {
      e.preventDefault();
      e.stopPropagation();
      var pageId = $(this).data("id");
      pageClass.getPageComponents(pageId).then((components) => {
        console.log(components);
        // pageClass.handleComponent("page-list-pills", { items: pageList.response }, ".fit-page-list-pills");
      });
      return false;
    });
  },
};
PageListPills.init();
