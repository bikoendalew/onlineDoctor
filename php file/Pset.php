<?php
require_once('db.php');

$di=$_POST['D_id'];
$dn=$_POST['Fname'];
$pi=$_POST['P_id'];
$pn=$_POST['pn'];

$date=$_POST['date'];


$s="INSERT INTO app (P_id,D_id,pn,dn,date)
VALUES('".$pi."','".$di."','".$pn."','".$dn."','".$date."')
";
$q=mysqli_query($con,$s);
if($q){
http_response_code(200);
}
else{
http_response_code(404);
}
?>