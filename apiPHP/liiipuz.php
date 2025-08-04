<?php
require_once('inif/init.php');
/*
$id=1313;
$keypinnx="9173636787927441";
$ugenid="868273030059699";
$timeToday=time();
*/

$id=$_POST['id'];
$keypinnx=$_POST['keypinnx'];
$ugenid=$_POST['ugenid'];
$timeToday=time();

$getDogTobj=new Transporter();


$getDogTobj->DogListTra($id,$keypinnx,$ugenid,$timeToday);








?>