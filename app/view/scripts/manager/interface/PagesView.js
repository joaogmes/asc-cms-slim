var pageClass = new PagesController();
pageClass.listPages().then((pageList) => {
  console.log(pageList);
  pageClass.handleComponent("page-list-pills", { items: pageList }, ".fit-page-list-pills");
});