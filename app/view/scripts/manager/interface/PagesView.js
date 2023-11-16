var pageClass = new PagesController();
pageClass.listPages().then((pageList) => {
  console.log(pageList);
  pageClass.handleComponent("page-list-pills", { items: pageList.response }, ".fit-page-list-pills");
});