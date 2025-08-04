<?php
if(($_SERVER['REQUEST_METHOD']=='POST') && (stripos($_SERVER['HTTP_USER_AGENT'],"Android")))

{
include 'inif/initdbcon.php';
include 'Secenc.php';

//$keyyy="VitualLabCollege867401628^%&)#$";
try{
$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);
}catch (PDOException $e){print 'Error: ' .$e->getMessage(). '<br/>';die();}
$response=array();
$response2=array();
$status1="";
$status2="";
$status3="";
$status4="";



$usernameL=$_POST['username'];
$username=strtolower($usernameL);
$passwordd=$_POST['password'];
$agentPa=$_POST['agentPa'];
$agentNa=$_POST['agentNa'];
$fullnames=$_POST['fullnames'];
$firstname=$_POST['firstname'];
$ugenidpl=$_POST['ugenid'];
$keyyy=$_POST['keyy'];

$ugenid=password_hash($ugenidpl,PASSWORD_DEFAULT);

$keyx="0";
$keypinnx="0";
$sql="SELECT ugenid FROM userx";
$stmt=$conn->prepare($sql);
$stmt->execute();
$rowa=$stmt->fetchAll(PDO::FETCH_ASSOC);

foreach($rowa as $r)
{
foreach ($r as  $value) 
{$v[]=$value;}
}

foreach($v as $ugid)
{
if(password_verify($ugenidpl,$ugid))
{$status1="0";echo "ALREADY REGISTERED";exit();}
}


/////////////////////////////////////////////////////////////
//register user in here.....
$verified="asd";
$sql="SELECT * FROM userx where username=:username && verified=:verified";
$stmt=$conn->prepare($sql);
$stmt->bindParam(':username',$username);
$stmt->bindParam(':verified',$verified);
$stmt->execute();
$rowa=$stmt->fetchAll(PDO::FETCH_ASSOC);
foreach($rowa as $rowd)
{
$usernamee=$rowd['username'];
$instagraa=$rowd['instagra'];
$emaill=$rowd['email'];
$passwdd=$rowd['password'];
$pubkeyy=$rowd['vkey'];
$usernamee_id=$rowd['id'];
}

if(empty($usernamee))
{exit();}
else
{

if(password_verify($passwordd,$passwdd))

{
 
$statusOZ="ON";
$tokendo=mt_rand(1,999);
$skore=0;
$ratzov=0;
$dnum=0;
$tokendoen="0T5q9ieoej";
$tokendohash="0T5q9ieoej";

$sql="INSERT INTO userx 
(username,instagra,fullnames,statusOZ,ugenid,tokendo,password,email,firstname,agentPa,agentNa,ratzov,skore,dnum,username_id,tokendohash)
values
(:username,:instagra,:fullnames,:statusOZ,:ugenid,:tokendo,:password,:email,:firstname,:agentPa,:agentNa,:ratzov,:skore,:dnum,:username_id,:tokendohash)";
$stmt=$conn->prepare($sql);

$stmt->bindParam(':ugenid',$ugenid);
$stmt->bindParam(':password',$password);
$stmt->bindParam(':email',$email);
$stmt->bindParam(':username',$usernamee);
$stmt->bindParam(':instagra',$instagraa);
$stmt->bindParam(':fullnames',$fullnames);
$stmt->bindParam(':statusOZ',$statusOZ);
$stmt->bindParam(':firstname',$firstname);
$stmt->bindParam(':agentPa',$agentPa);
$stmt->bindParam(':agentNa',$agentNa);
$stmt->bindParam(':tokendo',$tokendo);
$stmt->bindParam(':ratzov',$ratzov);
$stmt->bindParam(':skore',$skore);
$stmt->bindParam(':username_id',$usernamee_id);
$stmt->bindParam(':dnum',$dnum);
$stmt->bindParam(':tokendohash',$tokendohash);
if($stmt->execute())
{


$seidd=$conn->lastInsertId();
$sql="SELECT * FROM userx WHERE id=:seidd";

$stmt=$conn->prepare($sql);
$stmt->bindParam(':seidd',$seidd);
$stmt->execute();

while($row=$stmt->fetch(PDO::FETCH_ASSOC)){$response[]=$row;}
if(sizeof($response)==0)
{$status="0";echo json_encode(array("status"=>$status));}
else
{$status="1";echo json_encode(array("data"=>$response,"status"=>$status));}
}
else{
 exit();
    
}


}



	

else
{exit();}
}






}
else
{exit();}

?>


