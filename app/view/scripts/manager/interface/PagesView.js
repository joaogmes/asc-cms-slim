window.components = [];
var pageClass = new PagesController();
pageClass.listPages().then((pageList) => {
  pageClass.handleComponent("page-list-pills", { items: pageList }, ".fit-page-list-pills");
});