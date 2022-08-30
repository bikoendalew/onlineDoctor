<?php
require_once('db.php');
$query="select * from admin where email='".$_POST['email']."' and password='".$_POST['password']."'";
$result=mysqli_query($con,$query);
$count=mysqli_num_rows($result);
if($count>=1){
$list[]=mysqli_fetch_assoc($result);
echo json_encode($list);

http_response_code(200);
}
else {
    http_response_code(404);
}

?>