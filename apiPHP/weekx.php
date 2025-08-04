<?php
include 'inif/initdbcon.php';

$con=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);

$wd1=0;
$wd2=0;
$wd3=0;
$wd4=0;
$wd5=0;
$wd6=0;
$wd7=0;
$dayyw=date("w");
//$uname="traderTom";
$yearr=date("Y");
//$monthh=date("n");
$dayym=date("j");
$hourr=date("G");
//$weekno=2;
$weekno=$_POST['w'];
$monthh=$_POST['m'];
$uname=$_POST['ugenid'];
$sql="Select dayyw from statinstagra where username=:u and yearr=:yearr and monthh=:mon and weekno=:w";
$stmt=$con->prepare($sql);
$stmt->bindParam(':u',$uname);
$stmt->bindParam(':yearr',$yearr);
$stmt->bindParam(':mon',$monthh);
$stmt->bindParam(':w',$weekno);
$stmt->execute();
$datastm=$stmt->fetchAll(PDO::FETCH_ASSOC);
foreach ($datastm as $key => $value) {
	
	foreach ($value as $key => $valuee) {
	//echo $valuee ." </br>";	

	if($valuee==1)
	{
		$wd1++;
	}
	elseif ($valuee==2) {
		$wd2++;
	}
	elseif ($valuee==3) {
		$wd3++;
	}
	elseif ($valuee==4) {
		$wd4++;
	}
	elseif ($valuee==5) {
		$wd5++;
	}
	elseif ($valuee==6) {
		$wd6++;
	}
	elseif($valuee==7)
		{$wd7++;}
	else{

	}	
	}
}


$weekekse=array("Mon"=>$wd1,"Tue"=>$wd2,"Wed"=>$wd3,"Thu"=>$wd4,"Fri"=>$wd5,"Sat"=>$wd6,"Sun"=>$wd7);
echo json_encode(array("data"=>$weekekse));

?>