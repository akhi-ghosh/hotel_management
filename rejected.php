<?php

require_once 'database.php';



    if ($_GET['id']) {
        # code...
    $id = $_GET['id'];
    //$roomNo = $_POST['roomNo'];
    //$type = $_POST['type'];
    //$phone = $_POST['telephone'];
    //$rate = $_POST['rate'];
    $statas=1;
      $html=' <p> '.$id.' </p>' ;
      echo $id;
    $query = "UPDATE room  SET room.isReserved='Rejected'  WHERE roomId = '$id' ";
    db_insert($query);
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
   
    $_SESSION['msg']="Room  is successfully updated";
     }

    header('Location: reservation-manage.php');
}
?>