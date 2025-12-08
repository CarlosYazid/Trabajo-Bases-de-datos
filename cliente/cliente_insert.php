<?php
 
// Crear conexión con la BD
require('../config/conexion.php');

// Sacar los datos del formulario. Cada input se identifica con su "name"
$cedula = $_POST["cedula"];
$nombre = $_POST["nombre"];
$apellido = $_POST["apellido"];
$telefono = $_POST["telefono"];
$correo = $_POST["correo"];
$especialidad = $_POST["especialidad"];

// Verificar si la cédula ya existe en la tabla usuario
$query0 = "SELECT cedula_ciudadania, tipo
			FROM usuario
			WHERE cedula_ciudadania = $cedula;";
$result0 = mysqli_query($conn, $query0) or die(mysqli_error($conn));

if($result0->num_rows > 0):
	$fila = mysqli_fetch_array($result0);
	if(strtolower($fila['tipo']) != 'veterinario'):
		mysqli_close($conn);
		exit("LA CÉDULA YA ESTÁ REGISTRADA CON OTRO TIPO DE USUARIO");
	else:
		$query2 = "INSERT INTO `veterinario`(`cedula_ciudadania`,`especializacion`) VALUES ($cedula, '$especialidad');";
		$result2 = mysqli_query($conn, $query2) or die(mysqli_error($conn));

		if($result2):
			// Si fue exitosa, redirigirse de nuevo a la página de la entidad
			header("Location: cliente.php");
			mysqli_close($conn);
			exit;
		else:
			echo "Ha ocurrido un error al crear la persona";
			mysqli_close($conn);
			exit;
		endif;

	endif;
endif;

// Query SQL a la BD. Si tienen que hacer comprobaciones, hacerlas acá (Generar una query diferente para casos especiales)
$query1 = "INSERT INTO `usuario`(`cedula_ciudadania`,`nombre`, `apellido`, `telefono`, `correo`, `tipo`) VALUES ($cedula, '$nombre', '$apellido', $telefono, '$correo', 'veterinario');";
$query2 = "INSERT INTO `veterinario`(`cedula_ciudadania`,`especializacion`) VALUES ($cedula, '$especialidad');";

// Ejecutar consulta
$result1 = mysqli_query($conn, $query1) or die(mysqli_error($conn));
$result2 = mysqli_query($conn, $query2) or die(mysqli_error($conn));

// Redirigir al usuario a la misma pagina
if($result1&&$result2):
    // Si fue exitosa, redirigirse de nuevo a la página de la entidad
	header("Location: cliente.php");
	mysqli_close($conn);
	exit;
else:
	echo "Ha ocurrido un error al crear la persona";
	mysqli_close($conn);
endif;