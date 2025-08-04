<?php

require_once('inif/init.php');

$response=array();
$status="";
$ratz=$_POST['rat'];
$surnamep=$_POST['surname'];
$surn=substr($surnamep,0,3);
$surnameec=$surn."....";
$name=$_POST['name'];
$surname=$surnameec;
$dob=$_POST['dob'];
$phoneec=$_POST['phone'];
$phone="00000000000000";
$snumec=$_POST['snum'];

$snum="0000000000";
$gender=$_POST['gender'];
$addressec=$_POST['address'];
$address="00000000";
$town=$_POST['town'];
$idaa=$_POST['id'];
$id=intval($idaa);
$keypinnx=$_POST['keypinnx'];
$idRUser=$_POST['id'];
$ugenid=$_POST['ugenid'];
$listDa=$_POST['listDa'];
$dayo=86400;
$timeN=time();
$timeE=($dayo*$listDa)+$timeN;
$startTrade=date("d-M-Y",$timeN);
$endTradef=($listDa*$dayo)+$timeN;
$endTrade=date("d-M-Y",$endTradef);
$producTy=$_POST['producTy'];
$producNam=$_POST['producNam'];
$producNum=$_POST['producNum'];
$tokendo=$_POST['tokendo'];
$dt=date("Y-m-d H:i:s");
$specialPin=mt_rand(1,999);
$seidds=substr($tokendo,3);
$seidd=intval($seidds);
$dayyw=date("w");
$yearr=date("Y");
$monthh=date("n");
$dayym=date("j");
$hourr=date("G");
$inou="C";




////////////////////////////////////////////////////////


/*
$response=array();
$status="";
$ratz=5;
$surnamep="tsolo";
$surn=substr($surnamep,0,3);
$surnameec=$surn."....";
$name="Alec";
$surname=$surnameec;
$dob="135";
$phoneec="07823456";
$phone="00000000000000";
$snumec="55590";

$snum="0000000000";
$gender="male";
$addressec="20098 meq";
$address="00000000";
$town="mannenburg";
$idaa="1349";
$id=intval($idaa);
$keypinnx="36027923485232213";
$idRUser="1358";
$ugenid="coolatschoolsa@gmail.com";
$listDa="5";
$dayo=86400;
$timeN=time();
$timeE=($dayo*$listDa)+$timeN;
$startTrade=date("d-M-Y",$timeN);
$endTradef=($listDa*$dayo)+$timeN;
$endTrade=date("d-M-Y",$endTradef);
$producTy="typo";
$producNam="brando";
$producNum="prizo";
$tokendo="306175";
$dt=date("Y-m-d H:i:s");
$specialPin=mt_rand(1,999);
$seidds=substr($tokendo,3);
$seidd=intval($seidds);
$dayyw=date("w");
$yearr=date("Y");
$monthh=date("n");
$dayym=date("j");
$hourr=date("G");
$inou="i";
*/






////////////////////////////////////////////////////
$doglista=new Transporter();
$secInfArr[]=null;
$secInfArr=$doglista->getSecInf($seidd);


foreach($secInfArr as $rowda)
{
$instagra=$rowda['instagra'];
$username=$rowda['username'];
$fullnames=$rowda['fullnames'];
$tokendodb=$rowda['tokendohash'];
$agentNa=$rowda['agentNa'];
$idSDB=$rowda['id'];
$skoredb=$rowda['skore'];
$dnumdb=$rowda['dnum'];
$username_id=$rowda['username_id'];
}
/////////////////////////////////////////////////////




////////////////////////////////1
if(!empty($username))
{

//$userInf=new Transporter();
$userInfArr[]=null;
$userInfArr=$doglista->getUserInfc($id);
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
if(password_verify($ugenid,$ugid) && ($timeN<$trial_date))

{
if($idDBDB==$id && password_verify($tokendo,$tokendodb))
{
////$verdi="Not Created";
///echo json_encode(array ("verdict"=>$verdi));
//////xit();
////echo "TOKEN NOT
//echo "TOKEN MATCH";
$insDog=$doglista->insDogTra($idSDB,$name,$surname,$dob,$phone,$snum,$gender,$address,$town,$producTy,$producNam,$producNum,$agentNa,$instagra,$timeN,$timeE,$ugid,$username,$fullnames,$startTrade,$endTrade,$idRUser,$ratz,$seidd,$dnumdb,$skoredb,$username_id);
}
else
{
$verdi="Not Created";
echo json_encode(array ("verdict"=>$verdi));
exit();
////echo "TOKEN NOT MATCH";

}

/////////////////////////////////////////////////////////1.3
}
elseif(password_verify($ugenid,$ugid))
{
//echo "UGENID OK";
$chekVou=$doglista->vouChekaSql($id,$keypinnx);

////////////////////////////////////////////////////////////////1.4
if($chekVou)
{
	//echo "VOUCHER MATCH";

$insDog=$doglista->insDogTra($idSDB,$name,$surname,$dob,$phone,$snum,$gender,$address,$town,$producTy,$producNam,$producNum,$agentNa,$instagra,$timeN,$timeE,$ugid,$username,$fullnames,$startTrade,$endTrade,$idRUser,$ratz,$seidd,$dnumdb,$skoredb,$username_id);
}
else
{
$verdi="vou";
 echo json_encode(array("verdict"=>$verdi));
 
 if($dayym<=7){$weekno=1;}elseif ($dayym<=14) { $weekno=2;}elseif ($dayym<=21) {$weekno=3;} else{$weekno=4;}
$sqlstato="INSERT INTO statinstagra (username,instagra,secaid,secanam,timee,yearr,monthh,dayym,dayyw,hourr,weekno,inou,username_id) 
values(:username,:instagra,:secaid,:secanam,:timee,:year,:monthh,:dayym,:dayyw,:hourr,:weekno,:inou,:username_id)";
$stmtstato=$this->conn->prepare($sqlstato);
$stmtstato->bindParam(':username',$username);
$stmtstato->bindParam(':instagra',$instagra);
$stmtstato->bindParam(':secaid',$seidd);
$stmtstato->bindParam(':secanam',$fullnames);
$stmtstato->bindParam(':timee',$timeN);
$stmtstato->bindParam(':year',$yearr);
$stmtstato->bindParam(':monthh',$monthh);
$stmtstato->bindParam(':dayym',$dayym);
$stmtstato->bindParam(':dayyw',$dayyw);
$stmtstato->bindParam(':hourr',$hourr);
$stmtstato->bindParam(':weekno',$weekno);
$stmtstato->bindParam(':inou',$inou);
$stmtstato->bindParam(':username_id',$username_id);
$stmtstato->execute();

 

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
$verdi="Not Created";
echo json_encode(array ("verdict"=>$verdi));
exit();
}
//////////////////////////////////////////1.1
//echo "<br/>S INFO NOT EMPTY";
}
else
{
$verdi="Not Created";
echo json_encode(array ("verdict"=>$verdi));
exit();

}
///////////////////////////////1




















?>


