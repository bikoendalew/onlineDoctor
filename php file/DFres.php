<?php
require('db.php');

$fi=$_POST['f_id'];

$s="UPDATE followup SET D_ans='".$_POST['D_ans']."' WHERE f_id=$fi";


$q=mysqli_query($con,$s);



?>