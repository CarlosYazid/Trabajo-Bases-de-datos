<?php
 
// Crear conexión con la BD
require('../config/conexion.php');

// Sacar la CP de la entidad
$nitEliminar = $_POST["codigoEliminar"];

$queryTipo = "SELECT tipo
                FROM mascota
                WHERE codigo = '$nitEliminar'";
$resultTipo = mysqli_query($conn, $queryTipo) or die(mysqli_error($conn));
$filaTipo = mysqli_fetch_assoc($resultTipo);

if($filaTipo['tipo'] == 'Perro'):
    $query2 = "DELETE FROM perro WHERE codigo_mascota = '$nitEliminar'";
else:
    $query2 = "DELETE FROM gato WHERE codigo_mascota = '$nitEliminar'";
endif;

// Query SQL a la BD
$query = "DELETE FROM mascota WHERE codigo = '$nitEliminar'";

// Ejecutar consulta
$result2 = mysqli_query($conn, $query2) or die(mysqli_error($conn));
$result = mysqli_query($conn, $query) or die(mysqli_error($conn));

if($result&&$result2):
    // Si fue exitosa, redirigirse de nuevo a la página de la entidad
    header ("Location: empresa.php");
else:
    echo "Ha ocurrido un error al eliminar este registro";
endif;

mysqli_close($conn);