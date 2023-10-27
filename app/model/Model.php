<?php
require_once(CFG_PATH . "Config.php");
class Model
{
    private $table;
    public function __construct()
    {
    }
    public function connect()
    {
        global $settings;

        $host = $settings['database']['DB_HOST'];
        $dbName = $settings['database']['DB_NAME'];
        $username = $settings['database']['DB_USER'];
        $password = $settings['database']['DB_PASS'];

        try {
            $dsn = "mysql:host=$host;dbname=$dbName;charset=utf8mb4";
            $pdo = new PDO($dsn, $username, $password);

            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            return $pdo;
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

   /*  private function setTable($table){
        $this->table = $table;
        return;
    }

    private function list($filter)
    {
        $pdo = $this->connect();
        $query = "SELECT * FROM " . $this->table . " " . $filter;
        $list = $pdo->prepare($query);
        $list->execute();
        
        $result = [];
        while($rs = $list->fetch(PDO::FETCH_ASSOC)){
            $result[] = $rs;
        }
        return $retorno;
        break;
    }

    private function insert($data)
    {
        $pdo = $this->connect();
        $logs = array();

        $campos = ' (';
        $valores = ') VALUES (';
        $index = 0;
        foreach ($data as $chave => $valor) {
            if ($chave == 'files') {
            } else {

                $campos .= " " . $chave . " ,";
                $valores .= " '" . $valor . "' ,";

                $logs[$index]['usuario'] = $sessionUser;
                $logs[$index]['datahora'] = Date('Y-m-d H:i:s');
                $logs[$index]['operacao'] = $operacao;
                $logs[$index]['tabela'] = $this->table;
                $logs[$index]['campo'] = $chave;
                $logs[$index]['antigo'] = '';
                $logs[$index]['novo'] = $valor;
                $logs[$index]['chave'] = '[get_content_id]';

                $index++;
            }
        }
        $campos = substr($campos, 0, -1);
        $valores = substr($valores, 0, -1);
        $query = "insert into " . $this->table . " " . $campos . " " . $valores . " )";
        $stmt = $pdo->prepare($query);
        if ($stmt->execute()) {
            $id = $pdo->lastInsertId();
            $queryLog = array();
            $logStatus = array();
            foreach ($logs as $key => $value) {

                $logs[$key]['chave'] = str_replace('[get_content_id]', $id, $logs[$key]['chave']);

                $queryLog[$key] = "INSERT INTO `log`  (usuario, datahora, operacao, tabela, campo, antigo, novo, chave) VALUES ('" . $logs[$key]['usuario'] . "', '" . $logs[$key]['datahora'] . "', '" . $logs[$key]['operacao'] . "', '" . $logs[$key]['tabela'] . "', '" . $logs[$key]['campo'] . "', '" . $logs[$key]['antigo'] . "', '" . $logs[$key]['novo'] . "', '" . $logs[$key]['chave'] . "')
            ";

                $stmtQueryLog = $pdo->prepare($queryLog[$key]);
                if ($stmtQueryLog->execute()) {
                    $logStatus[$key] = 'sucesso';
                } else {
                    $logStatus[$key] = 'falha';
                }
            }

            $retorno = "<script>window.location.href='" . $sucesso . "';</script>";
        } else {
            $retorno = "<h3>" . $falha . "</h3>";
        }
        return $retorno;
    }
    private function update()
    {
        $pdo = $this->connect();

        $id = isset($id) ? $id : '1';
        $campos = '';
        $valores = '';
        $logs = array();
        $index = 0;
        foreach ($this->data as $chave => $valor) {
            if ($chave == 'files') {
            } else {
                $campos .= " " . $chave . " = '" . $valor . "',";

                $oldValueQuery = "SELECT " . $chave . " FROM " . $this->table . " WHERE id = " . $id;
                $getOldValue = $pdo->prepare($oldValueQuery);
                $getOldValue->execute();
                $oldValue = $getOldValue->fetch(PDO::FETCH_ASSOC);

                if ($oldValue[$chave] != $valor) {

                    $logs[$index]['usuario'] = $sessionUser;
                    $logs[$index]['datahora'] = Date('Y-m-d H:i:s');
                    $logs[$index]['operacao'] = $operacao;
                    $logs[$index]['tabela'] = $this->table;
                    $logs[$index]['campo'] = $chave;
                    $logs[$index]['antigo'] = $oldValue[$chave];
                    $logs[$index]['novo'] = $valor;
                    $logs[$index]['chave'] = $id;

                    $index++;
                }
            }
        }

        $campos = substr($campos, 0, -1);
        $query = "UPDATE " . $this->table . " SET " . $campos . " WHERE id='" . $id . "' ";
        $stmt = $pdo->prepare($query);
        if ($stmt->execute()) {

            $queryLog = array();
            $logStatus = array();
            foreach ($logs as $key => $value) {

                $queryLog[$key] = "INSERT INTO `log`  (usuario, datahora, operacao, tabela, campo, antigo, novo, chave) VALUES ('" . $logs[$key]['usuario'] . "', '" . $logs[$key]['datahora'] . "', '" . $logs[$key]['operacao'] . "', '" . $logs[$key]['tabela'] . "', '" . $logs[$key]['campo'] . "', '" . $logs[$key]['antigo'] . "', '" . $logs[$key]['novo'] . "', '" . $logs[$key]['chave'] . "')
            ";

                $stmtQueryLog = $pdo->prepare($queryLog[$key]);
                if ($stmtQueryLog->execute()) {
                    $logStatus[$key] = 'sucesso';
                } else {
                    $logStatus[$key] = 'falha';
                }
            }

            $retorno = "<script>window.location='./?modulo=" . $this->table . "&acao=atualizar';</script>";
        } else {
            $retorno = "<h3>Deu errado</h3>";
        }
        return $retorno;
    }

    private function delete()
    {
        $pdo = $this->connect();

        $id = isset($id) ? $id : '1';

        $getTableFields = "SELECT group_concat(COLUMN_NAME)
                FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_NAME = '" . $this->table . "'";
        $stmtTableFields = $pdo->prepare($getTableFields);
        $stmtTableFields->execute();
        $tableFields = $stmtTableFields->fetch(PDO::FETCH_ASSOC);
        $tableFields = explode(",", $tableFields['group_concat(COLUMN_NAME)']);

        $logs = array();
        $index = 0;
        foreach ($tableFields as $chave => $valor) {

            if ($valor != 'id') {
                $oldValueQuery = "SELECT " . $valor . " FROM " . $this->table . " WHERE id = " . $id;
                $getOldValue = $pdo->prepare($oldValueQuery);
                $getOldValue->execute();
                $oldValue = $getOldValue->fetch(PDO::FETCH_ASSOC);

                $logs[$index]['usuario'] = $sessionUser;
                $logs[$index]['datahora'] = Date('Y-m-d H:i:s');
                $logs[$index]['operacao'] = $operacao;
                $logs[$index]['tabela'] = $this->table;
                $logs[$index]['campo'] = $valor;
                $logs[$index]['antigo'] = $oldValue[$valor];
                $logs[$index]['novo'] = '';
                $logs[$index]['chave'] = $id;

                $index++;
            }
        }

        $query = "DELETE FROM " . $this->table . " WHERE id='" . $id . "' ";
        $stmt = $pdo->prepare($query);
        if ($stmt->execute()) {
            $queryLog = array();
            $logStatus = array();
            foreach ($logs as $key => $value) {

                $queryLog[$key] = "INSERT INTO `log`  (usuario, datahora, operacao, tabela, campo, antigo, novo, chave) VALUES ('" . $logs[$key]['usuario'] . "', '" . $logs[$key]['datahora'] . "', '" . $logs[$key]['operacao'] . "', '" . $logs[$key]['tabela'] . "', '" . $logs[$key]['campo'] . "', '" . $logs[$key]['antigo'] . "', '" . $logs[$key]['novo'] . "', '" . $logs[$key]['chave'] . "')
                        ";

                $stmtQueryLog = $pdo->prepare($queryLog[$key]);
                if ($stmtQueryLog->execute()) {
                    $logStatus[$key] = 'sucesso';
                } else {
                    $logStatus[$key] = 'falha';
                }
            }
            $retorno = "<script>window.location='" . $sucesso . "';</script>";
        } else {
            $retorno = "<h3>Deu errado</h3>";
        }
        return $retorno;
    } */
}