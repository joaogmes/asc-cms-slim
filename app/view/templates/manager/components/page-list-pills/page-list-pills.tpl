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
                <a class=" nav-link border rounded jsPageLink" data-id="{{id}}" href="#">{{name}}</a>
            </li>
            {{/each}}
            <li class="nav-item jsPage my-1" data-title="teste">
                <a class=" nav-link border rounded jsPageLink" data-id="{{id}}" href="#">teste</a>
            </li>
            <li class="nav-item jsPage my-1" data-title="abc">
                <a class=" nav-link border rounded jsPageLink" data-id="{{id}}" href="#">abc</a>
            </li>
        </ul>
    </div>
</div>
<div class="container p-0 d-flex flex-row-reverse">
    <button class="btn btn-outline-dark my-3 ">Nova página</button>
</div>