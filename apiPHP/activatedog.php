<?php
require_once('inif/init.php');
$ugenid=$_POST['ugenid'];
$id=$_POST['id'];
$keypinnx=$_POST['keypinnx'];

$voupinid=substr($keypinnx,15);




/*
$ugenid="5rdt7888x0pz121212";
$id=12;
$keypinnx=9173636787927441;
$voupinid=substr($keypinnx,15);
*/


$activatedogu=new Transporter();
$acto=$activatedogu->checkUserCredsActi($id,$keypinnx,$ugenid,$voupinid);








?>