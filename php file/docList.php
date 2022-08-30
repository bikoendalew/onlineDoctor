<?php
require('db.php');

$s="SELECT * FROM doctor";
$q=mysqli_query($con,$s);

while($row=mysqli_fetch_assoc($q)){
$w[]=$row;

}

echo json_encode($w);
?>
