<?php

include 'inif/initdbcon.php';
require_once('inif/init.php');

try{$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);}
catch (PDOException $e)
{print 'Error: ' .$e->getMessage(). '<br/>';die();}

$email=$_POST['emailx'];
$pin=$_POST['pinn2x'];
$id=$_POST['id'];

$sql="Select email_re,pin_acti from user_reg where id=:id";
$stmt=$conn->prepare($sql);
$stmt->bindParam(":id",$id);
$stmt->execute();
$rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
foreach($rows as $row)
{
$ema=$row['email_re'];
$pi=$row['pin_acti'];
if($pin==$pi AND $ema==$email)
{
$c="Complete";
$response=array('verdict'=>$c);
$response2[]=$response;
echo json_encode(array("data"=>$response2));
exit();
}
}


?>