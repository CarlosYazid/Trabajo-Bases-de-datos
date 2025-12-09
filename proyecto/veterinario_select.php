<?php

// Crear conexión con la BD
require('../config/conexion.php');

// Query SQL a la BD
$query = "SELECT cedula_ciudadania, nombre
            FROM usuario
            WHERE tipo = 'veterinario'";

// Ejecutar la consulta
$resultadoVeterinario = mysqli_query($conn, $query) or die(mysqli_error($conn));

mysqli_close($conn);