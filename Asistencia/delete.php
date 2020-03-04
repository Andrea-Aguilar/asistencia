<?php 

	include_once 'conexion.php';
	if(isset($_GET['alumno'])){
		$id=(int) $_GET['alumno'];
		$delete=$con->prepare('DELETE FROM alumno WHERE Id_Alumno=:id');
		$delete->execute(array(
			':id'=>$id
		));
		header('Location: index.php');
	}else{
		header('Location: index.php');
	}
 ?>