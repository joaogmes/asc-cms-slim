<div class="components-list-pills">
    <div class="row">
        <div class="container">
            Componentes da página {{ page.text }}
        </div>
    </div>
    <div class="row">
        <div class="card-body">
            <ul class="nav nav-pills flex-column mt-2 jsSortableList">
                {{#each items}}
                <li class="nav-item my-2 border rounded jsSortableItem py-1 px-3 item-container"
                    data-id="{{component.id}}" data-order="{{component.order}}">
                    <div class="label">
                        {{component.name}}
                    </div>
                    <div class="actions">
                        <button class="btn btn-light text-primary btn-sm jsComponentLink" data-path="{{component.path}}"
                            data-id="{{component.id}}">
                            <i class="fa-solid fa-pen-to-square"></i> editar
                        </button>
                        <button href="#" class="btn btn-light text-danger btn-sm jsRemoveComponent">
                            <i class="fa-regular fa-rectangle-xmark"></i> remover
                        </button>
                    </div>
                </li>
                {{/each}}
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="container p-0 d-flex flex-row-reverse">
            <button class="btn btn-outline-primary my-3 jsAddComponent" data-page="{{ page.id }}"><i
                    class="fas fa-plus"></i> componente</button>
        </div>
    </div>
    <div class="jsManagement"></div>
</div>