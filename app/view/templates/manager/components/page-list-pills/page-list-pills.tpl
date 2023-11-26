<div class="card page-list-pills">
    <div class="card-header bg-dark text-white">
        Busca de páginas
    </div>
    <div class="card-body">
        <input class="form-control mr-sm-2 jsSeachPage" type="search" placeholder="Pesquisar página..."
            aria-label="Pesquisar página...">
        <ul class="nav nav-pills flex-column mt-2">
            {{#each items}}
            <li class="nav-item jsPage my-1" data-title="{{name}}">
                <a class=" nav-link text-dark border rounded jsPageLink" data-id="{{id}}" href="#">{{name}}</a>
            </li>
            {{/each}}
        </ul>
    </div>
</div>
<div class="container p-0 d-flex flex-row-reverse">
<button class="btn btn-outline-dark my-3 "><i class="fas fa-plus"></i> página</button>
</div>