<?php
require_once('inif/init.php');

$id=$_POST['id'];
$keypinnx=$_POST['keypinnx'];
$ugenid=$_POST['ugenid'];


$name=$_POST['name'];
$surname=$_POST['surname'];
$dob=$_POST['dob'];
$phone=$_POST['phone'];
$snum=$_POST['snum'];
$address=$_POST['address'];
$town=$_POST['town'];

$timeN=time();

$startTrade=date("d-M-Y",$timeN);

$gender="se";
$producTy=$_POST['producTy'];
$producNam=$_POST['producNam'];
$producNum=$_POST['producNum'];
$statuC="Item Reported by";



////////////////////////////////////////////////
//$id=$_POST['id'];
//$keypinnx=$_POST['keypinnx'];
//$ugenid=$_POST['ugenid'];

//$iddg=6;
/*
$id=12;
$keypinnx="9173636787927441";
$ugenid="5rdt7888x0pz121212";
$idRUser=$id;


$name="Zlatan";
$surname="Ibrahimovic";
$dob="Zlatdob";
$phone="073764362";
$snum="2000145";
$address="10 Oldham street";
$town="Guttenburg";

$timeN=time();

$startTrade=date("d-M-Y",$timeN);

$gender="se";
$producTy="Phone";
$producNam="Siemens";
$producNum="$40";
$statuC="Item Reported by";
*/
///////////////////////////////////////////////////////////////






$repoob=new Transporter();
$repo=$repoob->checkUserCreds($id,$keypinnx,$ugenid);

if($repo)
{
$ugenidd=password_hash($ugenid,PASSWORD_DEFAULT);
$reposapsins=$repoob->repotransp($name,$surname,$dob,$phone,$snum,$gender,$address,$town,$producTy,$producNam,$producNum,$ugenidd,$statuC,$startTrade,$id);


}
else
{
	echo "NOT INSERTED";
}


























?>