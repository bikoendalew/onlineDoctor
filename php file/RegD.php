<?php
require_once('db.php');



$filename=$_FILES['image']['name'];
$filetmpname=$_FILES['image']['tmp_name'];
$folder='IU/';
move_uploaded_file($filetmpname,$folder.$filename);

$fn=$_POST['First_Name'];
$ln=$_POST['Last_Name'];
$e=$_POST['email'];
$p=$_POST['password'];
$c=$_POST['contact'];




$s="INSERT INTO doctor   (Fname,Lname,email,password,contact,img) 
VALUES('".$fn."','".$ln."','".$e."','".$p."','".$c."','".$filename."')";








$q=mysqli_query($con,$s);
if($q){
http_response_code(200);
}
else{
http_response_code(404);
}
?>