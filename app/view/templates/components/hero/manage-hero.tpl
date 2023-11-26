<div class="modal fade manage-hero" tabindex="-1" aria-labelledby="manage-hero-label" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="manage-hero-label">Componente {{component.name}}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="my-2">
                        <label for="titulo-cta" class="form-label">Título do CTA</label>
                        <input type="text" class="form-control" id="titulo-cta" placeholder="Aqui vai o título"
                            value="{{data.ctaTitle}}">
                    </div>
                    <div class="my-2">
                        <label for="imagem-cta" class="form-label">Imagem</label>
                        <input type="text" class="form-control" id="imagem-cta" placeholder="URL da imagem"
                            value="{{data.ctaImage}}">
                    </div>
                </form>
            </div>
            <div class="modal-header">
                <h5 class="modal-title" id="manage-hero-label">Cards:</h5>
                <button type="button" class="btn btn-primary text-right">Adicionar</button>
            </div>
            <div class="modal-body jsCards">
                <div class="accordion">
                    {{#each data.cards}}
                    <div class="accordion-item jsCardItem" id="card-{{@index}}">
                        <!-- Accordion header with icons -->
                        <h2 class="accordion-header" id="cardHeader">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#cardCollapse-{{@index}}" aria-expanded="true"
                                aria-controls="cardCollapse-{{@index}}">
                                {{cardTitle}}
                            </button>
                        </h2>
                        <!-- Accordion content with inputs -->
                        <div id="cardCollapse-{{@index}}" class="accordion-collapse collapse"
                            aria-labelledby="cardHeader" data-bs-parent="#card-{{@index}}">
                            <div class="accordion-body row">
                                <div class="my-2 col-lg-4">
                                    <label for="cardIcon" class="form-label">Ícone do Card</label>
                                    <input type="text" class="form-control" id="cardIcon" placeholder="Ícone do Card" value="{{cardIcon}}">
                                </div>
                                <div class="my-2 col-lg-4">
                                    <label for="cardTitle" class="form-label">Título do Card</label>
                                    <input type="text" class="form-control" id="cardTitle" placeholder="Título do Card" value="{{cardTitle}}">
                                </div>
                                <div class="my-2 col-lg-4">
                                    <label for="cardText" class="form-label">Texto do Card</label>
                                    <textarea class="form-control" id="cardText" placeholder="Texto do Card">{{cardText}}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{/each}}
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary">Salvar mudanças</button>
            </div>
        </div>
    </div>
</div>