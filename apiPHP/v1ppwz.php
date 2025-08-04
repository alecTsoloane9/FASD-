<?php
if(($_SERVER['REQUEST_METHOD']=='POST') && (stripos($_SERVER['HTTP_USER_AGENT'],"Android")))
{

include 'inif/initdbcon.php';

include 'Secenc.php';

//$keyyy="VitualLabCollege867401628^%&)#$";


try{$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);}
catch (PDOException $e){print 'Error: ' .$e->getMessage(). '<br/>';die();}

$ugenid=$_POST['ugenid'];
$id=$_POST['id'];
$keyyy=$_POST['keyy'];
$seidd=$id;

$statusOZ="ON";

$sql="SELECT * FROM userx WHERE id=:id && statusOZ=:statusOZ";
$response=array();
$stmt=$conn->prepare($sql);
$stmt->bindParam(':id',$id);
$stmt->bindParam(':statusOZ',$statusOZ);
$stmt->execute();


if($stmt->rowCount()>0)
{

$col=$stmt->fetch(PDO::FETCH_ASSOC);
$idDBDB=$col['id'];
$ugid=$col['ugenid'];



if(password_verify($ugenid,$ugid) )
{

$tokendoi=mt_rand(1,999);
$tokendoii=$tokendoi;

$ranS=strval($tokendoii);
$v=strlen($ranS);
if($v===1)
{
$f=mt_rand(1,9);
$s=mt_rand(1,9);
$tokendoi=$f.$s.$tokendoii;
}
elseif($v===2)
{
$f=mt_rand(1,9);
$tokendoi=$f.$tokendoii;
}
elseif($v===3)
{$tokendoi=$tokendoii;}


$tokendo=$tokendoi.$seidd;

$tokendoen=encToka($tokendo,$keyyy);

$tokendohash=password_hash($tokendo,PASSWORD_DEFAULT);


$sql="Update userx set tokendo=:tokendoen,tokendohash=:tokendohash where id=:seidd";

$stmt=$conn->prepare($sql);
$stmt->bindParam(':tokendoen',$tokendoen);
$stmt->bindParam(':tokendohash',$tokendohash);
$stmt->bindParam(':seidd',$seidd);

if($stmt->execute())
{

$sql="SELECT * FROM userx WHERE id=:id && statusOZ=:statusOZ";

$stmt=$conn->prepare($sql);
$stmt->bindParam(':statusOZ',$statusOZ);
$stmt->bindParam(':id',$id);
$stmt->execute();

$stmt=$conn->prepare($sql);
$stmt->bindParam(':statusOZ',$statusOZ);
$stmt->bindParam(':id',$id);
$stmt->execute();
$stmt->bindColumn('tokendo',$tokendo_enc);
$stmt->fetch(PDO::FETCH_BOUND);

$tokendodec=decToka($tokendo_enc,$keyyy);

$user = array('tokendo'=>$tokendodec);


$response[] = $user; 
$status="ONO";echo json_encode(array("data"=>$response,"status"=>$status));
//echo json_encode(array("data"=>$response));

}
else
{echo "NO  execue";}


} 

else

{$status3="UGEN ID NOT SAME";echo json_encode(array("status"=>$status3));exit();}

}
else
{	
    $status="OFFO";echo json_encode(array("status"=>$status));

    
    
}


}

else
{$status3="POST ERROR";echo json_encode(array("status"=>$status3));exit();}

?>

