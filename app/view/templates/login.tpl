{include file="bs-header.tpl" login=true}
{* <section class="site-menu">
    {include file="site-menu.tpl"}
</section> *}
<section class="login-section">
    <div class="container py-5">
        <span class="fs-3 mx-auto d-flex justify-content-center text-center">Faça login para continuar</span>
        <div class="d-flex col-md-6 mx-auto mt-5 p-4 bg-light rounded-3 shadow-lg text-center">
            <form class="col-12">
                <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example1">Seu login</label>
                    <input type="email" id="form2Example1" name="login" class="form-control" />
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example2">Sua senha</label>
                    <input type="password" id="form2Example2" name="password" class="form-control" />
                </div>

                <button type="button" class="btn btn-primary btn-block mb-4 loginAction">Acessar</button>
                <a type="button" class="btn btn-default btn-block mb-4" href="./">Voltar para o site</a>
            </form>
        </div>
    </div>
</section>
<section class="feedback-section">
    <div class="modal fade" id="feedbackModal" tabindex="-1" aria-labelledby="feedbackModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="feedbackModalLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
                </div>
                <div class="modal-body">
                    <p></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
</section>
{include file="bs-footer.tpl" login=true}