<?php 
	include_once 'conexion.php';
	
	if(isset($_POST['guardar'])){
		$nombre=$_POST['nombre'];
		$apellidos=$_POST['fecha'];
		$telefono=$_POST['grado'];

		if(!empty($nombre) && !empty($fecha) && !empty($grado)){
			if(!filter_var($correo,FILTER_VALIDATE_EMAIL)){
				echo "<script> alert('Correo no valido');</script>";
			}else{
				$consulta_insert=$con->prepare('INSERT INTO clientes(nombre,apellidos,telefono,ciudad,correo) VALUES(:nombre,:apellidos,:telefono,:ciudad,:correo)');
				$consulta_insert->execute(array(
					':nombre' =>$nombre,
					':fecha' =>$fecha,
					':grado' =>$grado
				));
				header('Location: index.php');
			}
		}else{
			echo "<script> alert('Los campos estan vacios');</script>";
		}

	}


?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Nuevo Cliente</title>
	<link rel="stylesheet" href="estilo.css">
</head>
<body>
	<div class="contenedor">
		<h2>CRUD EN PHP CON MYSQL</h2>
		<form action="" method="post">
			<div class="form-group">
				<input type="text" name="nombre" placeholder="Nombre" class="input__text">
				<input type="date" name="apellidos" placeholder="Fecha Nacimiento" class="input__text">
			</div>
			<div class="form-group">
				<input type="text" name="telefono" placeholder="Grado" class="input__text">
			</div>
			
		</form>
	</div>
</body>
</html>