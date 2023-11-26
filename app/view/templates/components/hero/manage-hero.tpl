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
                <button type="button" class="btn btn-outline-primary text-right jsAddCard">
                    <i class="fas fa-plus"></i> card
                </button>
            </div>
            <div class="modal-body">
                <div class="accordion jsCards">
                    {{#each data.cards}}
                    <div class="accordion-item jsCardItem" id="card-{{@index}}">
                        <h2 class="accordion-header" id="cardHeader">
                            <button class="accordion-button jsCardTitle" type="button" data-bs-toggle="collapse"
                                data-bs-target="#cardCollapse-{{@index}}" aria-expanded="true"
                                aria-controls="cardCollapse-{{@index}}">
                                {{cardTitle}}
                            </button>
                        </h2>
                        <div id="cardCollapse-{{@index}}" class="accordion-collapse collapse"
                            aria-labelledby="cardHeader" data-bs-parent="#card-{{@index}}">
                            <div class="accordion-body row">
                                <div class="my-2 col-lg-4">
                                    <label for="cardIcon" class="form-label">Ícone do Card</label>
                                    <input type="text" class="form-control" name="cardIcon" placeholder="Ícone do Card"
                                        value="{{cardIcon}}">
                                </div>
                                <div class="my-2 col-lg-4">
                                    <label for="cardTitle" class="form-label">Título do Card</label>
                                    <input type="text" class="form-control" name="cardTitle"
                                        placeholder="Título do Card" value="{{cardTitle}}">
                                </div>
                                <div class="my-2 col-lg-4">
                                    <label for="cardText" class="form-label">Texto do Card</label>
                                    <textarea class="form-control" name="cardText"
                                        placeholder="Texto do Card">{{cardText}}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{/each}}
                </div>
                <div class="jsCardExample d-none">
                    <div class="accordion-item jsCardItem  id=" example-{{@index}}">
                        <h2 class="accordion-header" id="cardHeader">
                            <button class="accordion-button jsCardTitle" type="button" data-bs-toggle="collapse"
                                data-bs-target="#exampleCollapse-{{@index}}" aria-expanded="true"
                                aria-controls="exampleCollapse-{{@index}}">
                                Novo card
                            </button>
                        </h2>
                        <div id="exampleCollapse-{{@index}}" class="accordion-collapse collapse"
                            aria-labelledby="cardHeader" data-bs-parent="#example-{{@index}}">
                            <div class="accordion-body row">
                                <div class="my-2 col-lg-4">
                                    <label for="cardIcon" class="form-label">Ícone do Card</label>
                                    <input type="text" class="form-control" name="cardIcon" placeholder="Ícone do Card"
                                        value="{{cardIcon}}">
                                </div>
                                <div class="my-2 col-lg-4">
                                    <label for="cardTitle" class="form-label">Título do Card</label>
                                    <input type="text" class="form-control" name="cardTitle"
                                        placeholder="Título do Card" value="{{cardTitle}}">
                                </div>
                                <div class="my-2 col-lg-4">
                                    <label for="cardText" class="form-label">Texto do Card</label>
                                    <textarea class="form-control" name="cardText"
                                        placeholder="Texto do Card">{{cardText}}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outnline-default" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-outline-dark">Salvar mudanças</button>
            </div>
        </div>
    </div>
</div>