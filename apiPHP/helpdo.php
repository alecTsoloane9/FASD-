<?php
if(($_SERVER['REQUEST_METHOD']=='POST') && (stripos($_SERVER['HTTP_USER_AGENT'],"Android")))
{
include 'inif/initdbcon.php';
//helpdo.php";

require_once "Rsa.php";
$rsa=new Rsa();

try{
$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);
}catch (PDOException $e){print 'Error: ' .$e->getMessage(). '<br/>';die();}
$response=array();
$response2=array();
$status1="";
$status2="";
$status3="";
$status4="";

$phone=$_POST['phone'];
$email=$_POST['email'];
$uid=$_POST['id'];
$steppa=$_POST['stp'];

if($uid=="zeroo")
{$uid="STEP 1";

}


$tyd=time();

$phonee=$rsa->publicEncrypt($phone);
$emaile=$rsa->publicEncrypt($email);


$sql="INSERT INTO reg_user_help00 
(phone,ugenid,dat,step,email)values(:p,:i,:dat,:s,:e)";
$stmt=$conn->prepare($sql);

$stmt->bindParam(':e',$emaile);
$stmt->bindParam(':p',$phonee);
$stmt->bindParam('i',$uid);
$stmt->bindParam(':dat',$tyd);
$stmt->bindParam(':s',$steppa);


if($stmt->execute())
{exit ();}
else
{exit();}






}

else
{exit();}

?>



