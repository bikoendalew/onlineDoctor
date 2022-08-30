<?php
require('db.php');

//$id=intval($_POST['D_id']);

$s="SELECT * FROM app WHERE P_id = 1";
$q=mysqli_query($con,$s);
$count=mysqli_num_rows($q);
if($count>0){
http_response_code(200);
$w[]=mysqli_fetch_assoc($q);
echo json_encode($w);
}
else{
http_response_code(404);
}

?>
