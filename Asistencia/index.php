<?php
	include_once 'conexion.php';

	$sentencia_select=$con->prepare('SELECT
                                        a.Id_Alumno AS alumno,
                                        a.Nombre AS nombre,
                                        a.FechaNa AS fecha,
                                        g.Nombre AS grado
                                    FROM
                                        alumno AS a
                                    INNER JOIN grado AS g
                                    ON
                                        a.Id_Grado = g.Id_Grado');
	$sentencia_select->execute();
	$resultado=$sentencia_select->fetchAll();

	// metodo buscar
	if(isset($_POST['btn_buscar'])){
		$buscar_text=$_POST['buscar'];
		$select_buscar=$con->prepare('
			SELECT *FROM alumno WHERE nombre LIKE :campo;'
		);

		$select_buscar->execute(array(
			':campo' =>"%".$buscar_text."%"
		));

		$resultado=$select_buscar->fetchAll();

	}

?>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Inicio</title>
	<link rel="stylesheet" href="">
</head>
<style>
*{
    padding: 0;
    margin: 0px;
    box-sizing: border-box;
}

body{
    font-family: 'Arial',sans-serif;
    font-size: 16px;
    background: #DCDCDC;
}

a{
    text-decoration: none;
}
.contenedor{
    width: 80%;
    max-width: 1000px;
    margin: 30px auto;
    overflow: hidden;

}

h2{
    display: block;
    margin-top: 20px;
    margin-bottom: 20px;
    text-align: center;
    font-size: 20px;
    font-family: 'Arial', sans-serif;
    font-weight: bold;
    color: #555;
}

.barra__buscador{
    width: 100%;
    margin-top: 50px;
    margin-bottom: 10px;
}

.formulario{
    display: flex;
    width: 100%;
    overflow: hidden;
}

form .input__text{
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
    color: #848688;
    display: block;
    font-size: 14px;
    margin-bottom: 15px;
    padding: 10px 15px;
    max-width: 30%;
    margin-right: 10px;
    outline: medium none;
}


form .input__text:focus{
    border: 1px solid #1b743c;
}
form .form-group{
    display: flex;
    width: 100%;
    flex-wrap: nowrap;
    justify-content: space-between;
}

form .form-group .input__text{
    max-width: 45% !important;
}


form .btn{
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
    color: #fff;
    display: block;
    font-size: 14px;
    background: rgb(3, 113, 163);
    margin-bottom: 15px;
    padding: 10px 20px;
    margin-right: 10px;
    outline: medium none;
    cursor: pointer;
}
.btn__nuevo{
    float: right;
    background: #9ACD32 !important;
}

.btn__group{
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
}
.btn__primary{
    background: rgb(3, 113, 163);
}
.btn__danger{
    background: #8a0505 !important;
}


/* table */
table{
    width: 100%;
    border-collapse: collapse;
}

table .head{
    background: #FF0000;
}
table .head td{
    color: #fff;
    font-family: 'Arial',sans-serif;
    font-weight: bold;
    font-size: 15px;
    text-align: center;
}

table tr td{
    border:1px solid #ccc;
    padding: 7px;
    font-size: 14px;
    color: #555;
}

.btn__update{
    display: inline-block;
    font-size: 14px;
    background: #FF4500;
    color: #fff;
    border-radius: 5px;
    padding: 5px 10px;
}

.btn__delete{
    display: inline-block;
    font-size: 14px;
    background: #808000;
    color: #fff;
    border-radius: 5px;
    padding: 5px 10px;
}
</style>
<body class="h">
	<div class="contenedor">
		<center><h1>Control de asistencia</h1></center>
		<div class="barra__buscador">
			<form action="" class="formulario" method="post">
				<input type="text" name="buscar" placeholder="Ingrese un nombre o apellido"
				value="<?php if(isset($buscar_text)) echo $buscar_text; ?>" class="input__text">
				<input type="submit" class="btn" name="btn_buscar" value="Buscar">
				<a href="insert.php" class="btn btn__nuevo">Nuevo</a>
			</form>
		</div>
		<table>
			<tr class="head">
				<td>Id</td>
				<td>Nombre</td>
				<td>Fecha Nacimiento</td>
				<td>Grado</td>
				<td colspan="2">Acción</td>
			</tr>
			<?php foreach($resultado as $fila):?>
				<tr >
					<td><?php echo $fila['alumno']; ?></td>
					<td><?php echo $fila['nombre']; ?></td>
					<td><?php echo $fila['fecha']; ?></td>
					<td><?php echo $fila['grado']; ?></td>
					<td><a href="update.php?id=<?php echo $fila['alumno']; ?>"  class="btn__update" >Editar</a></td>
					<td><a href="delete.php?id=<?php echo $fila['alumno']; ?>" class="btn__delete">Eliminar</a></td>
				</tr>
			<?php endforeach ?>

		</table>
	</div>
</body>
</html>
