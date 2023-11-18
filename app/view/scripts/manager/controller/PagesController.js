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
        method: "listPages",
      };

      this.serviceRequest("/api/pages", pagesData, (result) => {
        resolve(result);
      });
    });
  }

  getPageComponents(pageId) {
    return new Promise((resolve, reject) => {
      var pagesData = {
        client_token: "123",
        method: "getPageComponents",
        page: pageId,
      };

      this.serviceRequest("/api/pages", pagesData, (result) => {
        resolve(result);
      });
    });
  }

  updateComponentOrder(pageComponentId, order) {
    return new Promise((resolve, reject) => {
      var pagesData = {
        client_token: "123",
        method: "updateComponentOrder",
        pageComponentId: pageComponentId,
        order: order
      };

      this.serviceRequest("/api/pages", pagesData, (result) => {
        resolve(result);
      });
    });
  }
}
