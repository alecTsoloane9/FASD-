<?php
require_once('inif/init.php');

include 'inif/initdbcon.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


require_once "PHPMailer/PHPMailer.php";
require_once "PHPMailer/SMTP.php";
require_once "PHPMailer/Exception.php";



try{$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);}
catch (PDOException $e)
{print 'Error: ' .$e->getMessage(). '<br/>';die();}


$fromm="FASD";
$pin=mt_rand(1,999);

$name=$_POST['name'];
$phone=$_POST['phone'];
$email=$_POST['email'];

/*
$emaill="helen@gmail.comv";
$email=password_hash($emaill,PASSWORD_DEFAULT);
$email="coolatschoolsa@gmail.co.za";
$phone="098777";
$name="Steve";
*/
$sql="SELECT email_re from user_reg";
$stmt=$conn->prepare($sql);
$stmt->execute();
$rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
foreach ($rows as $value) 
{
$emc=$value['email_re'];
if($email===$emc)
{echo "Match Found ".$emc; exit();}	
}
$sqlin="INSERT INTO user_reg (name,email_re,phone_nu,pin_acti) values (:n,:e,:ph,:pin)";
$stmt=$conn->prepare($sqlin);
$stmt->bindParam(":n",$name);
$stmt->bindParam(":e",$email);
$stmt->bindParam(":ph",$phone);
$stmt->bindParam(":pin",$pin);
if($stmt->execute())
{
$idlast=$conn->lastInsertId();
$mail=new PHPMailer();
$mail->isSMTP();
$mail->SMTPDebug=0;
$mail->Host="mail.dgfe.co.za";/////change smtp.hostinger.com
$mail->Port=587;//OR 465
$mail->SMTPAuth=true;

$mail->Username="infomation@dgfe.co.za";
$mail->Password="TpzxV!51e";
$mail->SMTPSecure=PHPMailer::ENCRYPTION_STARTTLS;
$mail->setFrom("infomation@dgfe.co.za",$fromm);
$mail->addAddress($email,$name); 
$mail->Subject="FASD registration";
$mail->Body="Hello ".$name.", here is your pin to finalize the registration.    ".$pin;

if($mail->send())
{

$v="Verifying";
$verdict=array('verdict'=>$v,'pin'=>$pin,'id'=>$idlast);
$verdict2[]=$verdict;
echo json_encode(array("data"=>$verdict2));
}
else
{
echo "MAIL NOT DELIVERED";
}




}
else
{	echo "NO EXECUTE ERROR";}







?>