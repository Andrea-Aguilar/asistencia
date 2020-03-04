<?php
	include_once 'conexion.php';

	if(isset($_GET['alumno'])){
		$id=(int) $_GET['alumno'];

		$buscar_id=$con->prepare('SELECT * FROM alumno WHERE Id_Alumno=:id ');
		$buscar_id->execute(array(
			':id'=>$id
		));
		$resultado=$buscar_id->fetch();
	}else{
		header('Location: index.php');
	}


	if(isset($_POST['guardar'])){
		$nombre=$_POST['Nombre'];
		$fecha=$_POST['FechaNa'];
		$grado=$_POST['Id_Grado'];

		if(!empty($Nombre) && !empty($FechaNa) && !empty($Id_Grado) && !empty($Id_Alumno)){
		
				$consulta_update=$con->prepare(' UPDATE alumno SET  
					Nombre=:nombre,
					FechaNa=:fecha,
					Id_Grado=:grado,
					WHERE Id_Alumno=:id;'
				);
				$consulta_update->execute(array(
					':nombre' =>$nombre,
					':fecha' =>$fecha,
					':grado' =>$grado,
					':ciudad' =>$ciudad,
					':correo' =>$correo,
					':id' =>$id
				));
				header('Location: index.php');
		}else{
			echo "<script> alert('Los campos estan vacios');</script>";
		}
	}

?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Editar Cliente</title>
	<link rel="stylesheet" href="estilo.css">
</head>
<body>
	<div class="contenedor">
		<h2>Asistencia</h2>
		<form action="" method="post">
			<div class="form-group">
				<input type="text" name="nombre" value="<?php if($resultado) echo $resultado['nombre']; ?>" class="input__text">
				<input type="date" name="fecha" value="<?php if($resultado) echo $resultado['fecha']; ?>" class="input__text">
			</div>
			<div class="form-group">
				<input type="text" name="grado" value="<?php if($resultado) echo $resultado['grado']; ?>" class="input__text">
			</div>
		</form>
	</div>
</body>
</html>