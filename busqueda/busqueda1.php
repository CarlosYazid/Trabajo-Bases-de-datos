<?php
include "../includes/header.php";
?>

<!-- TÍTULO. Cambiarlo, pero dejar especificada la analogía -->
<h1 class="mt-3 fw-bold">Búsqueda 1 (Busqueda de Inyecciones Antiparasitarias)</h1>

<p class="mt-3 fw-bold">Caso general:</p>
<p class="mt-3">
    Dos fechas f1 y f2 (cada fecha con día, mes y año), f2 ≥ f1 y un número entero n,
    n ≥ 0. Se debe mostrar la cédula y el celular de todos los clientes que han 
    revisado exactamente n proyectos en dicho rango de fechas [f1, f2].
</p>

<p class="mt-3 fw-bold">Caso particular:</p>
<p class="mt-3">
    Dos fechas f1 y f2, f2 &gt; f1 (cada una en formato año-mes-día). Se debe
    mostrar todas las inyección antiparasitaria cuya fecha real esté comprendida entre f1 (inclusive)
    y f2 (inclusive), cada una de estas inyección antiparasitaria debe estar acompañada de todos los
    datos del ejecutor (empleado) y de todos los datos del perro correspondiente.
</p>

<!-- FORMULARIO. Cambiar los campos de acuerdo a su trabajo -->
<div class="formulario p-4 m-3 border rounded-3">

    <!-- En esta caso, el Action va a esta mismo archivo -->
    <form action="busqueda1.php" method="post" class="form-group">

        <div class="mb-3">
            <label for="fecha1" class="form-label">Fecha 1</label>
            <input type="date" class="form-control" id="fecha1" name="fecha1" required>
        </div>

        <div class="mb-3">
            <label for="fecha2" class="form-label">Fecha 2</label>
            <input type="date" class="form-control" id="fecha2" name="fecha2" required>
        </div>

        <button type="submit" class="btn btn-primary">Buscar</button>

    </form>
    
</div>

<?php
// Dado que el action apunta a este mismo archivo, hay que hacer eata verificación antes
if ($_SERVER['REQUEST_METHOD'] === 'POST'):

    // Crear conexión con la BD
    require('../config/conexion.php');

    $fecha1 = $_POST["fecha1"];
    $fecha2 = $_POST["fecha2"];

    // Query SQL a la BD -> Crearla acá (No está completada, cambiarla a su contexto y a su analogía)
    $query = "SELECT IA.fecha_real, IA.fecha_estimada, IA.resultado, IA.veterinario as cedula, 
            U.nombre, U.apellido, U.telefono, U.correo, V.especializacion,
            IA.codigo_mascota, M.nombre, M.edad, M.Sexo, M.descripcion, M.hijo_de, M.refugio, P.cantidad_comida
            FROM Inyeccion_Antiparasitaria IA
            JOIN Usuario U ON IA.veterinario = U.cedula_ciudadania
            JOIN Veterinario V ON IA.veterinario = V.cedula_ciudadania
            JOIN Mascota M ON IA.codigo_mascota = M.codigo
            JOIN Perro P ON IA.codigo_mascota = P.codigo_mascota
            WHERE IA.fecha_real BETWEEN '$fecha1' AND '$fecha2'";

    // Ejecutar la consulta
    $resultadoB1 = mysqli_query($conn, $query) or die(mysqli_error($conn));

    mysqli_close($conn);

    // Verificar si llegan datos
    if($resultadoB1 and $resultadoB1->num_rows > 0):
?>

<!-- MOSTRAR LA TABLA. Cambiar las cabeceras -->
<div class="tabla mt-5 mx-3 rounded-3 overflow-hidden">

    <table class="table table-striped table-bordered">

        <!-- Títulos de la tabla, cambiarlos -->
        <thead class="table-dark">
            <tr>
                <th scope="col" class="text-center">Fecha real</th>
                <th scope="col" class="text-center">Fecha Estimada</th>
                <th scope="col" class="text-center">Resultado</th>
                
                <th scope="col" class="text-center">Veterinario</th>
                <th scope="col" class="text-center">Nombre Veterinario</th>
                <th scope="col" class="text-center">Apellido Veterinario</th>
                <th scope="col" class="text-center">Teléfono Veterinario</th>
                <th scope="col" class="text-center">Correo Veterinario</th>
                <th scope="col" class="text-center">Especialización Veterinario</th>

                <th scope="col" class="text-center">Código Mascota</th>
                <th scope="col" class="text-center">Nombre Mascota</th>
                <th scope="col" class="text-center">Edad Mascota</th>
                <th scope="col" class="text-center">Sexo Mascota</th>
                <th scope="col" class="text-center">Descripción Mascota</th>
                <th scope="col" class="text-center">Hijo de Mascota</th>
                <th scope="col" class="text-center">Refugio Mascota</th>
                <th scope="col" class="text-center">Cantidad Comida</th>
        
            </tr>
        </thead>

        <tbody>

            <?php
            // Iterar sobre los registros que llegaron
            foreach ($resultadoB1 as $fila):
            ?>

            <!-- Fila que se generará -->
            <tr>
                <!-- Cada una de las columnas, con su valor correspondiente -->
                <td class="text-center"><?= $fila["fecha_real"]; ?></td>
                <td class="text-center"><?= $fila["fecha_estimada"]; ?></td>
                <td class="text-center"><?= $fila["resultado"]; ?></td>

                <td class="text-center"><?= $fila["cedula"]; ?></td>
                <td class="text-center"><?= $fila["nombre"]; ?></td>
                <td class="text-center"><?= $fila["apellido"]; ?></td>
                <td class="text-center"><?= $fila["telefono"]; ?></td>
                <td class="text-center"><?= $fila["correo"]; ?></td>
                <td class="text-center"><?= $fila["especializacion"]; ?></td>
                
                <td class="text-center"><?= $fila["codigo_mascota"]; ?></td>
                <td class="text-center"><?= $fila["nombre"]; ?></td>
                <td class="text-center"><?= $fila["edad"]; ?></td>
                <td class="text-center"><?= $fila["Sexo"]; ?></td>
                <td class="text-center"><?= $fila["descripcion"]; ?></td>
                <td class="text-center"><?= $fila["hijo_de"]; ?></td>
                <td class="text-center"><?= $fila["refugio"]; ?></td>
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
    No se encontraron resultados para esta consulta
</div>

<?php
    endif;
endif;

include "../includes/footer.php";
?>
