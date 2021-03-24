<?php
class Database
{
    public $db;
    static $_instance;

    private function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=testdb;charset=utf8', 'root', 'asd_123');
        $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    }

    private function __clone(){}

    public static function getInstance() {
        if (!(self::$_instance instanceof self)) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    public function query($sql,$params = []) {
        $query = $this->db->prepare($sql);
        $query->execute($params);
        $query->setFetchMode(PDO::FETCH_ASSOC);
        return $query->fetchAll();
    }

}