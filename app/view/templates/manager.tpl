<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Gerenciador de conteúdo</title>
    <script>
        const data = {$data};
        const includePath = "{$includePath}";
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">

    <!-- Adicione os links para os arquivos necessários do Bootstrap 5 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap5.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap5.min.js"></script>

    <!-- Incluir o Axios via CDN -->
    <script src="https://cdn.jsdelivr.net/npm/axios@1.6.7/dist/axios.min.js"></script>

    <!-- Incluir o axios-auth-refresh via CDN -->
    <script src="https://cdn.jsdelivr.net/npm/axios-auth-refresh@3.3.6/dist/index.min.js"></script>

    <!-- Popper.js -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"
        integrity="sha512-uKQ39gEGiyUJl4AI6L+ekBdGKpGw4xJ55+xyJG7YFlJokPNYegn9KwQ3P8A7aFQAUtUsAQHep+d/lrGqrbPIDQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- Handlebars.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.8/handlebars.min.js"
        integrity="sha512-E1dSFxg+wsfJ4HKjutk/WaCzK7S2wv1POn1RRPGh8ZK+ag9l244Vqxji3r6wgz9YBf6+vhQEYJZpSjqWFPg9gg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- Toastify.js -->
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

    <script src="{$includePath}scripts/manager/helpers/Functions.js"></script>
    <script src="{$includePath}scripts/manager/model/Login.js"></script>
    <script src="{$includePath}scripts/manager/model/TemplateManager.js"></script>
    <script src="{$includePath}scripts/manager/app.js"></script>
    <link rel="stylesheet" href="{$includePath}styles/manager/manager.css">
</head>

<body>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Gerenciador - Facillita</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    {* <li class="nav-item active" d-none>
                        <a class="nav-link"
                            href="/manager?data={base64_encode(json_encode(["page" => "dashboard"]))}">Página Inicial
                            <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item" d-none>
                        <a class="nav-link"
                            href="/manager?data={base64_encode(json_encode(["page" => "pages"]))}">Páginas</a>
                    </li> *}
                    <li class="nav-item">
                        <a class="nav-link"
                            href="/manager?data={base64_encode(json_encode(["page" => "leads"]))}">Leads</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="container mt-4">
        <div class="jsPageTitle d-none">
        </div>
        <div class="jsPageContent">
        </div>
        {* <div class="card">
            <div class="card-header jsPageTitle">
            </div>
            <div class="card-body jsPageContent">
            </div>
        </div> *}
    </div>
</body>

</html>