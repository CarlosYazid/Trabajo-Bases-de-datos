<?php
include "../includes/header.php";
?>

<!-- TÍTULO. Cambiarlo, pero dejar especificada la analogía -->
<h1 class="mt-3 fw-bold">Búsqueda 2 (Busqueda de veterinarios por cédula)</h1>

<p class="mt-3 fw-bold">Caso general:</p>
    Dos números enteros n1 y n2, n1 ≥ 0, n2 > n1. Se debe mostrar el nit y el 
    nombre de todas las empresas que han revisado entre n1 y n2 proyectos
    (intervalo cerrado [n1, n2]).
<p class="mt-3">
    
</p>

<p class="mt-3 fw-bold">Caso particular:</p>
<p class="mt-3">
Busqueda por la cédula de un veterinario. Se debe mostrar todos los datos de este veterinario
junto con todos los datos de los gatos que este veterinario cuida pero solo de aquellos
gatos que no son fertiles.
</p>

<!-- FORMULARIO. Cambiar los campos de acuerdo a su trabajo -->
<div class="formulario p-4 m-3 border rounded-3">

    <!-- En esta caso, el Action va a esta mismo archivo -->
    <form action="busqueda2.php" method="post" class="form-group">

        <div class="mb-3">
            <label for="cedula" class="form-label">Cédula</label>
            <input type="number" class="form-control" id="cedula" name="cedula" required>
        </div>

        <button type="submit" class="btn btn-primary">Buscar</button>

    </form>
    
</div>

<?php
// Dado que el action apunta a este mismo archivo, hay que hacer eata verificación antes
if ($_SERVER['REQUEST_METHOD'] === 'POST'):

    // Crear conexión con la BD
    require('../config/conexion.php');

    $cedula = $_POST["cedula"];

    // Query SQL a la BD -> Crearla acá (No está completada, cambiarla a su contexto y a su analogía)
    $query = "SELECT V.cedula_ciudadania as cedula, 
            U.nombre as nombre_veterinario, U.apellido, U.telefono, U.correo,
            M.codigo as codigo_mascota, M.nombre as nombre_mascota, M.tipo, M.edad as edad_mascota, M.sexo as sexo_mascota, M.descripcion, M.hijo_de, M.refugio, M.acogedor,
            G.fertilidad
            FROM Veterinario V
            JOIN Usuario U ON V.cedula_ciudadania = U.cedula_ciudadania
            JOIN Mascota M ON V.cedula_ciudadania = M.veterinario
            JOIN Gato G ON G.codigo_mascota = M.codigo
            WHERE G.fertilidad = 0 and V.cedula_ciudadania = $cedula";

    // Ejecutar la consulta
    $resultadoB2 = mysqli_query($conn, $query) or die(mysqli_error($conn));

    mysqli_close($conn);

    // Verificar si llegan datos
    if($resultadoB2 and $resultadoB2->num_rows > 0):
?>

<!-- MOSTRAR LA TABLA. Cambiar las cabeceras -->
<div class="tabla mt-5 mx-3 rounded-3 overflow-hidden">

    <table class="table table-striped table-bordered">

        <!-- Títulos de la tabla, cambiarlos -->
        <thead class="table-dark">
            <tr>
                <th scope="col" class="text-center">Cédula</th>
                <th scope="col" class="text-center">Nombre Veterinario</th>
                <th scope="col" class="text-center">Apellido</th>
                <th scope="col" class="text-center">Telefono</th>
                <th scope="col" class="text-center">Correo</th>
                <th scope="col" class="text-center">Codigo Mascota</th>
                <th scope="col" class="text-center">Nombre Mascota</th>
                <th scope="col" class="text-center">Tipo</th>
                <th scope="col" class="text-center">Edad Mascota</th>
                <th scope="col" class="text-center">Sexo Mascota</th>
                <th scope="col" class="text-center">Descripción</th>
                <th scope="col" class="text-center">Hijo de la Mascota</th>
                <th scope="col" class="text-center">Refugio</th>
                <th scope="col" class="text-center">Acogedor</th>
                <th scope="col" class="text-center">Fertilidad</th>
            </tr>
        </thead>

        <tbody>

            <?php
            // Iterar sobre los registros que llegaron
            foreach ($resultadoB2 as $fila):
            ?>

            <!-- Fila que se generará -->
            <tr>
                <!-- Cada una de las columnas, con su valor correspondiente -->
                <td class="text-center"><?= $fila["cedula"]; ?></td>
                <td class="text-center"><?= $fila["nombre_veterinario"]; ?></td>
                <td class="text-center"><?= $fila["apellido"]; ?></td>
                <td class="text-center"><?= $fila["telefono"]; ?></td>
                <td class="text-center"><?= $fila["correo"]; ?></td>
                <td class="text-center"><?= $fila["codigo_mascota"]; ?></td>
                <td class="text-center"><?= $fila["nombre_mascota"]; ?></td>
                <td class="text-center"><?= $fila["tipo"]; ?></td>
                <td class="text-center"><?= $fila["edad_mascota"]; ?></td>
                <td class="text-center"><?= $fila["sexo_mascota"]; ?></td>
                <td class="text-center"><?= $fila["descripcion"]; ?></td>
                <td class="text-center"><?= $fila["hijo_de"]; ?></td>
                <td class="text-center"><?= $fila["refugio"]; ?></td>
                <td class="text-center"><?= $fila["acogedor"]; ?></td>
                <td class="text-center"><?= $fila["fertilidad"]; ?></td>
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
