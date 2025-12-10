<?php
 
// Crear conexión con la BD
require('../config/conexion.php');

// Sacar los datos del formulario. Cada input se identifica con su "name"
print_r($_POST);
$codigo = $_POST["codigo"];
$nombre = $_POST["nombre"];
$tipo = $_POST["tipo"];
$edad = $_POST["edad"];
$sexo = $_POST["sexo"];
$descripcion = $_POST["descripcion"];
$veterinario = $_POST["veterinario"];
//$refugio = $_POST["refugio"];
//$acogedor = $_POST["acogedor"];
//$hijode = $_POST["hijode"];

if($tipo == "Perro"):
	$cantidad_comida = $_POST["cantComida"];
	$query2 = "INSERT INTO `perro` VALUES($codigo, $cantidad_comida);";
else:
	$fertilidad = $_POST["fertilidad"];
	$query2 = "INSERT INTO `gato` VALUES($codigo, $fertilidad);";
endif;

$query = "INSERT INTO `mascota`(`codigo`,`nombre`, `tipo`, `edad`, `sexo`, `descripcion`, `hijo_de`, `refugio`, `acogedor`, `veterinario`) VALUES ('$codigo', '$nombre', '$tipo', '$edad', '$sexo', '$descripcion', NULL, NULL, NULL, '$veterinario')";

// Ejecutar consulta
$result = mysqli_query($conn, $query) or die(mysqli_error($conn));
$result2 = mysqli_query($conn, $query2) or die(mysqli_error($conn));

// Redirigir al usuario a la misma pagina
if($result&&$result2):
	// Si fue exitosa, redirigirse de nuevo a la página de la entidad
	header("Location: empresa.php");
else:
	echo "Ha ocurrido un error al crear la persona";
endif;


mysqli_close($conn);