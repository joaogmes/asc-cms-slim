<div class="row">
    <div class="container">
        Componentes da página {{ page}}
    </div>
</div>
<div class="row">
    <div class="card-body">
        <ul class="nav nav-pills flex-column mt-2">
            {{#each items}}
            <li class="nav-item my-2">
                <a class="nav-link border rounded jsComponentLink" data-id="{{id}}" href="#">{{component.name}}</a>
            </li>
            {{/each}}
        </ul>
    </div>
</div>
<div class="row">
    <div class="container p-0 d-flex flex-row-reverse">
        <button class="btn btn-primary my-3 ">Novo componente</button>
    </div>
</div>