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

// Query SQL a la BD. Si tienen que hacer comprobaciones, hacerlas acá (Generar una query diferente para casos especiales)
$query1 = "INSERT INTO `usuario`(`cedula_ciudadania`,`nombre`, `apellido`, `telefono`, `correo`, `tipo`) VALUES ($cedula, '$nombre', '$apellido', $telefono, '$correo', 'Veterinario');";
$query2 = "INSERT INTO `veterinario`(`cedula_ciudadania`,`especializacion`,`tipo`) VALUES ($cedula, '$especialidad', 'Veterinario');";

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