<?php
class Transporter
{
private $db;
private $conn;//1

public function __construct()
{


$this->conn=new PDO('mysql:host='.Config::get('mysql/host').';dbname='.Config::get('mysql/db'),
Config::get('mysql/username'),
Config::get('mysql/password'));


}

public function getUserInfdl($id,$iddg,$keypinnx,$ugenid)

{

	$dogsboxfil=$this->getDogsforbox($id,$iddg,$keypinnx,$ugenid);
	return $dogsboxfil;


}
public function getDogsforbox($id,$iddg,$keypinnx,$ugenid)
{
$sqldogbox="Select * from User_Details  where id=:id";
$stmtdogbox=$this->conn->prepare($sqldogbox);
$stmtdogbox->bindParam(':id',$id);
$stmtdogbox->execute();
$rowdogbox=$stmtdogbox->fetchAll(PDO::FETCH_ASSOC);
foreach($rowdogbox as $col)
{
$idDBDB=$col['id'];
$registered_date=$col['active_dat'];
$trial_date=$col['expireTrial'];
$ugid=$col['ugenid'];
}

if($idDBDB==$id)
{
$sqldogboxt="Select * from User_trade_tab where id=:id";
$stmtdogboxt=$this->conn->prepare($sqldogboxt);
$stmtdogboxt->bindParam(':id',$iddg);
$stmtdogboxt->execute();
$rowaz2=$stmtdogboxt->fetchAll(PDO::FETCH_ASSOC);
foreach($rowaz2 as $rowda)
{
	$producTy=$rowda['producTy'];
	$producNum=$rowda['producNum'];
	$producNam=$rowda['producNam'];
	$instagra=$rowda['instagra'];
	$idz=$rowda['id'];
    $endTrade=$rowda['endTrade'];
    $startTrade=$rowda['startTrade'];
}

$user = array(
'producTy'=>$producTy,
'producNum'=>$producNum,
'producNam'=>$producNam,
'instagra'=>$instagra,
'id'=>$idz,
'endTrade'=>$endTrade,
'startTrade'=>$startTrade);
$response[] = $user;
//////response=array() delete user

if(password_verify($ugenid,$ugid) && ($registered_date<$trial_date) )
{
echo json_encode(array("data"=>$response));
}
elseif(password_verify($ugenid,$ugid) AND ($registered_date>$trial_date) )
{
$vouchervedbx=$this->vouChekaSql($id,$keypinnx);
if($vouchervedbx)
{
echo json_encode(array("data"=>$response));

}
else
{
$verdi="vou";
 echo json_encode(array("verdict"=>$verdi));
	
}

}



}
else
{}

}



public function checkUserCreds($id,$keypinnx,$ugenid)
{

$credVerdi=$this->CheckaUsersql($id,$keypinnx,$ugenid);
return $credVerdi;
}

public function CheckaUsersql($id,$keypinnx,$ugenid)
{
$sqlchekacred="Select * from User_Details  where id=:id";
$stmtchekacred=$this->conn->prepare($sqlchekacred);
$stmtchekacred->bindParam(':id',$id);
$stmtchekacred->execute();
$usercred=$stmtchekacred->fetchAll(PDO::FETCH_ASSOC);
foreach($usercred as $userind)
{
$idDBDB=$userind['id'];
$registered_date=$userind['active_dat'];
$trial_date=$userind['expireTrial'];
$ugid=$userind['ugenid'];
 $regstatu21=$userind['regstatu'];
}

if(password_verify($ugenid,$ugid))// && ($registered_date<$trial_date))
{

return true;
}
elseif(password_verify($ugenid,$ugid) AND ($registered_date>$trial_date) )
{
$pinCheckcred=$this->keypinCheka($id);
if(password_verify($keypinnx,$pinCheckcred)){ return true;}else{return false;}

}
else
{
return false;

}

}


public function checkUserCredsActi($id,$keypinnx,$ugenid,$voupinid)
{
//$activa=$this->db->CheckaUsersqlactiva($id,$keypinnx,$ugenid,$voupinid);
////return $activa;

//public function CheckaUsersqlactiva($id,$keypinnx,$ugenid,$voupinid)
//{
$regdatum_tsp=time();
$regdatumex_tsp=$regdatum_tsp+31536000;

$regdatum_stdve=date("d-M-Y",$regdatum_tsp);
$regdatumex_stdve=date("d-M-Y",$regdatumex_tsp);

$sqlactiva="Select * from User_Details  where id=:id";
$stmtactiva=$this->conn->prepare($sqlactiva);
$stmtactiva->bindParam(':id',$id);
$stmtactiva->execute();
$rowactiva=$stmtactiva->fetchAll(PDO::FETCH_ASSOC);
foreach($rowactiva as $actidata)
{
$idDBDB=$actidata['id'];
 $registered_date=$actidata['active_dat'];
 $trial_date=$actidata['expireTrial'];
 $ugid=$actidata['ugenid'];
 $regstatu21=$actidata['regstatu'];
}

$uac=array('regstatu'=>$regstatu21);
$response[] = $uac;
if(password_verify($ugenid,$ugid))
{
$sqlvouacti="Select * from codpin where id=:idv";
$stmtvouacti=$this->conn->prepare($sqlvouacti);
$stmtvouacti->bindParam(':idv',$voupinid);
$stmtvouacti->execute();
$rowvouacti=$stmtvouacti->fetchAll(PDO::FETCH_ASSOC);
foreach ($rowvouacti as $voudaba) 
{
$voudbhash=$voudaba['keypinnx'];
}
if(password_verify($keypinnx,$voudbhash))
{
$sqludatevo="Update codpin set idRUser=:idRUser,datum_rea=:regdatum_tsp,datum_exper=:regdatumex_tsp,date_regstd=:regdatum_stdve,date_expstd=:regdatumex_stdve WHERE id=:id";
$stmtupdatevou=$this->conn->prepare($sqludatevo);
$stmtupdatevou->bindParam(':idRUser',$id);
$stmtupdatevou->bindParam(':id',$voupinid);
$stmtupdatevou->bindParam(':regdatum_tsp',$regdatum_tsp);
$stmtupdatevou->bindParam(':regdatumex_tsp',$regdatumex_tsp);
$stmtupdatevou->bindParam(':regdatum_stdve',$regdatum_stdve);
$stmtupdatevou->bindParam(':regdatumex_stdve',$regdatumex_stdve);
if($stmtupdatevou->execute())
{
echo json_encode(array("data"=>$response));
exit();
}
else
{
$status3="NO EXECUTE UPDATE";echo json_encode(array("status"=>$status3));exit();
}


}
else
{

$status3="Voucher provided is fake";echo json_encode(array("status"=>$status3));exit();

}
}
else
{

$status3="User not found";echo json_encode(array("status"=>$status3));exit();

}




//}

}




public function getUserinf($name,$surnameec,$dob,$pinn,$phoneec,$snumec,$gender,$addressec,$townec,$ugenidpl,
	$ative_datee,$act_date,$exp_date,$expiry_datee,$regstatu,$keyx,$language,$keypinnx,$expireTrial,$surnamee,$phonee,$towne,$addresse,$snume,$usergenide)
{

$checkU=$this->SearchUserN($ugenidpl);
if($checkU)
{
$ugenidplh=password_hash($ugenidpl,PASSWORD_DEFAULT);
$sql="Insert into User_Details (ugenid,name,surname,dob,phone,snum,gender,address,town,pinn,active_dat,expireTrial,act_dat,exp_dat,expiry_dat,keypinnx,language,regstatu,keyx) values
(:ugenid,:name,:surname,:dob,:phone,:snum,:gender,:address,:town,:pinn,:ative_datee,:expireTrial,:act_date,:exp_date,:expiry_datee,:keypinnx,:language,:regstatu,:keyx)";

$stmt=$this->conn->prepare($sql);
$stmt->bindParam(':name',$name);
$stmt->bindParam(':surname',$surnameec);
$stmt->bindParam(':dob',$dob);
$stmt->bindParam(':phone',$phoneec);
$stmt->bindParam(':snum',$snumec);
$stmt->bindParam(':gender',$gender);
$stmt->bindParam(':address',$addressec);
$stmt->bindParam(':town',$townec);
$stmt->bindParam(':pinn',$pinn);
$stmt->bindParam(':ugenid',$ugenidplh);
$stmt->bindParam(':ative_datee',$ative_datee);
$stmt->bindParam(':act_date',$act_date);
$stmt->bindParam(':exp_date',$exp_date);
$stmt->bindParam(':expiry_datee',$expiry_datee);
$stmt->bindParam(':regstatu',$regstatu);
$stmt->bindParam(':keyx',$keyx);
$stmt->bindParam(':keypinnx',$keypinnx);
$stmt->bindParam(':expireTrial',$expireTrial);
$stmt->bindParam(':language',$language);


if($stmt->execute())

{

$lastRR=$this->conn->lastInsertId();

$sqlm="Insert into user_mi_deta_tu_marketing_depp (idRUserV,surnameV,phoneV,snumV,genderV,addressV,townV,usergenid,language,date_re,date_ree) 
values (:lastRR,:surname,:phone,:snum,:gender,:address,:town,:ugenid,:language,:dateStamp,:dateReal)";
$stmt=$this->conn->prepare($sqlm);
$stmt->bindParam(':lastRR',$lastRR);
$stmt->bindParam(':surname',$surnamee);
$stmt->bindParam(':phone',$phonee);
$stmt->bindParam(':snum',$snume);
$stmt->bindParam(':gender',$gender);
$stmt->bindParam(':address',$addresse);
$stmt->bindParam(':town',$towne);

$stmt->bindParam(':ugenid',$usergenide);
$stmt->bindParam(':dateStamp',$ative_datee);
$stmt->bindParam(':dateReal',$act_date);
$stmt->bindParam(':language',$language);



if($stmt->execute())
{
$user = array(
'id'=>$lastRR, 
'active_dat'=>$active_datf, 
'expiry_dat'=>$expiry_datf,
'keypinnx'=>"kp0",
'regstatu'=>"Registered", 
'keyx'=>"p0");

$response[] = $user; 
echo json_encode(array("data"=>$response));
}


else
{echo "MARKETING FAILED";}


}

}
else
{
	echo "ERROR ...USER ALREADY REGISERED";
	exit();
}







//$this->db->RegUserN($name,$surnameec,$dob,$pinn,$phoneec,$snumec,$gender,$addressec,$townec,$ugenidpl,
//	$ative_datee,$act_date,$exp_date,$expiry_datee,$regstatu,$keyx,$language,$keypinnx,$expireTrial,$surnamee,$phonee,$towne,$addresse,$snume,$usergenide);

}



public function SearchUserN($ugen)
{

	$sql="Select ugenid from User_Details";
	$stmt=$this->conn->prepare($sql);
	$stmt->execute();

$rowa=$stmt->fetchAll(PDO::FETCH_ASSOC);

foreach($rowa as $r)
{
	foreach ($r as  $value) 
	{$v[]=$value;}
}

foreach($v as $ugid)
{
if(password_verify($ugen,$ugid))
{return false;exit();}
}

return true;
}



public function DogListTra($id,$keypinnx,$ugenid,$timeToday)
{

//$this->db->DogListex($id,$keypinnx,$ugenid,$timeToday);

//public function DogListex($id,$keypinnx,$ugenid,$timeToday)
//{
$userInfodb=$this->checkaID($id);

foreach ($userInfodb as $infu)
{
$useridDB=$infu['id'];
$registereddateDB=$infu["active_dat"];
$usergenidDB=$infu["ugenid"];
$expiredateDB=$infu["expireTrial"];
}

if($id==$useridDB)

	
{


$userDogLista=$this->getDogsN($id);

if(password_verify($ugenid,$usergenidDB) && ($timeToday<$expiredateDB))
{	

if(empty ($userDogLista))
{

$empt[]=null;$verr="vok";echo json_encode(array("data"=>$empt,"vouu"=>$verr));}
else
{

$verr="vok";echo json_encode(array("data"=>$userDogLista,"vouu"=>$verr));}

exit();
}
elseif(password_verify($ugenid,$usergenidDB))
{
$pinCheck=$this->vouChekaSql($id,$keypinnx);
if($pinCheck)
{

if(empty($userDogLista))	
{
//cho "EMPTY";
$empt[]=null;$verr="vok";echo json_encode(array("data"=>$empt,"vouu"=>$verr));}


else
{
//cho "FULL";
$verr="vok";echo json_encode(array("data"=>$userDogLista,"vouu"=>$verr));}

exit();



}
else
{
$verdi="vou";
echo json_encode(array("verdict"=>$verdi));

///cho "SUB NOT MATCH KEYPIN NOT MATCHING";
}



	//echo "2";
}
else
{echo "PASSWORD VERIFY FAILED";}



}
else
{ echo "ERRR ON ID CHECK";}




//}





exit();
}

public function checkaID($id)
{
$checssql="Select * from User_Details where id=:id";
$stmtc=$this->conn->prepare($checssql);
$stmtc->bindParam(':id',$id);
$stmtc->execute();
$rowa=$stmtc->fetchAll(PDO::FETCH_ASSOC);
return $rowa;
//print_r($rowa);
//exit();
}
public function getDogsN($id)
{
//$response[]=null;	
$sqlgd="Select * from User_trade_tab where idRUser=:id";
$stmtgd=$this->conn->prepare($sqlgd);
$stmtgd->bindParam(':id',$id);
$stmtgd->execute();
while($rowaz2=$stmtgd->fetch(PDO::FETCH_ASSOC) )
{
$response[]=$rowaz2;
}
//rint_r($response);
//exit();

return $response;
}

public function getSecInf($idsec)
{
//$secI=$this->db->getSecInfA($idsec);
//public function getSecInfA($idsec)
//{
$statusOZ="on";

$sqlgetseci="Select * from userx where id=:idsec AND statusOZ=:statusOZ";
$stmtsec=$this->conn->prepare($sqlgetseci);
$stmtsec->bindParam(':idsec',$idsec);
$stmtsec->bindParam(':statusOZ',$statusOZ);
$stmtsec->execute();
$secrow=$stmtsec->fetchAll(PDO::FETCH_ASSOC);

return $secrow;
//}

//return $secI;
}

public function getUserInfc($iduser)
{
//$userI=$this->db->checkaID($iduser);
//public function checkaID($id)
//{
$checssql="Select * from User_Details where id=:id";
$stmtc=$this->conn->prepare($checssql);
$stmtc->bindParam(':id',$iduser);
$stmtc->execute();
$rowa=$stmtc->fetchAll(PDO::FETCH_ASSOC);
return $rowa;
//print_r($rowa);
//exit();
//}




//return $userI;
}

public function insDogTra($idSDB,$name,$surname,$dob,$phone,$snum,$gender,$address,$town,$producTy,$producNam,$producNum,$agentNa,$instagra,$timeN,$timeE,$ugenid,$username,$fullnames,$startTrade,$endTrade,$idRUser,$ratz,$seidd,$dnumdb,$skoredb,$username_id)
{
//$dogverdict=$this->db->createDogListing($idSDB,$name,$surname,$dob,$phone,$snum,$gender,$address,$town,$producTy,$producNam,$producNum,$agentNa,$instagra,$timeN,$timeE,$ugenid,$username,$fullnames,$startTrade,$endTrade,$idRUser,$ratz,$seidd,$dnumdb,$skoredb);

//public function createDogListing($idSDB,$name,$surname,$dob,$phone,$snum,$gender,$address,$town,$producTy,$producNam,$producNum,$agentNa,$instagra,$timeN,$timeE,$ugenid,$username,$fullnames,$startTrade,$endTrade,$idRUser,$ratz,$seidd,$dnumdb,$skoredb)
//{
///////
///////

$dayyw=date("w");
$yearr=date("Y");
$monthh=date("n");
$dayym=date("j");
$hourr=date("G");
$inou="i";


$sqlcredog="INSERT INTO User_trade_tab 
(name,surname,dob,phone,snum,gender,address,town,ugenid,producTy,producNam,producNum,agentNa,instagra,timeN,timeE,startTrade,endTrade,username,fullnames,idRUser)
values
(:name,:surname,:dob,:phone,:snum,:gender,:address,:town,:ugenid,:producTy,:producNam,:producNum,:agentNa,:instagra,:timeN,:timeE,:startTrade,:endTrade,:username,:fullnames,:idRUser)";
$stmtcredog=$this->conn->prepare($sqlcredog);


 $stmtcredog->bindParam(':idRUser',$idRUser);

 $stmtcredog->bindParam(':name',$name);
 $stmtcredog->bindParam(':surname',$surname);
 $stmtcredog->bindParam(':dob',$dob);
 $stmtcredog->bindParam(':phone',$phone);
 $stmtcredog->bindParam(':snum',$snum);
 $stmtcredog->bindParam(':gender',$gender);
 $stmtcredog->bindParam(':address',$address);
 $stmtcredog->bindParam(':town',$town);
 $stmtcredog->bindParam(':ugenid',$ugenid);

 $stmtcredog->bindParam(':producTy',$producTy);
 $stmtcredog->bindParam(':producNam',$producNam);
 $stmtcredog->bindParam(':producNum',$producNum);
 $stmtcredog->bindParam(':agentNa',$agentNa);

 $stmtcredog->bindParam(':instagra',$instagra);
 $stmtcredog->bindParam(':timeN',$timeN);
 $stmtcredog->bindParam(':timeE',$timeE);

 $stmtcredog->bindParam(':username',$username);
 $stmtcredog->bindParam(':startTrade',$startTrade);
 $stmtcredog->bindParam(':endTrade',$endTrade);
 $stmtcredog->bindParam(':fullnames',$fullnames);
////////////////////////////////////////////////////////////////////////////////
if($stmtcredog->execute())
{
//echo "DOG CREATED";
///////////////////////////////////////
if($ratz==0.0)
{
 $tokendoi=mt_rand(1,999);
 $tokendo=$tokendoi.$seidd;
 $tokendohash=$tokendoi.$seidd;

 $sql="Update userx set tokendo=:tokendoen,tokendohash=:tokendohash where id=:id";

 $stmt=$this->conn->prepare($sql);
 $stmt->bindParam(':tokendoen',$tokendo);
 $stmt->bindParam(':tokendohash',$tokendohash);
 $stmt->bindParam(':id',$idSDB);

 $stmt->execute();

 $verdi="Created";
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

 
 
 
}
else
{

 $skorefin=$skoredb+$ratz;
 $dnumfin=$dnumdb+5;
 $ratfini=($skorefin/$dnumfin);
 $ratfin=$ratfini*100;
 $ratfin=(int)$ratfin;
 $ratfin=$ratfin+1;


 $tokendoi=mt_rand(1,999);
 $tokendo=$tokendoi.$seidd;
 $tokendohash=$tokendoi.$seidd;

 $sql="Update userx set tokendo=:tokendoen,tokendohash=:tokendohash,ratzov=:ratfin,skore=:skorefin,dnum=:dnumfin where id=:id";



 $stmt=$this->conn->prepare($sql);
 $stmt->bindParam(':tokendoen',$tokendo);
 $stmt->bindParam(':tokendohash',$tokendohash);
 $stmt->bindParam(':id',$idSDB);
 $stmt->bindParam(':ratfin',$ratfin);
 $stmt->bindParam(':skorefin',$skorefin);
 $stmt->bindParam('dnumfin',$dnumfin);

 $stmt->execute();

$verdi="Created";
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


}
/////////////////////////////////////








}
else
{
$verdi="NOT Created";
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


}
///////////////////////////////////////////////////////////////////////////////////



	
//}



}

public function vouChekaTra($id,$keypinnx)
{

$vouchCheVerdit=$this->vouChekaSql($id,$keypinnx);
return $vouchCheVerdit;
}


public function vouChekaSql($id,$keypinnx)
{

$sqlvouchC="Select * from codpin where idRUser=:id";
$stmtvou=$this->conn->prepare($sqlvouchC);
$stmtvou->bindParam(':id',$id);
$stmtvou->execute();
$rowvou=$stmtvou->fetchAll(PDO::FETCH_ASSOC);
foreach ($rowvou as  $valuev) 
{
$voudb=$valuev['keypinnx'];
$iddbv=$valuev['idRUser'];
}

if(password_verify($keypinnx,$voudb) && $iddbv==$id)
{
	return true;
}
else
{
	return false;
}


}





public function repotransp($name,$surname,$dob,$phone,$snum,$gender,$address,$town,$producTy,$producNam,$producNum,$ugid,$statuC,$startTrade,$idRUser)
{

$this->reposapsdb($name,$surname,$dob,$phone,$snum,$gender,$address,$town,$producTy,$producNam,$producNum,$ugid,$statuC,$startTrade,$idRUser);

}

public function reposapsdb($name,$surname,$dob,$phone,$snum,$gender,$address,$town,$producTy,$producNam,$producNum,$ugid,$statuC,$startTrade,$idRUser)
{
$sqlreposaps="INSERT INTO user_trade_tabc (name,surname,dob,phone,snum,gender,address,town,producTy,producNam,producNum,ugenid,statuC,startTrade,idRUser)
values(:name,:surname,:dob,:phone,:snum,:gender,:address,:town,:producTy,:producNam,:producNum,:ugid,:statuC,:startTrade,:idRUser)";
$stmtreposaps=$this->conn->prepare($sqlreposaps);
$stmtreposaps->bindParam(':idRUser',$idRUser);
$stmtreposaps->bindParam(':name',$name);
$stmtreposaps->bindParam(':surname',$surname);
$stmtreposaps->bindParam(':dob',$dob);
$stmtreposaps->bindParam(':phone',$phone);
$stmtreposaps->bindParam(':snum',$snum);
$stmtreposaps->bindParam(':gender',$gender);
$stmtreposaps->bindParam(':address',$address);
$stmtreposaps->bindParam(':town',$town);
$stmtreposaps->bindParam(':ugid',$ugid);

$stmtreposaps->bindParam(':producTy',$producTy);
$stmtreposaps->bindParam(':producNam',$producNam);
$stmtreposaps->bindParam(':producNum',$producNum);
$stmtreposaps->bindParam(':statuC',$statuC);
$stmtreposaps->bindParam(':startTrade',$startTrade);
if($stmtreposaps->execute())
{
	echo "REPORTED";
}
else
{
	echo "NOT REPO";
}

}




public function helpTransporter($phone,$ugenid)
{
$this->helpdbsqlh($phone,$ugenid);

}


public function helpdbsqlh($phone,$ugenid)
{

$tyd=time();
$resso="Logged";
$sqlhelpdo="Insert into reg_user_help00 (phone,ugenid,dat) values (:phone,:ugenid,:dag) ";
$stmthelpdo=$this->conn->prepare($sqlhelpdo);
$stmthelpdo->bindParam(':phone',$phone);
$stmthelpdo->bindParam(':ugenid',$ugenid);
$stmthelpdo->bindParam(':dag',$tyd);
if($stmthelpdo->execute())
{
$response=array("resso"=>$resso);
$status="1";echo json_encode(array("data"=>$response,"status"=>$status));
}
else
{
$status="0";echo json_encode(array("status"=>$status));
}




} 


public function updateTra($phonee,$addresse,$snume,$towne,$phoneec,$addressec,$snumec,$townec,$pinn,$id)
{

//$this->db->updateDbsql($phonee,$addresse,$snume,$towne,$phoneec,$addressec,$snumec,$townec,$pinn,$id);
/////
//public function updateDbsql($phonee,$addresse,$snume,$towne,$phoneec,$addressec,$snumec,$townec,$pinn,$id)
//{

$sqlupdapro="Update User_Details set phone=:phone,address=:address,snum=:snum,town=:town,pinn=:pinn where id=:id";
$stmtupdapro=$this->conn->prepare($sqlupdapro);
$stmtupdapro->bindParam(':id',$id);
$stmtupdapro->bindParam(':phone',$phoneec);
$stmtupdapro->bindParam(':snum',$snumec);
$stmtupdapro->bindParam(':address',$addressec);
$stmtupdapro->bindParam(':town',$townec);
$stmtupdapro->bindParam(':pinn',$pinn);
if($stmtupdapro->execute())
{
$sqlupdaprom="Update user_mi_deta_tu_marketing_depp set phoneV=:phone,addressV=:address,snumV=:snum,townV=:town,pinnV=:pinn where  idRUserV=:id";
$stmtupdaprom=$this->conn->prepare($sqlupdaprom);
$stmtupdaprom->bindParam(':id',$id);
$stmtupdaprom->bindParam(':phone',$phonee);
$stmtupdaprom->bindParam(':snum',$snume);
$stmtupdaprom->bindParam(':address',$addresse);
$stmtupdaprom->bindParam(':town',$towne);
$stmtupdaprom->bindParam(':pinn',$pinn);
if($stmtupdaprom->execute())
{

$verdi="Updated";
echo json_encode(array('verdict'=>$verdi));

}else{echo "NOT Updated";}

}
else
{echo "NOT UPDATED";}





//}
    
    
    
//////
}


    
    

    
    
    
}



?>