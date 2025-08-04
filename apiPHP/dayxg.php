<?php
include 'inif/initdbcon.php';
try{
$conn=new PDO('mysql:host='.$host.';dbname='.$database,$username,$password);
}catch (PDOException $e){print 'Error: ' .$e->getMessage(). '<br/>';die();}

//$username=$_POST['username'];

$t1=0;
$t2=0;
$t3=0;
$t4=0;
$t5=0;
$t6=0;
$t7=0;
$t8=0;
$t9=0;
$t10=0;
$t11=0;
$t12=0;
$t13=0;
$t14=0;
$t15=0;
$t16=0;
$t17=0;
$t18=0;
$t19=0;
$t20=0;
$t21=0;
$t22=0;
$t23=0;
$t24=0;

$dayyw=date("w");
//$username="traderTom";
$yearr=date("Y");
$monthh=date("n");
$dayym=date("j");
$hourr=date("G");
$username=$_POST['ugenid'];
$stmt="Select hourr from statinstagra where username=:username and yearr=:yearr and monthh=:monthh and dayym=:dayym";


$pa=$conn->prepare($stmt);
$pa->bindParam(':username',$username);
$pa->bindParam(':yearr',$yearr);
$pa->bindParam(':monthh',$monthh);
$pa->bindParam(':dayym',$dayym);
$pa->execute();
$dat=$pa->fetchAll(PDO::FETCH_ASSOC);

foreach ($dat as $key => $value)
{
if($value['hourr']==1){$t1++;}
elseif($value['hourr']==2){$t2++;}
elseif($value['hourr']==3){$t3++;}
elseif($value['hourr']==4){$t3++;}
elseif($value['hourr']==5){$t5++;}
elseif($value['hourr']==6){$t6++;}


elseif($value['hourr']==7){$t7++;}
elseif($value['hourr']==8){$t8++;}
elseif($value['hourr']==9){$t9++;}
elseif($value['hourr']==10){$t10++;}
elseif($value['hourr']==11){$t11++;}
elseif($value['hourr']==12){$t12++;}
elseif($value['hourr']==13){$t13++;}
elseif($value['hourr']==14){$t14++;}
elseif($value['hourr']==15){$t15++;}
elseif($value['hourr']==16){$t16++;}
elseif($value['hourr']==17){$t17++;}
elseif($value['hourr']==18){$t18++;}
elseif($value['hourr']==19){$t19++;}



elseif($value['hourr']==20){$t20++;}
elseif($value['hourr']==21){$t21++;}
elseif($value['hourr']==22){$t22++;}
elseif($value['hourr']==23){$t23++;}
elseif($value['hourr']==24){$t24++;}



}
$hbh=array("h1"=>(string)$t1,"h2"=>(string)$t2,"h3"=>(string)$t3,"h4"=>(string)$t4,"h5"=>(string)$t5,"h6"=>(string)$t6,"h7"=>(string)$t7,
	"h8"=>(string)$t8,"h9"=>(string)$t9,"h10"=>(string)$t10,"h11"=>(string)$t11,"h12"=>(string)$t12,"h13"=>(string)$t13,"h14"=>(string)$t14,
	"h15"=>(string)$t15,"h16"=>(string)$t16,"h17"=>(string)$t17,"h18"=>(string)$t18,"h19"=>(string)$t19,"h20"=>(string)$t20,"h21"=>(string)$t21,
	"h22"=>(string)$t22,"h23"=>(string)$t23,"h24"=>(string)$t24
	);
$hbhh[]=$hbh;
echo json_encode(array("data"=>$hbhh));


?>