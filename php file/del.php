<?php
require_once('db.php');
$id=(int)$_POST['D_id'];

$s=" DELETE FROM doctor WHERE D_id=$id";

$q=mysqli_query($con,$s);
if($q){
http_response_code(200);
}
else{
http_response_code(404);
}
?>