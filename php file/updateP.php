<?php
require_once('db.php');

$id=(int)$_POST['P_id'];

$s="UPDATE patient SET  Fname='".$_POST['First_Name']."'
,Lname='".$_POST['Last_Name']."',email='".$_POST['email']."',password='".$_POST['password']."',
contact='".$_POST['contact']."',age='".$_POST['age']."',
Emerg_name='".$_POST['EN']."',Emerg_contact='".$_POST['EC']."' WHERE P_id=$id";





$q=mysqli_query($con,$s);
if($q){
http_response_code(200);
}
else{
http_response_code(404);
}
?>