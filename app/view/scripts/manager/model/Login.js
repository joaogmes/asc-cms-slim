class Login {
  constructor() {
    this.baseURL = "/";
    this.loginEndpoint = "api/auth";
    this.checkEndpoint = "api/auth/check";

    // Configuração do Axios
    axios.defaults.baseURL = this.baseURL;
  }

  async login(user, pass) {
    try {
      const response = await axios.post(this.loginEndpoint, {
        client_login: user,
        client_password: pass,
      });

      const token = response.data.token;
      this.setAccessToken(token);

      return token;
    } catch (error) {
      console.error("Erro no login:", error);
      throw error;
    }
  }

  async checkToken(token) {
    try {
      const response = await axios.post(this.checkEndpoint, { token });
      return response.data;
    } catch (error) {
      console.error("Erro ao verificar o token:", error);
      throw error;
    }
  }

  getAccessToken() {
    return localStorage.getItem("access_token"); // Substitua por sua lógica de armazenamento
  }

  setAccessToken(token) {
    localStorage.setItem("access_token", token); // Substitua por sua lógica de armazenamento
  }

  async makeAuthenticatedRequest() {
    try {
      const currentToken = this.getAccessToken();

      if (!currentToken) {
        console.error("Token de acesso não disponível.");
        return;
      }

      axios.defaults.headers.common["Authorization"] = `Bearer ${currentToken}`;
      sessionStorage.setItem("access_token", currentToken);

      const urlParams = new URLSearchParams(window.location.search);
      const redirectToUrl = urlParams.get("redirect");

      if (redirectToUrl) {
        // window.location.href = redirectToUrl;
        console.log("redirect 1");
      } else {
        // window.location.href = "/manager";
        console.log("redirect 2");
      }
    } catch (error) {
      console.error("Erro na requisição:", error);
    }
  }

  async getSessionToken() {
    try {
      const sessionToken = sessionStorage.getItem("access_token");

      if (sessionToken) {
        const isValidToken = await this.checkToken(sessionToken);

        if (isValidToken.status) {
          return sessionToken;
        } else {
          sessionStorage.removeItem("access_token");
          return null;
        }
      }

      return null;
    } catch (error) {
      console.error("Erro ao obter o token da sessão:", error);
      return null;
    }
  }
}
