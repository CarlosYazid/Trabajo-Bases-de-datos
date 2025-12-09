<?php
include "../includes/header.php";
?>

<!-- TÍTULO. Cambiarlo, pero dejar especificada la analogía -->
<h1 class="mt-3 fw-bold">Consulta 2</h1>

<p class="mt-3 fw-bold">Caso general:</p>
<p class="mt-3">
    El segundo botón debe mostrar todos los datos de la vaca que tiene mayor
    valor en promedio litros día y que nunca ha sido inseminada artificialmente (en
    caso de empates, usted decide como proceder).
</p>

<p class="mt-3 fw-bold">Caso particular:</p>
<p class="mt-3">
    Mostrar todos los datos del perro que consume mayor cantidad de comida diariamente
    y que nunca ha recibido una inyección antiparasitaria; en caso de que haya mas de uno,
    se verá en pantalla el que tenga mayor código asignado en el sistema.
</p>

<?php
// Crear conexión con la BD
require('../config/conexion.php');

// Query SQL a la BD -> Crearla acá (No está completada, cambiarla a su contexto y a su analogía)
$query = "SELECT codigo_mascota
            FROM perro
            WHERE cantidad_comida = (SELECT MAX(cantidad_comida) FROM perro)
			                           AND
	                codigo_mascota NOT IN (SELECT codigo_mascota
                                            FROM inyeccion_antiparasitaria
                                            GROUP BY codigo_mascota)";

// Ejecutar la consulta
$resultadoC1 = mysqli_query($conn, $query) or die(mysqli_error($conn));

$mayorCod = null;
if($resultadoC1&& $resultadoC1->num_rows > 1):
    $vets = [];

    while ($fila = mysqli_fetch_assoc($resultadoC1)) {
        $vets[] = $fila["codigo_mascota"];
    }

    $mayorCod = max($vets);

elseif($resultadoC1 && $resultadoC1->num_rows == 1):
    $fila = mysqli_fetch_assoc($resultadoC1);
    $mayorCod = $fila['codigo_mascota'];

endif;

if($mayorCod != null):
    $queryFinal = "SELECT M.codigo, M.veterinario, nombre, edad, sexo, descripcion, P.cantidad_comida
                    FROM mascota M, perro P
                    WHERE M.codigo = P.codigo_mascota AND P.codigo_mascota = '$mayorCod'";
    $resultadoFinal = mysqli_query($conn, $queryFinal) or die(mysqli_error($conn));
else:
    $resultadoFinal = null;
endif;

mysqli_close($conn);
?>

<?php
// Verificar si llegan datos
if($resultadoFinal and $resultadoFinal->num_rows > 0):
?>

<!-- MOSTRAR LA TABLA. Cambiar las cabeceras -->
<div class="tabla mt-5 mx-3 rounded-3 overflow-hidden">

    <table class="table table-striped table-bordered">

        <!-- Títulos de la tabla, cambiarlos -->
        <thead class="table-dark">
            <tr>
                <th scope="col" class="text-center">Codigo<br>Perro</th>
                <th scope="col" class="text-center">Veterinario<br>Responsable</th>
                <th scope="col" class="text-center">Nombre</th>
                <th scope="col" class="text-center">Edad</th>
                <th scope="col" class="text-center">Sexo</th>
                <th scope="col" class="text-center">Descripcion</th>
                <th scope="col" class="text-center">Cantidad<br>Comida (gr)</th>
            </tr>
        </thead>

        <tbody>

            <?php
            // Iterar sobre los registros que llegaron
            foreach ($resultadoFinal as $fila):
            ?>

            <!-- Fila que se generará -->
            <tr>
                <!-- Cada una de las columnas, con su valor correspondiente -->
                <td class="text-center"><?= $fila["codigo"]; ?></td>
                <td class="text-center"><?= $fila["veterinario"]; ?></td>
                <td class="text-center"><?= $fila["nombre"]; ?></td>
                <td class="text-center"><?= $fila["edad"]; ?></td>
                <td class="text-center"><?= $fila["sexo"]; ?></td>
                <td class="text-center"><?= $fila["descripcion"]; ?></td>
                <td class="text-center"><?= $fila["cantidad_comida"]; ?></td>
            </tr>

            <?php
            // Cerrar los estructuras de control
            endforeach;
            ?>

        </tbody>

    </table>
</div>

<!-- Mensaje de error si no hay resultados -->
<?php
else:
?>

<div class="alert alert-danger text-center mt-5">
    NO HAY REGISTRO DE PERROS NO INYECTADOS Y QUE CONSUMAN LA MAYOR CANTIDAD DE COMIDA DIARIAMENTE
</div>

<?php
endif;

include "../includes/footer.php";
?>