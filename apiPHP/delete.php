
<?php
require_once 'inif/init.php';
$id=$_GET['id'];
$user=new User();

if(!$user->isLoggedin())
{Redirect::to('index.php');}


$upp=DB::getInstance()->delete('userx',array('id','=',$id));
Redirect::to('profile.php');


?>






