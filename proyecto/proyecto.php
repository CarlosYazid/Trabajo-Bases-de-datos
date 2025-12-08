<?php
include "../includes/header.php";
?>

<!-- TÍTULO. Cambiarlo, pero dejar especificada la analogía -->
<h1 class="mt-3 fw-bold">Entidad análoga a PROYECTO (INYECCIÓN ANTIPARASITARIA)</h1>

<!-- FORMULARIO. Cambiar los campos de acuerdo a su trabajo -->
<div class="formulario p-4 m-3 border rounded-3">

    <form action="proyecto_insert.php" method="post" class="form-group">

        <div class="mb-3">
            <label for="fechareal" class="form-label">Fecha real</label>
            <input type="date" class="form-control" id="fechareal" name="fechareal" required>
        </div>

        <div class="mb-3">
            <label for="fechaestimada" class="form-label">Fecha estimada</label>
            <input type="date" class="form-control" id="fechaestimada" name="fechaestimada" required>
        </div>

        <div class="mb-3">
            <label for="resultado" class="form-label">Resultado</label>
            <input type="text" class="form-control" id="resultado" name="resultado" required>
        </div>
        
        <!-- Consultar la lista de clientes y desplegarlos -->
        <div class="mb-3">
            <label for="mascota" class="form-label">Mascota</label>
            <select name="mascota" id="mascota" class="form-select">
                
                <!-- Option por defecto -->
                <option value="" selected disabled hidden></option>

                <?php
                // Importar el código del otro archivo
                require("perro_select.php");
                
                // Verificar si llegan datos
                if($resultadoMascota):
                    
                    // Iterar sobre los registros que llegaron
                    foreach ($resultadoMascota as $fila):
                ?>

                <!-- Opción que se genera -->
                <option value="<?= $fila["codigo"]; ?>"><?= $fila["nombre"]; ?> - Código: <?= $fila["codigo"]; ?></option>

                <?php
                        // Cerrar los estructuras de control
                    endforeach;
                endif;
                ?>
            </select>
        </div>

        <div class="mb-3">
            <label for="veterinario" class="form-label">Veterinario</label>
            <select name="veterinario" id="veterinario" class="form-select">
                
                <!-- Option por defecto -->
                <option value="" selected disabled hidden></option>

                <?php
                // Importar el código del otro archivo
                require("veterinario_select.php");
                
                // Verificar si llegan datos
                if($resultadoVeterinario):
                    
                    // Iterar sobre los registros que llegaron
                    foreach ($resultadoVeterinario as $fila):
                ?>

                <!-- Opción que se genera -->
                <option value="<?= $fila["cedula_ciudadania"]; ?>"><?= $fila["nombre"]; ?> - C.C. <?= $fila["cedula_ciudadania"]; ?></option>

                <?php
                        // Cerrar los estructuras de control
                    endforeach;
                endif;
                ?>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Agregar</button>

    </form>
    
</div>

<?php
// Importar el código del otro archivo
require("proyecto_select.php");
            
// Verificar si llegan datos
if($resultadoProyecto and $resultadoProyecto->num_rows > 0):
?>

<!-- MOSTRAR LA TABLA. Cambiar las cabeceras -->
<div class="tabla mt-5 mx-3 rounded-3 overflow-hidden">

    <table class="table table-striped table-bordered">

        <!-- Títulos de la tabla, cambiarlos -->
        <thead class="table-dark">
            <tr>
                <th scope="col" class="text-center">Mascota</th>
                <th scope="col" class="text-center">Veterinario</th>
                <th scope="col" class="text-center">Fecha real</th>
                <th scope="col" class="text-center">Fecha estimada</th>
                <th scope="col" class="text-center">Resultado</th>
            </tr>
        </thead>

        <tbody>

            <?php
            // Iterar sobre los registros que llegaron
            foreach ($resultadoProyecto as $fila):
            ?>

            <!-- Fila que se generará -->
            <tr>
                <!-- Cada una de las columnas, con su valor correspondiente -->
                <td class="text-center">C.C. <?= $fila["codigo_mascota"]; ?></td>
                <td class="text-center">NIT: <?= $fila["veterinario"]; ?></td>
                <td class="text-center"><?= $fila["fecha_real"]; ?></td>
                <td class="text-center"><?= $fila["fecha_estimada"]; ?></td>
                <td class="text-center"><?= $fila["resultado"]; ?></td>
                
                <!-- Botón de eliminar. Debe de incluir la CP de la entidad para identificarla -->
                <td class="text-center">
                    <form action="proyecto_delete.php" method="post">
                        <input hidden type="text" name="codigoEliminar" value="<?= $fila["codigo_mascota"]; ?>">
                        <input hidden type="text" name="fecha_realEliminar" value="<?= $fila["fecha_real"]; ?>">
                        <button type="submit" class="btn btn-danger">Eliminar</button>
                    </form>
                </td>

            </tr>

            <?php
            // Cerrar los estructuras de control
            endforeach;
            ?>

        </tbody>

    </table>
</div>

<?php
endif;

include "../includes/footer.php";
?>