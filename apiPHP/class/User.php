<?php  
class User{
private $db,$data,$sessionName,$cookieName;
private $isLoggedin;
public function __construct($user=null)
{
	$this->db=DB::getInstance();
	$this->sessionName=Config::get('session/session_name');
	$this->cookieName=Config::get('remember/cookie_name');
	if(!$user){
		if(session::exists($this->sessionName)){
			$user=session::get($this->sessionName);
			if($this->find($user)){
				$this->isLoggedin=true;
			}else{
				//log out
			}
		}
	} else{
		$this->find($user);
	}
}	

public function update($fields=array(),$id=null){
if(!$id && $this->isLoggedin())
	{$id=$this->data->id;}
if(!$this->db->update('userx',$id,$fields))
{throw new Exception("ERROR ON UPDATE METHOD");}

}


public function create($fields=array())
{
	if(!$this->db->insert('userx',$fields)){
throw new Exception("ERROR IN USER-CREATE");

	}
}

public function createnpw($fields=array())
{
	if(!$this->db->insert('pasowres8380',$fields)){
throw new Exception("ERROR IN USER-CREATE");

	}
}



public function find ($user=null){
	if($user){
		$field=(is_numeric($user)) ? 'id': 'username';
		$data=$this->db->get('userx',array($field,'=',$user));
		if($data->count())
		{$this->data=$data->first();
return true;

		}
	}
}



public function login($username=null,$password=null,$remember=false)
{

if(!$username && !$password && $this->exists())
{
session::put($this->sessionName,$this->data()->id);
}
else
{ 
	$user=$this->find($username);
if($user){
if(password_verify($password,$this->data()->password))
{
session::put($this->sessionName,$this->data()->id);
if($remember){
	$hash=hash::unique();
	$hashCheck=$this->db->get('session_tab',array('user_id','=',$this->data()->id));
	if(!$hashCheck->count())
	{
     $this->db->insert('session_tab',array(
     	'user_id'=>$this->data()->id,
        'hash'=>$hash
     	));
	}
	else{		$hash=$hashCheck->first()->hash;}
Cookie::put($this->cookieName,$hash,Config::get('remember/cookie_expiry'));
}
return true;
}
}
}
return false;
}



public function data(){
	return $this->data;
}



public function isLoggedin(){
	return $this->isLoggedin;
}

public function exists(){
	return (!empty($this->data)) ? true : false;
}


public function logout(){
$this->db->delete('session_tab',array('user_id','=',$this->data()->id));
session::delete($this->sessionName);
Cookie::delete($this->cookieName);
}





}


?>