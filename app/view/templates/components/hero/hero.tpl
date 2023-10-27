<section id="hero">
    <div class="container my-5 py-5">
        <div class="row">
            <div class="col-md-6 text-center align-middle p-3">
                <h1 class="title fs-4 text-primary text-uppercase fw-bold">
                    Te ajudamos a antecipar recebíveis
                </h1>
                <h3 class="subtitle fs-6 fw-regular">
                    Apoiamos o <span class="text-primary">desenvolvimento</span> de <span
                        class="text-primary">pequenas</span> e <span class="text-primary">médias empresas</span>,
                    <span class="text-primary">otimizando</span> e <span class="text-primary">ampliando</span> as
                    opções
                    de
                    crédito por meio de um ambiente <span class="text-primary">mais</span> seguro e <span
                        class="text-primary">transparente</span> para todo os <span
                        class="text-primary">envolvidos</span>
                </h3>
                <img src="./img/antecipacao-recebiveis-fair-money.png" style="width:100%;max-width:350px">
            </div>
            <div class="col-md-6 form-container p-5"
                style="background-image:url('./img/form-background.png');background-size:100%;background-position:center;background-repeat:no-repeat;aspect-ratio:2/1">
                <form method="POST" class="leadForm my-2 p-3 bg-light rounded-1 shadow-lg mb-5">
                    <p class="fw-bolder">Cadastre-se agora grátis!</p>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1"
                                value="option1">
                            <label class="form-check-label mb-2" for="inlineRadio1">Sou empresa e quero crédito</label>
                        </div>
                        <div class="col-sm-6">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2"
                                value="option2">
                            <label class="form-check-label mb-2" for="inlineRadio2">Sou credor e quero crédito</label>
                        </div>
                    </div>
                    <input class="form-control mb-2" type="hidden" name="origin" value="cadastro">
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <input class="form-control mb-2" type="text" id="razaoSocial" name="razaoSocial"
                                placeholder="Razão Social" required="">
                        </div>
                        <div class="col-sm-6">
                            <input class="form-control mb-2" type="text" id="nomeResponsavel" name="nomeResponsavel"
                                placeholder="Nome do responsável" required="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <input class="form-control mb-2" type="text" id="cnpj" name="cnpj" placeholder="CNPJ"
                                required="" maxlength="18">
                        </div>
                        <div class="col-sm-6">
                            <input class="form-control mb-2" type="email" id="email" name="email" placeholder="E-mail"
                                required="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <input class="form-control mb-2" type="text" id="endereco" name="endereco"
                                placeholder="Endereço" required="">
                        </div>
                        <div class="col-sm-6">
                            <input class="form-control mb-2" type="tel" id="telefone" name="telefone"
                                placeholder="Telefone" required="" maxlength="20">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <input class="form-control mb-2" type="text" id="faturamento" name="faturamento"
                                placeholder="Faturamento Médio Mensal" required="">
                        </div>
                        <div class="col-sm-6">
                            <input class="form-control mb-2" type="text" id="atuação" name="setor"
                                placeholder="Setor de atuação (Agro, Indústria, etc)" required="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="checkboxGroup col-sm-9">
                            <div class="checkbox">
                                <input type="checkbox" name="politicas" required="">
                                <span>Li e concordo com as politicas de privacidade</span>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" name="newsletter">
                                <span>Aceito receber e-mails com novidades da Fair Money</span>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="enviarContainer flex-end mt-3">
                                <button class="enviar btn btn-primary btn-block col-12">Enviar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>