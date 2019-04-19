<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Vereador</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
</head>
<style>
	.pega-clique:hover{
		cursor: pointer;
	}
	.make-font-linda{
		font-size: 21px;
	}
	.danger{
		color: #dc3545;
	}
	.success{
		color: #28a745;
	}
</style>
<script>
	function feedValues(cod) {
		console.log('.onde-tem-os-valor-' + cod);
		$('#projCod').val($('.onde-tem-os-valor-' + cod).data('codigo'));
		$('#projName').val($('.onde-tem-os-valor-' + cod).data('nome'));
		$('#switchAprovado').attr('checked', $('.onde-tem-os-valor-' + cod).data('aprovado'));
		$('#switchApresentado').attr('checked', $('.onde-tem-os-valor-' + cod).data('apresentado'));
		
		$('#fuckingProjetos').modal('show');
	}
</script>
<body>
	<header>
		<div>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="navbar-nav">
					<ul class="nav">
					  <li class="nav-item" style="margin-right: 10px">
					    <a class="nav-link text-dark" href="<c:url value="/"/>">Vereadores</a>
					  </li>
					  <li class="nav-item" style="margin-right: 10px">
					    <a class="nav-link text-dark" href="<c:url value="/projeto"/>">Projetos</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-dark" href="<c:url value="/partido/"/>">Partidos</a>
					  </li>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	
	<div class="row justify-content-sm-center m-0">
		<div class="col-sm-5">
		<c:choose>
			<c:when test="${not empty vereador.codigo}">
				<c:set var="titulo" value="Editar Vereador"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="titulo" value="Novo Vereador"></c:set>
			</c:otherwise>
		</c:choose>
			<h2 class="display-4" style="margin-bottom: 12px; margin-top: 12px; text-align: center;">${titulo}</h2>
			<form action="<c:url value="/vereador/salvar"/>" method="post">
			  <div class="form-group">
				<input type="hidden" name="vereador.codigo" value="${vereador.codigo}"> 
				<input type="hidden" name="vereador.pessoa.codigo" value="${vereador.pessoa.codigo}"> 
				<input type="text" class="form-control" value="${vereador.pessoa.nome}" name="vereador.pessoa.nome" placeholder="Nome">
			  </div>
			  <div class="form-group">
	              <input type="text" class="form-control" id="data" name="vereador.dataAssociacao" placeholder="Data Associacao" value="${vereador.dataAssociacao}" onfocus="(this.type='date')" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"/>
		      </div>
			  <div class="form-group">
			  <select class="custom-select" name="vereador.partido.codigo"
						placeholder="Partido">
					<c:choose>
						<c:when test="${not empty partidos}">
							<c:forEach items="${partidos}" var="partido">
								<option selected value="${partido.codigo}">${partido.nome}</option>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<option>Nenhum partido cadastrado !!!</option>
						</c:otherwise>
					</c:choose>		
				</select>	  
		      </div>
			  <button type="submit" class="btn btn-success float-right">Salvar</button>
			</form>
		</div>
	</div>
	
	<c:if test="${not empty vereador.codigo}">
		<div class="row justify-content-sm-center m-0" style="margin-left: 0px; margin-right: 0px;">
			<div class="col-sm-8">
				<h3 class="display-4" style=" margin-top: 12px;">Projetos</h3>
				<button class="btn btn-info" data-toggle="modal" data-target="#fuckingProjetos" style="margin-bottom: 12px; margin-top: 12px;">Novo Projeto</button>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th class="col-sm-6">Nome</th>
							<th class="col-sm-2 text-center">Apresentado</th>
							<th class="col-sm-2 text-center">Aprovado</th>
							<th class="col-sm-2 text-center">#</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty vereador.projetos}">
								<c:forEach items="${vereador.projetos}" var="projeto" varStatus="loop">
									<tr>
										<td onclick="feedValues(${loop.index})" data-codigo="${projeto.codigo}" data-aprovado="${projeto.aprovado}"
											 data-apresentado="${projeto.apresentado}" data-nome="${projeto.nome}"
											 class="pega-clique onde-tem-os-valor-${loop.index}" >${projeto.nome}</td>
										<td class="text-center">
											<c:choose>
												<c:when test="${projeto.apresentado == true}">
													<i class="fas fa-check make-font-linda success"></i>
											     </c:when>
												<c:otherwise>
													<i class="fas fa-times make-font-linda danger"></i>
												</c:otherwise>
											</c:choose>
									    </td>
										<td class="text-center">
											<c:choose>
												<c:when test="${projeto.aprovado == true}">
													<i class="fas fa-check make-font-linda success"></i>
											     </c:when>
												<c:otherwise>
													<i class="fas fa-times make-font-linda danger"></i>
												</c:otherwise>
											</c:choose>
									    </td>
									    <td class="text-center">
									      	<button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='<c:url value="/projeto/excluir/${vereador.codigo}/${projeto.codigo}"/>'">
									      		Excluir
									      	</button>
									    </td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="text-center" colspan="4">Nenhum projeto cadastrado</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
		
	<div class="modal fade" tabindex="-1" role="dialog" id="fuckingProjetos">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Projeto</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="<c:url value="/projeto/salvar"/>" method="post" id="form-punk">
						<div class="form-group">
							<input type="hidden" name="projeto.vereador.codigo" value="${vereador.codigo}"> 
							<input type="hidden" name="projeto.codigo" value="${projeto.codigo}" id="projCod"> 
							<input type="text" class="form-control" value="${projeto.nome}" name="projeto.nome" placeholder="Nome" id="projName">
						</div>
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" name="projeto.apresentado" checked="${projeto.apresentado}" id="switchApresentado">
							<label class="custom-control-label" for="switchApresentado">Apresentado</label>
						</div>
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" name="projeto.aprovado" checked="${projeto.aprovado}" id="switchAprovado">
							<label class="custom-control-label" for="switchAprovado">Aprovado</label>
						</div>
						<button type="submit" class="btn btn-success float-right">Salvar</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<footer>
		<div class="row justify-content-sm-center">
			<div class="col-sm-6 text-center">
				<ul class="nav fixed-bottom">
					<li><a href="https://www.facebook.com/victhor.baesso" class="nav-link">J. Victor Baesso®</a></li>
				</ul>
			</div>
		</div>
	</footer>
</body>
</html>