<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Actividad02-Aldo Sanchez </title>
</head>
<body> 
 <div class="container">
 <h2>Consulta de Medicamento por Nombre</h2>
		 <div class="col-md-23" >  
				
		       <form action="filtraAlumno" accept-charset="UTF-8"  class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">
							<input class="form-control" id="id_nombre" name="filtro" placeholder="Ingrese el nombre" type="text"/>
						</div>
						<div class="col-md-3">	
							<button type="button" class="btn btn-primary" id="id_filtro" >FILTRA</button><br>&nbsp;<br>
						</div>
					</div>			
				</form>	
				
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Precio</th>
												<th>Stock</th>
												<th>Laboratorio</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 	
		  </div>
</div>

<script type="text/javascript">

$("#id_filtro").click(function (){
	var nom = $("#id_nombre").val();
	$.getJSON("consultaPorNombre",{"nombre":nom},function(lista){
		agregarGrilla(lista);
	});	
	
});

function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 5,
			lengthChange: false,
			columns:[
				{data: "idMedicamento",className:'text-center'},
				{data: "nombre",className:'text-left'},
				{data: "precio",className:'text-center'},
				{data: "stock",className:'text-center'},
				{data: "laboratorio",className:'text-center'},

			]                                     
	    });
}
</script>

</body>
</html> 






