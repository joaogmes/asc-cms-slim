var pageClass = new PagesController();
pageClass.listPages().then((pageList) => {
  console.log(pageList);
});
// this.getControllers(page);
// var cardContent = { title: "Bootstrap Card with Handlebars", content: "This is a test content." };
// templateManager.handleComponent("card", cardContent);
