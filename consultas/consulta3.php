<?php
include "../includes/header.php";
?>

<!-- TÍTULO. Cambiarlo, pero dejar especificada la analogía -->
<h1 class="mt-3 fw-bold">Consulta 3</h1>

<p class="mt-3 fw-bold">Caso general:</p>
<p class="mt-3">
    El tercer botón debe mostrar todos los datos del cerdo de mayor valor que
    está listo para la venta junto con los datos de su cuidador (empleado; en caso de
    empates, usted decide como proceder).
</p>

<p class="mt-3 fw-bold">Caso particular:</p>
<p class="mt-3">
    Mostrar todos los datos del gato de mayor edad que aun conserva su fertilidad,
    junto con los datos del veterinario responsable de sus revisiones médicas; en caso 
    de que haya más de uno, se verá en pantalla el gato que tenga el nombre mayor alfabéticamente.
</p>

<?php
// Crear conexión con la BD
require('../config/conexion.php');

// Query SQL a la BD -> Crearla acá (No está completada, cambiarla a su contexto y a su analogía)
$query = "SELECT G.codigo_mascota, M.nombre, M.veterinario
            FROM gato G, mascota M
            WHERE G.codigo_mascota = M.codigo 
                    AND G.fertilidad = TRUE 
                        AND M.edad = ( SELECT MAX(edad)
									    FROM ( SELECT M.edad
										        FROM gato G, mascota M
										        WHERE G.codigo_mascota = M.codigo AND G.fertilidad = TRUE ) AS edadesFertiles
									)";

// Ejecutar la consulta
$resultadoC1 = mysqli_query($conn, $query) or die(mysqli_error($conn));

$nomMayor = null;
if($resultadoC1&& $resultadoC1->num_rows > 1):

    while ($fila = mysqli_fetch_assoc($resultadoC1)) {
        if ($nomMayor === null || $fila["nombre"] > $nomMayor) {
            $nomMayor = $fila["nombre"];
            $vetMayor = $fila["veterinario"];
            $codMayor = $fila["codigo_mascota"];
        }
    }

elseif($resultadoC1 && $resultadoC1->num_rows == 1):
    $fila = mysqli_fetch_assoc($resultadoC1);
    $nomMayor = $fila['nombre'];
    $vetMayor = $fila['veterinario'];
    $codMayor = $fila['codigo_mascota'];

endif;

if($nomMayor != null):
    $queryFinal = "SELECT M.codigo, M.nombre AS nombreMas, M.tipo, M.edad, M.sexo, M.descripcion, V.cedula_ciudadania, U.nombre AS nombreVet, U.telefono, V.especializacion
                    FROM mascota M, veterinario V, usuario U
                    WHERE M.veterinario = V.cedula_ciudadania AND V.cedula_ciudadania = U.cedula_ciudadania 
                            AND M.codigo = '$codMayor'
                                AND V.cedula_ciudadania = '$vetMayor'";
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
                <th scope="col" class="text-center">Codigo<br>Mascota</th>
                <th scope="col" class="text-center">Nombre<br>Mascota</th>
                <th scope="col" class="text-center">Tipo</th>
                <th scope="col" class="text-center">Edad</th>
                <th scope="col" class="text-center">Sexo</th>
                <th scope="col" class="text-center">Descripción</th>
                <th scope="col" class="text-center">C.C. Veterinario<br>Responsable</th>
                <th scope="col" class="text-center">Nombre<br>Veterinario</th>
                <th scope="col" class="text-center">Telefono</th>
                <th scope="col" class="text-center">Especialización</th>
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
                <td class="text-center"><?= $fila["nombreMas"]; ?></td>
                <td class="text-center"><?= $fila["tipo"]; ?></td>
                <td class="text-center"><?= $fila["edad"]; ?></td>
                <td class="text-center"><?= $fila["sexo"]; ?></td>
                <td class="text-center"><?= $fila["descripcion"]; ?></td>
                <td class="text-center"><?= $fila["cedula_ciudadania"]; ?></td>
                <td class="text-center"><?= $fila["nombreVet"]; ?></td>
                <td class="text-center"><?= $fila["telefono"]; ?></td>
                <td class="text-center"><?= $fila["especializacion"]; ?></td>
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
    NO HAY REGISTRO DE GATOS QUE AUN CONSERVEN SU FERTILIDAD
</div>

<?php
endif;

include "../includes/footer.php";
?>