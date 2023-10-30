<?php
namespace Controller;
use Core\Controller;
use Model\PageModel;
class PageController extends Controller
{
    protected $model;

    public function __construct()
    {
        parent::__construct();
        global $autoloader;
        $this->model = $autoloader->load('Model\PageModel', 'model');
    }
    public function renderPage($routeSlug)
    {
        $page = $this->model->getPage($routeSlug);
        $this->assign("page", $page);

        $components = $this->model->getPageComponents($page['id']);
        $this->assign("components", $components);

        $this->display("page.tpl");
        return;
    }
    public function loadRoutes()
    {
        try {
            $model = new \Core\Model();
            $pdo = $model->connect();
            $stmt = $pdo->query("SELECT slug FROM page WHERE status = 'active'");

            $row = $stmt->fetch(\PDO::FETCH_ASSOC);
            return $row;
        } catch (PDOException $e) {
            echo "Error fetching routes: " . $e->getMessage();
        }
    }
}
