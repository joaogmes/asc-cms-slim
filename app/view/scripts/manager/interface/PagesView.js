window.components = [];
var pageClass = new PagesController();
window.reloadPages = () => {
  pageClass.listPages().then((pageList) => {
    pageClass.handleComponent("page-list-pills", { items: pageList }, ".fit-page-list-pills");
  });
}
window.reloadPages();