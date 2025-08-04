<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once('PHPMailer/PHPMailer.php');
require_once('PHPMailer/SMTP.php');
require_once('PHPMailer/Exception.php');

$mail=new PHPMailer();

$email="infomation@dgfe.co.za";
$name="DEP";



$mail->isSMTP();
$mail->Host="mail.dgfe.co.za";
$mail->Port=587;
$mail->SMTPAuth=TRUE;
$mail->SMTPSecure=PHPMailer::ENCRYPTION_STARTTLS;
$mail->Username="infomation@dgfe.co.za";
$mail->Password="TpzxV!51e";
$mail->setFrom($email,$name);
$mail->addAddress("coolatschoolsa@gmail.com","Alec"); 
$mail->Subject="Complete the registration process";
$mail->Body="Good morning, please enter the code to complete your registration.";
$mail->SMTPDebug=4;
$mail->send();

?>


