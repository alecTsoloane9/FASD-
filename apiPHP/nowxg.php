<?php
include 'inif/initdbcon.php';
try{
$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);
}catch (PDOException $e){print 'Error: ' .$e->getMessage(). '<br/>';die();}

//$username="traderTom";
$username=$_POST['u'];
$hourr=date("G");
$dayyw=date("w");
$yearr=date("Y");
$monthh=date("n");
$dayym=date("j");


$stmt="Select hourr from statinstagra where username=:username and yearr=:y and monthh=:m and dayym=:dm and hourr=:hourr";

$pa=$conn->prepare($stmt);
$pa->bindParam(':username',$username);
$pa->bindParam(':hourr',$hourr);
$pa->bindParam(':y',$yearr);
$pa->bindParam(':m',$monthh);
$pa->bindParam(':dm',$dayym);
$pa->execute();
$dat=$pa->fetchAll(PDO::FETCH_ASSOC);
$rn= sizeof($dat);
//print_r($dat);
//echo "       HIII     ";
echo json_encode(array("data"=>(string)$rn));

?>