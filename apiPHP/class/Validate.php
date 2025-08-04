<?php
class Validate
{
private $passed=false;
private $errors=array();
private $db=null;
public function __construct()
{
$this->db=DB::getInstance();}

public function check($source,$items=array())
{
foreach($items as $item =>$rules)
{
foreach($rules as $rule=>$rule_value)
{
$value=trim($source[$item]);

if($rule==='required' && empty($value))
{$this->addError("$item is required");
}
elseif(!empty($value))
{
switch($rule)
{

case'min':
if(strlen($value)<$rule_value){$this->addError("{$item} must be min of {$rule_value} character.");}
break;

case 'max':
if(strlen($value)>$rule_value){$this->addError("{$item} must be a max of {$rule_value} chars.");}
break;

case 'matches':
if($value!=$source[$rule_value]){$this->addError("{$rule_value} must match {$item}");}
break;

case 'unique':
$check=$this->db->get($rule_value,array($item,'=',$value));
if($check->count()){$this->addError("{$item} already exists");}

break;

}
}
}
}
if(empty($this->errors)){$this->passed=true;}
return $this;
}



private function addError($error){
	$this->errors[]=$error;
}

public function errors(){
	return $this->errors;
}

public function passed(){
	return $this->passed;
}

}

?>