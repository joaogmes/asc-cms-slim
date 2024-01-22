const Bot = {
    sequence,
    init: () => {
        console.log("Bot started");
        console.log(Bot.sequence);
    },
    showError: (error) => {
    },
    postLogin: (login, password) => {
        var loginData = { login: login, password: password };
        $.post("./login", JSON.stringify(loginData), function (data, status) {
            if(data){
                window.location.href="./manager";
            }else{
                Login.showError("wrong");
            }
        });
    }
}

Bot.init();