<div class="modal fade insert-components" tabindex="-1" aria-labelledby="insert-components-label" aria-hidden="true" data-page="{{ page }}">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="insert-components-label">Adicionar componentes</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="inputTypeSelector" class="form-label">Escolha um componente:</label>
                    <select class="form-select" name="component">
                        {{#each components}}
                        <option value="{{ id }}">{{ name }}</option>
                        {{/each}}
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outnline-default" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-outline-dark jsSave">Salvar mudanças</button>
            </div>
        </div>
    </div>
</div>