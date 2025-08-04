<?php
if(($_SERVER['REQUEST_METHOD']=='POST') && (stripos($_SERVER['HTTP_USER_AGENT'],"Android")))
{


include 'inif/initdbcon.php';

try{$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);
}catch (PDOException $e){print 'Error: ' .$e->getMessage(). '<br/>';die();}
$user=array();
$response=array();
$responseF=array();

$ugenid=$_POST['ugenid'];
$id=$_POST['id'];
$idOG=$_POST['idOG'];
$uname=$_POST['username'];
$dayyw=date("w");
$yearr=date("Y");
$monthh=date("n");
$dayym=date("j");
$hourr=date("G");
$inou="V";
$timeN=time();
if($dayym<=7){$weekno=1;}elseif ($dayym<=14) { $weekno=2;}elseif ($dayym<=21) {$weekno=3;} elseif($dayym<=31){$weekno=4;}
$statusOZ="ON";
$response=array();

$sql="SELECT * FROM userx WHERE id=:id && statusOZ=:statusOZ";
$stmt=$conn->prepare($sql);
$stmt->bindParam(':id',$id);
$stmt->bindParam(':statusOZ',$statusOZ);
$stmt->execute();

if($stmt->rowCount()>0)
{
$col=$stmt->fetch(PDO::FETCH_ASSOC);
$idDBDB=$col['id'];
$ugid=$col['ugenid'];
$usernamedb=$col['username'];
$username_id=$col['username_id'];
$fullnames=$col['fullnames'];
$instagra1=$col['instagra'];
if($usernamedb==$uname){
if(password_verify($ugenid,$ugid) )
{

$response1=array();

$sql = "SELECT * FROM User_trade_tab where id = :idOG && username=:username" ;
$stmt=$conn->prepare($sql);
$stmt->bindParam(':idOG',$idOG);
$stmt->bindParam(':username',$uname);
$stmt->execute();
$rowa2=$stmt->fetchAll(PDO::FETCH_ASSOC);

$response1=$rowa2;

foreach($rowa2 as $rowda)
{
	$producTy=$rowda['producTy'];
	$producNum=$rowda['producNum'];
	$producNam=$rowda['producNam'];
	$instagra=$rowda['instagra'];
	$idz=$rowda['id'];
    $endTrade=$rowda['endTrade'];
    $startTrade=$rowda['startTrade'];
   $name=$rowda['name'];
   $surname=$rowda['surname'];
   $statuC=$rowda['statuC'];
   $phone=$rowda['phone'];
   $gender=$rowda['gender'];
}

$user = array(
'producTy'=>$producTy,
'producNum'=>$producNum,
'producNam'=>$producNam,
'instagra'=>$instagra,
'id'=>$idz,
'endTrade'=>$endTrade,
'startTrade'=>$startTrade,
'name'=>$name,
'surname'=>$surname,
'statuC'=>$statuC,
'phone'=>$phone,
'gender'=>$gender
);
$responseF[] = $user;

if(sizeof($response1)!=0)
{
///////////////////////////////////////////////////////stat



/////////////////////////////////////////////////////////stat
$sql="SELECT * FROM user_trade_tabc WHERE producTy=:producTy && producNam=:producNam && producNum=:producNum";
$response=array();

$stmt=$conn->prepare($sql);
$stmt->bindParam(':producNum',$producNum);
$stmt->bindParam(':producNam',$producNam);
$stmt->bindParam(':producTy',$producTy);
$stmt->execute();

$rowac=$stmt->fetchAll(PDO::FETCH_ASSOC);
foreach($rowac as $rowdac)
{
	$producTyc=$rowdac['producTy'];
	$producNumc=$rowdac['producNum'];
	$producNamc=$rowdac['producNam'];
	$instagrac=$rowdac['instagra'];
	$idzc=$rowdac['id'];
    $endTradec=$rowdac['endTrade'];
    $startTradec=$rowdac['startTrade'];
   $namec=$rowdac['name'];
   $surnamec=$rowdac['surname'];
   $statuCc=$rowdac['statuC'];
   $phonec=$rowdac['phone'];
   $genderc=$rowdac['gender'];
}
$userc = array(
'producTy'=>$producTyc,
'producNum'=>$producNumc,
'producNam'=>$producNamc,
'instagra'=>$instagrac,
'id'=>$idzc,
'endTrade'=>$endTradec,
'startTrade'=>$startTradec,
'name'=>$namec,
'surname'=>$surnamec,
'statuC'=>$statuCc,
'phone'=>$phonec,
'gender'=>$genderc
);
$responseC[] = $userc;


if($producTyc!=null)

{$status="ONO";echo json_encode(array("data"=>$responseC,"status"=>$status));

$sqlstato="INSERT INTO statinstagra (username,instagra,secaid,secanam,timee,yearr,monthh,dayym,dayyw,hourr,weekno,inou,username_id,idodog) 
values(:username,:instagra,:secaid,:secanam,:timee,:year,:monthh,:dayym,:dayyw,:hourr,:weekno,:inou,:username_id,:idodog)";
$stmtstato=$conn->prepare($sqlstato);
$stmtstato->bindParam(':username',$usernamedb);
$stmtstato->bindParam(':instagra',$instagra);
$stmtstato->bindParam(':secaid',$id);
$stmtstato->bindParam(':secanam',$fullnames);
$stmtstato->bindParam(':timee',$timeN);
$stmtstato->bindParam(':year',$yearr);
$stmtstato->bindParam(':monthh',$monthh);
$stmtstato->bindParam(':dayym',$dayym);
$stmtstato->bindParam(':dayyw',$dayyw);
$stmtstato->bindParam(':hourr',$hourr);
$stmtstato->bindParam(':weekno',$weekno);
$stmtstato->bindParam(':inou',$inou);
$stmtstato->bindParam(':idodog',$idOG);
$stmtstato->bindParam(':username_id',$username_id);
$stmtstato->execute();
    
}
else
{$status="ONO";echo json_encode(array("data"=>$responseF,"status"=>$status));

$sqlstato="INSERT INTO statinstagra (username,instagra,secaid,secanam,timee,yearr,monthh,dayym,dayyw,hourr,weekno,inou,username_id,idodog) 
values(:username,:instagra,:secaid,:secanam,:timee,:year,:monthh,:dayym,:dayyw,:hourr,:weekno,:inou,:username_id,:idodog)";
$stmtstato=$conn->prepare($sqlstato);
$stmtstato->bindParam(':username',$usernamedb);
$stmtstato->bindParam(':instagra',$instagra);
$stmtstato->bindParam(':secaid',$id);
$stmtstato->bindParam(':secanam',$fullnames);
$stmtstato->bindParam(':timee',$timeN);
$stmtstato->bindParam(':year',$yearr);
$stmtstato->bindParam(':monthh',$monthh);
$stmtstato->bindParam(':dayym',$dayym);
$stmtstato->bindParam(':dayyw',$dayyw);
$stmtstato->bindParam(':hourr',$hourr);
$stmtstato->bindParam(':weekno',$weekno);
$stmtstato->bindParam(':inou',$inou);
$stmtstato->bindParam(':idodog',$idOG);
$stmtstato->bindParam(':username_id',$username_id);
$stmtstato->execute();
    
}

}
else
{$status="ONO";echo json_encode(array("data"=>$response,"status"=>$status));}


} ////////////end of password verify 
else

{
$status3="GENERR";echo json_encode(array("status"=>$status3));exit();
    
}

    
}///end of password verify true
else
{

$status="GENERR";////password_verify
echo json_encode(array("status"=>$status));
    
}
}///end of offline
else
{

$status="OFFO";
echo json_encode(array("status"=>$status));

}////rowcount ends here for 1st if


} ////end of POST check

else
{$status3="POST ERROR";echo json_encode(array("status"=>$status3));
exit();
}

?>

