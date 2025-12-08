<?php
 
// Crear conexión con la BD
require('../config/conexion.php');

// Sacar los datos del formulario. Cada input se identifica con su "name"
$fechareal = $_POST["fechareal"];
$fechaestimada = $_POST["fechaestimada"];
$resultado = $_POST["resultado"];
$mascota = $_POST["mascota"];
$veterinario2 = $_POST["veterinario"];

if($fechaestimada >= $fechareal):
	// Query SQL a la BD. Si tienen que hacer comprobaciones, hacerlas acá (Generar una query diferente para casos especiales)
	$query = "INSERT INTO `inyeccion_antiparasitaria`(`fecha_estimada`,`fecha_real`, `resultado`, `codigo_mascota`, `veterinario`) VALUES ('$fechaestimada', '$fechareal', '$resultado', '$mascota', '$veterinario2')";

	// Ejecutar consulta
	$result = mysqli_query($conn, $query) or die(mysqli_error($conn));

	// Redirigir al usuario a la misma pagina
	if($result):
    	// Si fue exitosa, redirigirse de nuevo a la página de la entidad
		header("Location: proyecto.php");
	else:
		echo "Ha ocurrido un error al crear el registro";
	endif;
else:
	echo "LA FECHA ESTIMADA NO PUEDE SER MENOR A LA FECHA REAL";
endif;

mysqli_close($conn);