<?php
include "../includes/header.php";
?>

<!-- TÍTULO. Cambiarlo, pero dejar especificada la analogía -->
<h1 class="mt-3 fw-bold">Consulta 1</h1>

<p class="mt-3 fw-bold">Caso general:</p>
<p class="mt-3">
    Mostrar todos los datos del empleado(a) que más inseminaciones ha hecho a
    vacas que él/ella no cuida (en caso de empates, usted decide como proceder).
</p>

<p class="mt-3 fw-bold">Caso particular:</p>
<p class="mt-3">
    Mostrar todos los datos del veterinario/a que mas inyecciones antiparasitarias
    ha realizado a perros que no fueron asignados a él/ella para revisiones médicas
    periódicas.
</p>

<?php
// Crear conexión con la BD
require('../config/conexion.php');

// Query SQL a la BD -> Crearla acá (No está completada, cambiarla a su contexto y a su analogía)
$query = "SELECT I.veterinario, COUNT(*) AS InyecVal
            FROM inyeccion_antiparasitaria I JOIN mascota M ON I.codigo_mascota = M.codigo
            WHERE I.veterinario <> M.veterinario
            GROUP BY I.veterinario
            HAVING COUNT(*) = (     SELECT MAX(InyecVal)
                                    FROM  ( SELECT COUNT(*) AS InyecVal
                                            FROM inyeccion_antiparasitaria I2 JOIN mascota M2 ON I2.codigo_mascota = M2.codigo
                                            WHERE I2.veterinario <> M2.veterinario
                                            GROUP BY I2.veterinario	) AS ConteoVal  
                                )";

// Ejecutar la consulta
$resultadoC1 = mysqli_query($conn, $query) or die(mysqli_error($conn));

$veterinarioMenor = null;
if($resultadoC1&& $resultadoC1->num_rows > 1):
    $vets = [];

    while ($fila = mysqli_fetch_assoc($resultadoC1)) {
        $vets[] = $fila["veterinario"];
    }
    sort($vets);
    $veterinarioMenor = $vets[0];

elseif($resultadoC1 && $resultadoC1->num_rows == 1):
    $fila = mysqli_fetch_assoc($resultadoC1);
    $veterinarioMenor = $fila['veterinario'];

endif;

if($veterinarioMenor != null):
    $queryFinal = "SELECT U.cedula_ciudadania, nombre, apellido, telefono, correo, V.especializacion
                    FROM usuario U, veterinario V
                    WHERE U.cedula_ciudadania = V.cedula_ciudadania AND U.cedula_ciudadania = '$veterinarioMenor'";
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
                <th scope="col" class="text-center">Cédula</th>
                <th scope="col" class="text-center">Nombre</th>
                <th scope="col" class="text-center">Apellido</th>
                <th scope="col" class="text-center">Teléfono</th>
                <th scope="col" class="text-center">Correo</th>
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
                <td class="text-center"><?= $fila["cedula_ciudadania"]; ?></td>
                <td class="text-center"><?= $fila["nombre"]; ?></td>
                <td class="text-center"><?= $fila["apellido"]; ?></td>
                <td class="text-center"><?= $fila["telefono"]; ?></td>
                <td class="text-center"><?= $fila["correo"]; ?></td>
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
    NO HAY REGISTRO DE VETERINARIOS QUE HAYAN REALIZADO INYECCIONES A PERROS QUE NO LE HAN SIDO ASIGNADOS
</div>

<?php
endif;

include "../includes/footer.php";
?>