  <?php
  error_reporting(E_ALL);
  ini_set("display_errors", 1);

  if (!file_exists('./gerenciamento/modulos/cfg/credenciais.json')) {
    include('./templates/construcao/index.php');
    die();
  }

  include_once('./gerenciamento/modulos/cfg/conexao.php');
  include_once('./gerenciamento/modulos/cfg/funcoes.php');

  $credenciais = credenciais('frontend');
  extract($credenciais);
  $conexao = conectaBanco($hostname, $dbname, $username, $password);

  $server = $_SERVER['HTTP_HOST'] == 'localhost' ? 'https://localhost:8000/' : 'https://'.$_SERVER['HTTP_HOST'];

  $rawUri = $_SERVER['REQUEST_URI'];
  $uri = explode("/", $rawUri);

  foreach ($uri as $key => $value) {
    if (empty($uri[$key]) || $uri[$key] == 'fairmoney') {
      unset($uri[$key]);
    }
  }

  $uri = array_values($uri);
  $page = $uri[0];
  $allowedPages = array('', 'sobre', 'servico', 'vantagens', 'contato', 'cadastro');
  if (!in_array($page, $allowedPages)) {
    die('404');
  }

  $seo = crud_front('listar', 'seo', '', '', '', '');
  $header = crud_front('listar', 'header', '', '', '', '');
  $footer = crud_front('listar', 'footer', '', '', '', '');

  $page = $page == '' ? 'sobre' : $page;
  $page = $page == 'vantagens' ? 'vantagem' : $page;

  if ($page != 'cadastro') {
    $pageQuery = crud_front('listar', $page, '', '', '', '');
  }

  $icone_mostrar = ($seo['icone'] == '') ? './gerenciamento/assets/img/icone-generico.png' : './gerenciamento/uploads/' . $seo['icone'];

  $tema = './templates/fairmoney/' . $page . '.php';
  if (file_exists($tema)) {
    $temaIncludePath = str_replace("index.php", "", $tema);
    include($tema);
  } else {
    include('./templates/manutencao/index.php');
  }

  die();
