<?php
//require_once 'inif/init.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


require_once "PHPMailer/PHPMailer.php";
require_once "PHPMailer/SMTP.php";
require_once "PHPMailer/Exception.php";




$mail=new PHPMailer();
$mail->isSMTP();
$mail->SMTPDebug=0;
$mail->Host="mail.dgfe.co.za";/////change smtp.hostinger.com maybe smtp.afrihost.com
$mail->Port=587;
$mail->SMTPAuth=true;

$mail->Username="infomation@dgfe.co.za";
$mail->Password="TpzxV!51e";
$mail->SMTPSecure=PHPMailer::ENCRYPTION_STARTTLS;
$mail->setFrom("infomation@dgfe.co.za","Alecx");
$mail->addAddress("coolatschoolsa@gmail.com","Alec"); 
$mail->Subject="Final step for registering";

$mail->Body="This is to inform you that you are required to add your details";
if($mail->send())
{
	echo "Mail delivered";
}
else
{
echo "Error";
}







?>