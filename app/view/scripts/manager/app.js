class TemplateManager {
  constructor() {
    this.data = data;
    this.page = this.data.page;
    this.pagePath = includePath + "templates/manager/pages/";
    this.componentPath = includePath + "templates/manager/components/";
    this.controllerPath = includePath + "scripts/manager/controller/";
    this.viewPath = includePath + "scripts/manager/interface/";
    this.managerPath = includePath + "scripts/manager/";
    this.modules = [];
  }

  handlePage(page, fetchComponents = false) {
    $.get(`${this.pagePath}${page}.tpl`, (sourceContent) => {
      const template = Handlebars.compile(sourceContent);
      $(".jsPageTitle").html(page);
      $(".jsPageContent").append(template());
      // this.getControllers(page);
      if (fetchComponents) {
        this.composeStructure(page, sourceContent);
      }
    });
  }

  getViews(viewName) {
    $.getScript(`${this.viewPath}${viewName}.js`, function () {
      console.log("getting view");
    });
  }

  getControllers(page) {
    var controllerName = `${capitalizeFirstLetter(page)}Controller`;
    var viewName = `${capitalizeFirstLetter(page)}View`;

    var self = this;

    $.getScript(`${this.controllerPath}${controllerName}.js`, function () {
      console.log("getting controller");
      self.getViews(viewName);
    });
  }

  composeStructure(page) {
    $.get(`${this.managerPath}map.json`, (pageMap) => {
      if (typeof pageMap[page] != "undefined") {
        for (const component in pageMap[page]) {
          this.handleComponent(component, pageMap[page][component], `.fit-${component}`);
        }
      }
    });
  }

  handleComponent(component, content, target, addition = false) {
    this.modules.push = `${this.componentPath}${component}/${component}.js`;
    $.get(`${this.componentPath}${component}/${component}.tpl`, (sourceContent) => {
      const template = Handlebars.compile(sourceContent);
      if (addition) {
        $(`${target}`).append(template(content));
      } else {
        $(`${target}`).html(template(content));
      }
    });
  }

  serviceRequest(endpoint, data, callback) {
    $.post({
      url: endpoint,
      data: JSON.stringify(data),
      contentType: "application/json",
      success: function (response) {
        var result = { status: "success", response: response };
        callback(result);
      },
      error: function (error) {
        var result = { status: "success", response: error };
        callback(result);
      },
    });
  }
}

function capitalizeFirstLetter(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

$(document).ready(function () {
  const templateManager = new TemplateManager();
  templateManager.handlePage(templateManager.page, true);
  templateManager.getControllers(templateManager.page);
});