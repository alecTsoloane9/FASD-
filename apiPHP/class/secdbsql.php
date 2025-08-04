<?php
class secdbsql
{

private static $insta=null;
private $conn,$vv;
private $ugidd;
private $dogarr=array();
public function __construct()
{

$this->conn=new PDO('mysql:host='.Config::get('mysql/host').';dbname='.Config::get('mysql/db'),
Config::get('mysql/username'),
Config::get('mysql/password'));

}

public function Insta()
{

	if(!isset(self::$insta))
	{
		self::$insta=new secdbsql();
	}

	return self::$insta;
}


public function ugenidsec($ugenidpl)
{
	//echo "SQL";

$sqlsecugen="SELECT ugenid FROM userx";
$stmtsecsql=$this->conn->prepare($sqlsecugen);
$stmtsecsql->execute();
$secugenidrow=$stmtsecsql->fetchAll(PDO::FETCH_ASSOC);
//print_r($secugenidrow);
foreach ($secugenidrow as $secindvalue)
{
foreach ($secindvalue as $secugenidlist)
{

$seculist[]=$secugenidlist;
		
}	

}

foreach ($seculist as $ugsec)
{
if($ugsec==$ugenidpl)
{
	return false;
}	
}

return true;

}











}




?>