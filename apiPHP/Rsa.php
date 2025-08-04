<?php

class Rsa{


private static function getPublicKey()
{
$abs_path='-rsa_public_key.pem';
	$content=file_get_contents($abs_path);
	return openssl_pkey_get_public($content);
}


public static function publicEncrypt($data='')
{

if(!is_string($data)){return null;}
return openssl_public_encrypt($data,$encrypted,self::getPublicKey())? base64_encode($encrypted):null;
}



}



?>
