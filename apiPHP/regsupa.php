<?php

if(($_SERVER['REQUEST_METHOD']=='POST') && (stripos($_SERVER['HTTP_USER_AGENT'],"Android")))

{
include 'inif/initdbcon.php';
//require_once "Rsa.php";
//$rsa=new Rsa();

try{
$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);
}catch (PDOException $e){print 'Error: ' .$e->getMessage(). '<br/>';die();}
$response=array();
$response2=array();

$town=$_POST['town'];
$insta=$_POST['insta'];
$supaname=$_POST['supaname'];
$supsurname=$_POST['supsurname'];
$supanumba=$_POST['supanumba'];
$username=$_POST['username'];
$passwordi=$_POST['password'];


$password=password_hash($passwordi,PASSWORD_DEFAULT);
$verified="asd";
$sql="INSERT INTO userx 
(vkey,instagra,fullnames,firstname,username,password,ugenid,verified)values
(:vkey,:instagra,:fullnames,:firstname,:username,:password,:ugenid,:verified)";
$stmt=$conn->prepare($sql);
$stmt->bindParam(':vkey',$town);
$stmt->bindParam(':instagra',$insta);
$stmt->bindParam(':fullnames',$supsurname);
$stmt->bindParam(':firstname',$supaname);
$stmt->bindParam(':username',$username);
$stmt->bindParam(':password',$password);
$stmt->bindParam(':ugenid',$supanumba);
$stmt->bindParam(':verified',$verified);

if($stmt->execute())

{
$lastRR=$conn->lastInsertId();
$user = array('id'=>$lastRR, 'username'=>$username);
$response[] = $user; 
echo json_encode(array("data"=>$response));
}
else
{$status4="EXECUTE ERROR";echo json_encode(array("status"=>$status4));exit();}


}

else
{$status4="POST ERROR";echo json_encode(array("status"=>$status4));exit();}

?>



