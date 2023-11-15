class TemplateManager {
  constructor() {
    this.data = data;
    this.page = this.data.page;
    this.pagePath = includePath + "templates/manager/pages/";
    this.componentPath = includePath + "templates/manager/components/";
    this.scriptsPath = includePath + "scripts/manager/";
    this.modules = [];
  }

  handlePage(page, fetchComponents = false) {
    $.get(`${this.pagePath}${page}.tpl`, (sourceContent) => {
      const template = Handlebars.compile(sourceContent);
      $(".jsPageTitle").html(page);
      $(".jsPageContent").append(template());
      // this.getScripts(page);
      if (fetchComponents) {
        this.composeStructure(page, sourceContent);
      }
    });
  }

  getScripts(page) {
    $.getScript(`${this.scriptsPath}${page}.js`, function () {
      /* switch (page) {
        case "dashboard":
          var pageClass = new Dashboard();
          break;
        case "pages":
          var pageClass = new Pages();
          break;

        default:
          break;
      }
      return pageClass; */
    });
  }

  composeStructure(page) {
    $.get(`${this.scriptsPath}map.json`, (pageMap) => {
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
  templateManager.getScripts(templateManager.page);
});

// var cardContent = { title: "Bootstrap Card with Handlebars", content: "This is a test content." };
// templateManager.handleComponent("card", cardContent);
