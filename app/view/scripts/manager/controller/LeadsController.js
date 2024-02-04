class LeadsController extends TemplateManager {
  constructor() {
    super();
    //console.log("Pages class");
  }

  test() {
    //console.log("worked");
    $("html").css("background", "red");
  }

  listPages() {
    return new Promise((resolve, reject) => {
      var pagesData = {
        client_token: "123",
        method: "listPages",
      };

      this.serviceRequest("/api/leads", pagesData, (result) => {
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

      this.serviceRequest("/api/leads", pagesData, (result) => {
        resolve(result);
      });
    });
  }

  updateComponentOrder(pageComponentId, order) {
    return new Promise((resolve, reject) => {
      var pagesData = {
        client_token: "123",
        method: "editPageComponent",
        pageComponent: pageComponentId,
        updateData: {
          order,
        },
      };

      this.serviceRequest("/api/component", pagesData, (result) => {
        resolve(result);
      });
    });
  }

  editPageComponent(pageComponentId, data) {
    return new Promise((resolve, reject) => {
      var pagesData = {
        client_token: "123",
        method: "editPageComponent",
        pageComponent: pageComponentId,
        updateData: data,
      };

      this.serviceRequest("/api/component", pagesData, (result) => {
        resolve(result);
      });
    });
  }

  insertPageComponent(pageId, componentId) {
    return new Promise((resolve, reject) => {
      var pagesData = {
        client_token: "123",
        method: "insertPageComponent",
        pageId: pageId,
        componentId: componentId,
      };

      this.serviceRequest("/api/component", pagesData, (result) => {
        resolve(result);
      });
    });
  }

  listComponents() {
    return new Promise((resolve, reject) => {
      var pagesData = {
        client_token: "123",
        method: "listComponents",
      };

      this.serviceRequest("/api/component", pagesData, (result) => {
        resolve(result);
      });
    });
  }
}
