<?php
 
// Crear conexión con la BD
require('../config/conexion.php');

// Sacar la CP de la entidad
$cedulaEliminar = $_POST["cedulaEliminar"];

// Query SQL a la BD
$query1 = "DELETE FROM `veterinario` WHERE cedula_ciudadania = $cedulaEliminar;";
$query2 = "DELETE FROM `usuario` WHERE cedula_ciudadania = $cedulaEliminar;";

// Ejecutar consulta
$result1 = mysqli_query($conn, $query1) or die(mysqli_error($conn));
$result2 = mysqli_query($conn, $query2) or die(mysqli_error($conn));

if($result1&&$result2): 
    // Si fue exitosa, redirigirse de nuevo a la página de la entidad
    header ("Location: cliente.php");
else:
    echo "Ha ocurrido un error al eliminar este registro";
endif;
 
mysqli_close($conn);