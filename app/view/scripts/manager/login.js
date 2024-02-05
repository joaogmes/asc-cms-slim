class LoginInterface {
  constructor(loginClass) {
    const loginForm = document.getElementById("loginForm");

    loginForm.addEventListener("submit", async (event) => {
      event.preventDefault();

      const loginUsuario = document.getElementById("loginUsuario").value;
      const senhaUsuario = document.getElementById("senhaUsuario").value;

      try {
        const token = await loginClass.login(loginUsuario, senhaUsuario);

        if (token) {
          loginClass.setAccessToken(token);
          sessionStorage.setItem("access_token", token);
          window.location.href = "/manager";
        } else {
          console.error("Erro ao obter token durante o login.");
          var type = "error";
          Toastify({
            text: "Login não autorizado",
            duration: 3000,
            gravity: "top",
            position: "right",
            backgroundColor: type === "error" ? "#ff6347" : "#2ecc71",
          }).showToast();
        }
      } catch (error) {
        console.error("Erro durante o login:", error);
      }
    });
  }
}

$(document).ready(function () {
  const login = new Login();
  login.getSessionToken().then((sessionToken) => {
    if (sessionToken) {
      console.log("Usuário já logado. Token:", sessionToken);
      window.location.href = "/manager";
    } else {
      const interface = new LoginInterface(login);
    }
  });
});
