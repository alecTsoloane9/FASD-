<?php

class secTransport
{

private $db;	

public function __construct()
{

$this->db=secdbsql::Insta();

}

public function ugenidtransport($ugenidpl)
{
$ugenverdi=$this->db->ugenidsec($ugenidpl);
return $ugenverdi;
}























}




?>