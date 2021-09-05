<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>ACTIVIDAD01 </title>
</head>
<body>

<div class="container">
<h1>Registra Medicamento</h1>

	<form id="id_form"> 

			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_precio">Precio</label>
				<input class="form-control" type="text" id="id_precio" name="precio" placeholder="Ingrese precio" maxlength="8">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_stock">Stock</label>
				<input class="form-control" type="text" id="id_stock" name="stock" placeholder="Ingrese el stock" maxlength="100">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_labo">Laboratorio</label>
				<input class="form-control" type="text" id="id_labo" name="laboratorio" placeholder="Ingrese laboratorio" maxlength="100">    
			</div>
			
			
			<div class="form-group">
				<button id="id_registrar" type="button" class="btn btn-primary" >Crea Medicamento</button>
			</div>
	</form>
</div>

<script type="text/javascript">

$("#id_registrar").click(function (){ 

	 $.ajax({
         type: "POST",
         url: "registraMedicamento", 
         data: $('#id_form').serialize(),
         success: function(data){
       	  mostrarMensaje(data.mensaje);
         },
         error: function(){
       	  mostrarMensaje(MSG_ERROR);
         }
    });

});


function limpiar(){
	$('#id_nombre').val('');
	$('#id_precio').val('');
	$('#id_stock').val('');
	$('#id_labo').val('');
}

$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                    }
                },
                precio:{
                    selector: "#id_precio",
                    validators:{
                        notEmpty: {
                             message: 'El precio es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 10,
                            message: 'El precio es 3 a 10 digitos'
                        },
                    }
                },
                stock:{
                    selector: "#id_stock",
                    validators:{
                        notEmpty: {
                             message: 'El stock es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El stock es de 3 a 40 digitos'
                        },
                    }
                },
                laboratorio:{
                    selector: "#id_labo",
                    validators:{
                        notEmpty: {
                             message: 'El laboratorio es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El laboratorio es de 3 a 40 caracteres'
                        },
                    }
                },
        }   
    });

    
});
</script>

</body>
</html>




