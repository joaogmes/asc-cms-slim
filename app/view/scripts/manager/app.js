$(document).ready(function () {
  const loginInstance = new Login();
  loginInstance.getSessionToken().then((sessionToken) => {
    if (sessionToken) {
      console.log("Usuário já logado. Token:", sessionToken);
      loginInstance.makeAuthenticatedRequest();
    } else {
      window.location.href = "/login";
    }
  });

  const templateManager = new TemplateManager();
  templateManager.handlePage(templateManager.page, true);
  templateManager.getControllers(templateManager.page);
});
