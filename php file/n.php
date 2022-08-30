<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "MyDB";
// Create connection
$con = mysqli_connect($servername, $username, $password, $dbname);

if(isset($_POST['submit'])){
  
    $filename=$_FILES['image']['name'];
    $filetmpname=$_FILES['image']['tmp_name'];
    $folder='IU/';
    move_uploaded_file($filetmpname,$folder.$filename);
   

$sql="INSERT INTO `doctor`(`img`) VALUES('$filename') ";
$qr=mysqli_query($con,$sql);
if($qr){
    echo "imgae Uploaded";
}
else{
    echo "image is not uploaded";
}}
?>
<html>
    <head>
        <title>
            Image Upload
</title>
</head>
    <body>
        <center>
        <form action="" method="POST" enctype="multipart/form-data">
            <input type="file" name="image" value="upload"><br>
            
            <input type="submit" name="submit">

        </form>
</center>
</body>
</html>