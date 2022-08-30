<?php
require_once('db.php');

$id=(int)$_POST['D_id'];

$filename=$_FILES['image']['name'];
$filetmpname=$_FILES['image']['tmp_name'];
$folder='IU/';
move_uploaded_file($filetmpname,$folder.$filename);


$s="UPDATE doctor SET  Fname='".$_POST['First_Name']."'
,Lname='".$_POST['Last_Name']."',email='".$_POST['email']."',password='".$_POST['password']."',
contact='".$_POST['contact']."',
img='".$filename."' WHERE D_id=$id";





$q=mysqli_query($con,$s);
if($q){
http_response_code(200);
}
else{
http_response_code(404);
}
?>