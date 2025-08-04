<?php
if(($_SERVER['REQUEST_METHOD']=='POST') && (stripos($_SERVER['HTTP_USER_AGENT'],"Android")))
{

include 'inif/initdbcon.php';
require_once "Rsa.php";
$rsa=new Rsa();


try{$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);}catch (PDOException $e){print 'Error: ' .$e->getMessage(). '<br/>';die();}



$response=array();
$status="";

$id=$_POST['id'];
$statusOZ=$_POST['gsta'];
/*
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

*/

/*
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

*/
/*
$sql="SELECT * FROM user_details__tyup7908_1quytqpoensq456 WHERE id__plamndgt40967w=:id";
$stmt=$conn->prepare($sql);
$stmt->bindParam(':id',$id);
$stmt->execute();


if($stmt->rowCount()>0)
{
	//we got something
$col=$stmt->fetch(PDO::FETCH_ASSOC);
$idDBDB=$col['id__plamndgt40967w'];
 $registered_date=$col['active_dat__plannbcfdrdr309658'];
 $trial_date=$col['expireTrial__plansbdt4097533nnqpl'];
 $ugid=$col['ugenid__nnfhw093ygdnava456_opbv'];

if(password_verify($ugenid,$ugid) && ($registered_date<$trial_date) )
{
/////////////////////////////////////////////////////////////////////////trial period is valid
*/

$sql="Update userx set statusOZ=:statusOZ where id=:id";
$stmt=$conn->prepare($sql);
$stmt->bindParam(':id',$id);
$stmt->bindParam(':statusOZ',$statusOZ);


if($stmt->execute())
{


$verdi="Updated";
echo json_encode(array('verdict'=>$verdi));

}else{echo "NOT Updated";}



exit();
/////////////////////////////////////////////////////////////////////////1111111111111111111111111111111111111111end of trial period dog create

/*
elseif(password_verify($ugenid,$ugid) AND ($registered_date>$trial_date) )
{
/////////////////////////////////////////////////////////////////////////222222222222222222222222222222222222trial period is OVER
$sql="SELECT * FROM codpin__8090ahmbbmw_2ca52hyurpol_67po WHERE idRUser__uywfvx905_0967=:id";
$stmt=$conn->prepare($sql);
$stmt->bindParam(':id',$id);
$stmt->execute();
if($stmt->rowCount()>0)
{
$col=$stmt->fetch(PDO::FETCH_ASSOC);
$idRUserr=$col['idRUser__uywfvx905_0967'];
$vou=$col['keypinnx__jdhnvb54xvdf957'];
if(password_verify($keypinnx,$vou))
{

$sql="Update user_details__tyup7908_1quytqpoensq456 set phone__yroowbsndt4020544urnf=:phone,address__pow784098774hnfnslao628=:address,snum__jhdrwpoytnmacvs3095=:snum,town__jfhfgde09746655htjg=:town,pinn__uurrpou304087572nnxx=:pinn where id__plamndgt40967w=:id";

$stmt=$conn->prepare($sql);
$stmt->bindParam(':id',$id);
$stmt->bindParam(':phone',$phoneec);
$stmt->bindParam(':snum',$snumec);
$stmt->bindParam(':address',$addressec);
$stmt->bindParam(':town',$townec);
$stmt->bindParam(':pinn',$pinn);
*/
/*if($stmt->execute())
{
////////////////
	$sqlm="Update user_mi_deta_tu_marketing_depp__3095shd set phoneV__903hhbfmnaskldfuwop=:phone,addressV__q23nbmnfg677w1qsd=:address,snumV__pqnndplayu78nmvct45=:snum,townV__kwnmfbfgng4578lmm=:town,pinnV__kwnmfbfgng4578lmm=:pinn where id__hhdssdmnvv673=:id";
$stmtm=$conn->prepare($sqlm);
$stmtm->bindParam(':id',$id);
$stmtm->bindParam(':phone',$phonee);
$stmtm->bindParam(':snum',$snume);
$stmtm->bindParam(':address',$addresse);
$stmtm->bindParam(':town',$towne);
$stmtm->bindParam(':pinn',$pinn);
if($stmtm->execute())
{
$verdi="Updated";
echo json_encode(array('verdict'=>$verdi));

}
else{echo "NOT Updated";}
///////////////////

}
else
{echo "NOT UPDATED";}


}
else
{
	echo "PASSWORD VERI FAILED";
}


}
else
{echo "ROWCOUNT FAILED";}

exit();
/////////////////////////////////////////////////////////////////////////22222222222222222222222222222222222222end of dog createfor SUBSCRIBER
}




else
{
/////////////////////////////////////////////////////////////////////////3333333333333333333333333333id and date dont match


exit();
/////////////////////////////////////////////////////////////////////////3333333333333333333333333333end of dog createfor SUBSCRIBER
}

}
else
{
	echo "USER ID NOT FOUND IN DETAILS TAB ...2nd if";
}






*/






}
else
{$status="POST ERROR";echo json_encode(array("status"=>$status));}




?>