<div class="card">
    <div class="card-header bg-dark text-white">
        Busca de páginas
    </div>
    <div class="card-body">
        <input class="form-control mr-sm-2" type="search" placeholder="Pesquisar página..."
            aria-label="Pesquisar página...">
        <ul class="nav nav-pills flex-column mt-2">
            {{#each items}}
            <li class="nav-item">
                <a class="nav-link border rounded jsPageLink" data-id="{{id}}" href="#">{{name}}</a>
            </li>
           {{/each}}
        </ul>
    </div>
</div>
<div class="container p-0 d-flex flex-row-reverse">
    <button class="btn btn-primary bg-dark my-3 ">Nova página</button>
</div>