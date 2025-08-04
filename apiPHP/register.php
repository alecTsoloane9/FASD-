<?php
require_once 'inif/init.php';
$error="";

if(inputs::exists())
{
if(token::check(inputs::get('token')))
{
$validate=new Validate();

$validation=$validate->check($_POST,
array(
'username'=>array(
'required'=>true,
'min'=>2,
'max'=>20,
'unique'=>'userx'),

'instagra'=>array(
'required'=>true,
'min'=>2,
'max'=>60),

'email'=>array(
'required'=>true,
'min'=>5,
'max'=>30),

'password'=>array(
'required'=>true,
'min'=>6),

'Password2'=>array(
'required'=>true,
'min'=>2,
'matches'=>'password'),
));

if($validation->passed())
{
$user=new User();
try{

$pwd1=(inputs::get('password'));
$una1=(inputs::get('username'));

$una=strtolower($una1);



$cou=$user->create(array(
'username'=>$una,
'instagra'=>inputs::get('instagra'),
'email'=>inputs::get('email'),
'password'=>password_hash($pwd1,PASSWORD_DEFAULT)

    ));


}
catch(Exception $e)
{
die($e->getMessage());
}
//  session::flash('success',"You registered successfully");
}
else
{
foreach($validation->errors() as $error)
{


}
}

}
}


?>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Register</title>
    <link href="styler/one.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>

<div id="all1">
    
<?php include('funks.php') ?>
<div class="bodylogo"></br>
<span class="logoMain"><?php exdoname(); ?></span>
</br>
<span class="logoMains"><?php exdonames(); ?></span>
</div>


</div>
<div id="cov">

<div class="bodyhead">

<?php exnavi();?>


</div>
    

<div id="framer">



</br>
<div id="newslis">




 <div id="conn">









<div class="main1">

  <h2>Register</h2>
    <form action="" method="post">
     
<p class="errorbox" >

<?php
      echo $error. "<br/>";


     ?>

</p>
<input type="text" name="username" id="username"  class="txta" placeholder="Username" required="" value="<?php echo (inputs::get('username'));?>">
<br/>
<input type="text" name="instagra" id"instagra" class="txta" placeholder="Instagra" required="" value="<?php echo (inputs::get('instagra'));?>" >
<input type="email" name="email" id="email" class="txta" placeholder="Email" required="" value="<?php echo (inputs::get('email'));?>">
<input type="password" class="txta" placeholder="Password" required="" name="password" id="password"  >
<input type="password" class="txta" placeholder="Repeat Password" required="" name="Password2" id="Password2" >
<input type="hidden" name="token" value="<?php echo  token::generate();   ?>"  >
<input type="submit" value="Register" name="register">    
<p><hr class="maina" /></p>
           <p>Already a member? <a class="navlo" href="login.php">Sign in</a> </p>


<br/>


    </form>

</div>
   </div>
  

  

</div>






</div>




</div>
      
<div class="social"> </br></div>


</div>  
    



<div class="footer">
</br>
<span class="foottev">  <a href="contact.php">Contact us</a> 
</span>
</br>
</br>
<span class="footte">&copy <?php echo date("Y"); ?>&nbsp;&nbsp;All rights reserved.</span> 


</br></br></br></br>

</br></br></br></br></br></br>
</br></br></br></br></br></br>
</br></br></br></br></br></br>

</div>
    




</div>

</body>
</html>