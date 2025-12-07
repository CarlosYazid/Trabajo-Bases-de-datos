<?php
 
// Crear conexión con la BD
require('../config/conexion.php');

// Sacar la CP de la entidad
$codigoEliminar = $_POST["codigoEliminar"];
$fechaEliminar = $_POST["fecha_realEliminar"]

// Query SQL a la BD
$query = "DELETE FROM inyeccion_antiparasitaria WHERE codigo = '$codigoEliminar' AND fecha_real = '$fechaEliminar'";

// Ejecutar consulta
$result = mysqli_query($conn, $query) or die(mysqli_error($conn));

if($result): 
    // Si fue exitosa, redirigirse de nuevo a la página de la entidad
    header ("Location: proyecto.php");
else:
    echo "Ha ocurrido un error al eliminar este registro";
endif;
 
mysqli_close($conn);