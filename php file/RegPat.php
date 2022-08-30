<?php
require_once('db.php');

$s="INSERT INTO patient (Fname,Lname,email,password,contact,age,Emerg_name,Emerg_contact)
VALUES('".$_POST['First_Name']."','".$_POST['Last_Name']."','".$_POST['email']."',
'".$_POST['password']."','".$_POST['contact']."','".$_POST['age']."','".$_POST['Emerg_name']."','".$_POST['Emerg_contact']."')";

$q=mysqli_query($con,$s);
if($q){
http_response_code(200);
}
else{
http_response_code(404);
}
?>