class PagesController extends TemplateManager {
  constructor() {
    super();
    console.log("Pages class");
  }

  test() {
    console.log("worked");
    $("html").css("background", "red");
  }

  listPages() {
    return new Promise((resolve, reject) => {
      var pagesData = {
        client_token: "123",
      };

      this.serviceRequest("/api/pages", pagesData, (result) => {
        resolve(result);
      });
    });
  }
}