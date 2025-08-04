<?php
if(($_SERVER['REQUEST_METHOD']=='POST') && (stripos($_SERVER['HTTP_USER_AGENT'],"Android")))
{

include 'inif/initdbcon.php';

try{$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);}catch (PDOException $e){print 'Error: ' .$e->getMessage(). '<br/>';die();}


$response=array();
$status="";
$id=$_POST['id'];
$sql = "SELECT * FROM userx where id = :id" ;

$stmt=$conn->prepare($sql);
$stmt->bindParam(':id',$id);
$stmt->execute();
$rowaz2=$stmt->fetchAll(PDO::FETCH_ASSOC);

$response1=$rowaz2;


foreach($rowaz2 as $rowda)
{
	$agentNadb=$rowda['firstname'];
	$agentId=$rowda['id'];
}

$user = array(
'firstname'=>$agentNadb,
'id'=>$agentId
);
$response[] = $user;
echo json_encode(array("data"=>$response));
}
else
{$status="POST ERROR";echo json_encode(array("status"=>$status));}




?>