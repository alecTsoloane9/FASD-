<?php

require_once('inif/init.php');
$iddg=$_POST['idoG'];
$id=$_POST['id'];
$keypinnx=$_POST['keypinnx'];
$ugenid=$_POST['ugenid'];

/*
$iddg=6;
$id=12;
$keypinnx="9173636787927441";
$ugenid="5rdt7888x0pz121212";
*/
$listofdog=new Transporter();
$doglistret=$listofdog->getDogsforbox($id,$iddg,$keypinnx,$ugenid);
//checkUser()




?>