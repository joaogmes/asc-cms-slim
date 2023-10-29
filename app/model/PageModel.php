<?php
require_once(MODEL_PATH . "Model.php");
class PageModel extends Model
{
    private $pdo;

    public function __construct()
    {
        $model = new Model();
        $this->pdo = $model->connect();
    }

    public function getPage($slug)
    {
        $query = "SELECT * FROM `page` WHERE slug = '{$slug}'";
        $page = $this->pdo->prepare($query);
        $page->execute();
        return $page->fetch(PDO::FETCH_ASSOC);
    }

    public function getPageComponents($pageId)
    {
        $query = "SELECT c.path, pc.data
          FROM component c
          INNER JOIN pagecomponent pc ON c.id = pc.componentId
          INNER JOIN page p ON pc.pageId = p.id
          WHERE p.id = $pageId
          AND c.status = 'active'
          AND p.status = 'active'
          ORDER BY pc.order, pc.id";

        $stmt = $this->pdo->prepare($query);
        $stmt->execute();
        
        $components = [];
        while ($component = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $templatePath = VIEW_PATH . 'templates/components/' . $component['path'] . '/'. $component['path'] . '.tpl'; 
            $stylePath = VIEW_PATH . 'templates/components/' . $component['path'] . '/'. $component['path'] . '.css'; 
            $scriptPath = VIEW_PATH . 'templates/components/' . $component['path'] . '/'. $component['path'] . '.js'; 
            if(file_exists($templatePath)){

                $components[] = [
                    "template" => 'components/' . $component['path'] . '/'. $component['path'] . '.tpl',
                    "style" => file_exists($stylePath) ? $stylePath : false,
                    "script" => file_exists($scriptPath) ? $scriptPath : false,
                    "data" => $this->decode($component['data'])
                ];
            }
        }
        return $components;
    }

    private function decode($field){
        return json_decode( base64_decode ( $field ) );
    }
}