<?php
require('db.php');

$id=$_POST['app_id'];

$s="UPDATE app SET permission ='".$_POST['permission']."' WHERE app_id=$id";


$q=mysqli_query($con,$s);



?>