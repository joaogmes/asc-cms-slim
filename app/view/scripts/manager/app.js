class TemplateManager {
  constructor() {
    this.data = data;
    this.page = this.data.page;
    this.pagePath = includePath + "templates/manager/pages/";
    this.componentPath = includePath + "templates/manager/components/";
    this.componentTemplatePath = includePath + "templates/components/";
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
      if (fetchComponents) {
        this.composeStructure(page, sourceContent);
      }
    });
  }

  getViews(viewName) {
    this.includeScript(`${this.viewPath}${viewName}.js`);
  }

  getControllers(page) {
    var controllerName = `${capitalizeFirstLetter(page)}Controller`;
    var viewName = `${capitalizeFirstLetter(page)}View`;

    var self = this;

    this.includeScript(`${this.controllerPath}${controllerName}.js`, function () {
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
    $.get(`${this.componentPath}${component}/${component}.tpl`, (sourceContent) => {
      const template = Handlebars.compile(sourceContent);
      const renderedContent = template(content);

      if (addition) {
        $(`${target}`).append(renderedContent);
      } else {
        $(`${target}`).html(renderedContent);
      }

      var modulePath = `${this.componentPath}${component}/${component}.js`;
      var headerScript = $('script[src="' + modulePath + '"]');
      headerScript = $('script[src="' + modulePath + '"]').remove();
      //console.log(headerScript.length);

      var cssPath = `${this.componentPath}${component}/${component}.css`;
      var existingCssLink = $('link[href="' + cssPath + '"]');
      if (existingCssLink.length === 0) {
        $("<link>").appendTo("head").attr({ type: "text/css", rel: "stylesheet", href: cssPath });
      }

      this.modules.push(modulePath);
      window.modules = this.modules;
      this.includeScript(modulePath);
    });
  }

  manageComponent(component, content, target, addition = false) {
    $.get(`${this.componentTemplatePath}${component}/manage-${component}.tpl`, (sourceContent) => {
      const template = Handlebars.compile(sourceContent);
      //console.log(component, content, target, addition);
      const renderedContent = template(content);
      if (addition) {
        $(`${target}`).append(renderedContent);
      } else {
        $(`${target}`).html(renderedContent);
      }

      var modulePath = `${this.componentTemplatePath}${component}/manage-${component}.js`;
      var headerScript = $('script[src="' + modulePath + '"]');
      headerScript = $('script[src="' + modulePath + '"]').remove();
      //console.log(headerScript.length);

      this.modules.push(modulePath);
      window.modules = this.modules;
      this.includeScript(modulePath);
    });
  }

  includeScript(src, callback) {
    var script = document.createElement("script");
    script.src = src;
    script.onload = callback;
    document.head.appendChild(script);
  }

  serviceRequest(endpoint, data, callback) {
    $.post({
      url: endpoint,
      data: JSON.stringify(data),
      contentType: "application/json",
      success: function (response) {
        // var result = { status: "success", response: response };
        var result = response;
        callback(result);
      },
      error: function (error) {
        var result = { status: "error", response: error };
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
