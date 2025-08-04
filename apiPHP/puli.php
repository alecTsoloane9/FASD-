<?php

require_once('inif/init.php');
$rsa=new Rsa();

/*
$keypinnx=9173636787927441;
$name="Eddie";
$surname="Einstein";
$dob="1900";
$pinn="SWED";
$phone="0735764362";
$snum="5560";
$gender="Male";
$address="12 Marine Road";
$town="Bantry Bay";
$language="Swede";
$ugenidpl="09905rdx0pbcfgz12";
*/


$name=$_POST['name'];
$surname=$_POST['surname'];
$dob=$_POST['dob'];
$pinn=$_POST['pinn'];
$phone=$_POST['phone'];
$snum=$_POST['snum'];
$gender=$_POST['gender'];
$address=$_POST['address'];
$town=$_POST['town'];
$language=$_POST['language'];
$ugenidpl=$_POST['ugenid'];



$surnamee=$rsa->publicEncrypt($surname);
$phonee=$rsa->publicEncrypt($phone);
$towne=$rsa->publicEncrypt($town);
$addresse=$rsa->publicEncrypt($address);
$snume=$rsa->publicEncrypt($snum);
$usergenide=$rsa->publicEncrypt($ugenidpl);

$ative_datee=time();
$expiry_datee=time()+31536000;
$expireTrial=3159186400+time();
$timeN=time();
$act_date=date("d-M-Y",$timeN);
$exp_date=date("d-M-Y",$expiry_datee);


$surn=substr($surname,0,3);
$surnameec=$surn."....";
$phoneec="0000000000";
$townec="TTTTTTTTTTTTTT";
$addressec="AAAAAAAAAAAAAA";
$snumec="SSSSSSSSSSSS";
$regstatu="Registered";

$keyx="p0";
$keypinnx="kp0";


$regU=new Transporter();



$regU->getUserinf($name,$surnameec,$dob,$pinn,$phoneec,$snumec,$gender,$addressec,$townec,$ugenidpl,
	$ative_datee,$act_date,$exp_date,$expiry_datee,$regstatu,$keyx,$language,$keypinnx,$expireTrial,$surnamee,$phonee,$towne,$addresse,$snume,$usergenide);




?>