<?php


require_once('inif/init.php');

require_once "Rsa.php";
$rsa=new Rsa();

//////////////////////////////////////////////////////

$response=array();
$status="";

$id=$_POST['id'];
$keypinnx=$_POST['keypinnx'];
$ugenid=$_POST['ugenid'];


$name=$_POST['name'];
$surname=$_POST['surname'];
$dob=$_POST['dob'];
$phone=$_POST['phone'];
$snum=$_POST['snum'];
$gender=$_POST['gender'];
$address=$_POST['address'];
$town=$_POST['town'];
$pinn=$_POST['pinn'];




$surnamee=$rsa->publicEncrypt($surname);
$phonee=$rsa->publicEncrypt($phone);
$towne=$rsa->publicEncrypt($town);
$addresse=$rsa->publicEncrypt($address);
$snume=$rsa->publicEncrypt($snum);

$surn=substr($surname,0,3);
$surnameec=$surn."....";
$phoneec="0000000000";
$townec="TTTTTTTTTTTTTT";
$addressec="AAAAAAAAAAAAAA";
$snumec="SSSSSSSSSSSS";
/////////////////////////////////////////////////

$dogupd=new Transporter();

$userInfArr[]=null;
$userInfArr=$dogupd->getUserInfc($id);

//////////////////////////////////////////1.1
if(!empty($userInfArr))
{
foreach($userInfArr as $rowdau)
{
$idDBDB=$rowdau['id'];
$registered_date=$rowdau['active_dat'];
$trial_date=$rowdau['expireTrial'];
$ugid=$rowdau['ugenid'];
}

////////////////////////////////////////////////////////////////1.2
if(password_verify($ugenid,$ugid))// && ($timeN<$trial_date))
//if(1!=1)
{
if($idDBDB==$id) // && password_verify($tokendo,$tokendodb))
{
//echo "TOKEN MATCH";
$insDog=$dogupd->updateTra($phonee,$addresse,$snume,$towne,$phoneec,$addressec,$snumec,$townec,$pinn,$id);


/////////////////verdict


}
else
{echo "TOKEN NOT MATCH";}

/////////////////////////////////////////////////////////1.3
}
elseif(password_verify($ugenid,$ugid))
{

$chekVou=$doglista->vouChekaTra($id,$keypinnx);
////////////////////////////////////////////////////////////////1.4
if($chekVou)
{
	//echo "VOUCHER MATCH";

$insDog=$dogupd->updateTra($phonee,$addresse,$snume,$towne,$phoneec,$addressec,$snumec,$townec,$pinn,$id);

//////////////////////verdict
}
else
{
$verdi="vou";
 echo json_encode(array("verdict"=>$verdi));

//echo "VOUCHER NOT MATCHING";	
}
///////////////////////////////////////////////////////////1.4
}
else
{



}

///////////////////////////////////////////////////////////////1.2
//echo $ugid;
}
else
{ 
echo "ARRAY OF DOG USER IS EMPTY";
exit();
}



























?>
