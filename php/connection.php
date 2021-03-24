<?php
class Database
{
    public $_db;
    static $_instance;

    private function __construct() {
        $this->_db = new PDO('mysql:host=localhost;dbname=testdb;charset=utf8', 'root', 'asd_123');
        $this->_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    }

    private function __clone(){}

    public static function getInstance() {
        if (!(self::$_instance instanceof self)) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

}