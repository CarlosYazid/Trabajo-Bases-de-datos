<?php
include "../includes/header.php";
?>

<!-- TÍTULO. Cambiarlo, pero dejar especificada la analogía -->
<h1 class="mt-3 fw-bold">Entidad análoga a EMPRESA (MASCOTA)</h1>

<!-- FORMULARIO. Cambiar los campos de acuerdo a su trabajo -->
<div class="formulario p-4 m-3 border rounded-3">

    <form action="empresa_insert.php" method="post" class="form-group">

        <div class="mb-3">
            <label for="codigo" class="form-label">Código</label>
            <input type="number" class="form-control" id="codigo" placeholder="código > 0" name="codigo" required>
        </div>

        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
        </div>

        <div class="mb-3">
            <label for="tipo" class="form-label">Tipo</label>
            <select class="form-select" id="tipo" name="tipo" required>
                <option value="Perro" selected>Perro</option>
                <option value="Gato">Gato</option>
            </select>
        </div>


        <div id="extraCampo">
        <script>
            const tipoSelect = document.getElementById("tipo");
            const extraDiv = document.getElementById("extraCampo");

            function actualizarCampo() {
                extraDiv.innerHTML = "";

                if (tipoSelect.value === "Perro") {
                    extraDiv.innerHTML = `<div class="mb-3">
                                            <label for="cantComida" class="form-label">Cantidad de Comida Diaria (gr)</label>
                                            <input type="number" class="form-control" id="cantComida" name="cantComida" required>
                                            </div>`;
                } else if (tipoSelect.value === "Gato") {
                    extraDiv.innerHTML = `<div class="mb-3">
                                            <label for="fertilidad" class="form-label">Fertilidad</label>
                                            <select class="form-select" id="fertilidad" name="fertilidad" required>
                                                <option value=TRUE selected>TRUE</option>
                                                <option value=FALSE>FALSE</option>
                                            </select>
                                            </div>`;
                }
            }

            // para ejecutar al cambiar de opcion
            tipoSelect.addEventListener("change", actualizarCampo);

            actualizarCampo();
        </script>
        </div>


        <div class="mb-3">
            <label for="edad" class="form-label">Edad</label>
            <input type="number" class="form-control" id="edad" name="edad" min="0" max = "30" required>
        </div>

        <div class="mb-3">
            <label for="sexo" class="form-label">Sexo</label>
            <select class="form-select" id="sexo" name="sexo" required>
                <option value="macho" selected>Macho</option>
                <option value="hembra">Hembra</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="descripcion" class="form-label">Descripción</label>
            <input type="text" class="form-control" id="descripcion" name="descripcion" required>
        </div>
        
        <!-- Consultar la lista de clientes y desplegarlos -->
        <div class="mb-3">
            <label for="veterinario" class="form-label">Veterinario</label>
            <select name="veterinario" id="veterinario" class="form-select">
                
                <!-- Option por defecto -->
                <option value="" selected disabled hidden></option>

                <?php
                // Importar el código del otro archivo
                require("../cliente/cliente_select.php");
                
                // Verificar si llegan datos
                if($resultadoCliente):
                    
                    // Iterar sobre los registros que llegaron
                    foreach ($resultadoCliente as $fila):
                ?>

                <!-- Opción que se genera -->
                <option value="<?= $fila["cedula_ciudadania"]; ?>"><?= $fila["nombre"];?> <?= $fila["apellido"];?> - C.C. <?= $fila["cedula_ciudadania"]; ?></option>

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
require("empresa_select.php");

// Verificar si llegan datos
if($resultadoEmpresa and $resultadoEmpresa->num_rows > 0):
?>

<!-- MOSTRAR LA TABLA. Cambiar las cabeceras -->
<div class="tabla mt-5 mx-3 rounded-3 overflow-hidden">

    <table class="table table-striped table-bordered">

        <!-- Títulos de la tabla, cambiarlos -->
        <thead class="table-dark">
            <tr>
                <th scope="col" class="text-center">Código</th>
                <th scope="col" class="text-center">Nombre</th>
                <th scope="col" class="text-center">Tipo</th>
                <th scope="col" class="text-center">Edad</th>
                <th scope="col" class="text-center">Sexo</th>
                <th scope="col" class="text-center">Descripción</th>
                <th scope="col" class="text-center">Hijo de</th>
                <th scope="col" class="text-center">Refugio</th>
                <th scope="col" class="text-center">Acogedor</th>
                <th scope="col" class="text-center">Veterinario</th>
            </tr>
        </thead>

        <tbody>

            <?php
            // Iterar sobre los registros que llegaron
            foreach ($resultadoEmpresa as $fila):
            ?>

            <!-- Fila que se generará -->
            <tr>
                <!-- Cada una de las columnas, con su valor correspondiente -->
                <td class="text-center"><?= $fila["codigo"]; ?></td>
                <td class="text-center"><?= $fila["nombre"]; ?></td>
                <td class="text-center"><?= $fila["tipo"]; ?></td>
                <td class="text-center"><?= $fila["edad"]; ?></td>
                <td class="text-center"><?= $fila["sexo"]; ?></td>
                <td class="text-center"><?= $fila["descripcion"]; ?></td>
                <td class="text-center"><?= $fila["hijo_de"]; ?></td>
                <td class="text-center">Código: <?= $fila["refugio"]; ?></td>
                <td class="text-center">C.C. <?= $fila["acogedor"]; ?></td>
                <td class="text-center">C.C. <?= $fila["veterinario"]; ?></td>
                
                <!-- Botón de eliminar. Debe de incluir la CP de la entidad para identificarla -->
                <td class="text-center">
                    <form action="empresa_delete.php" method="post">
                        <input hidden type="number" name="codigoEliminar" value="<?= $fila["codigo"]; ?>">
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