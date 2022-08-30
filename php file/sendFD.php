<?php
require('db.php');



$s="INSERT INTO followup (P_id,D_id,P_case) 
VALUES('".$_POST['P_id']."','".$_POST['D_id']."','".$_POST['P_case']."')";

$q=mysqli_query($con,$s);



?>