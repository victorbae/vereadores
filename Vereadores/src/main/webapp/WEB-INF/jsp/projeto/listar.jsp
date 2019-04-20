<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Projetos</title>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
		console.log($('.onde-tem-os-valor-' + cod).data('nome'));
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
					    <a class="nav-link text-dark" href="<c:url value="/projeto/"/>">Projetos</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-dark" href="<c:url value="/partido/"/>">Partidos</a>
					  </li>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	
	<h3 class="display-4 text-center" style="margin-top: 12px;">Projetos</h3>
	<div class="row justify-content-sm-center m-0">
		<div class="jumbotron col-md-8 m-2 p-5">
			<form method="post" action="<c:url value="/projeto/pesquisar"/>">
				<div class="form-row mb-3">
					<label for="nome" class="col-sm-3 lead text-right pr-3">Nome:</label>
					<input type="text" class="form-control col-sm-9" id="nome.projeto" placeholder="Nome projeto" name="pesquisa.nomeProjeto">
				</div>
				<div class="form-row mb-3">
					<label for="partido" class="col-sm-3 lead text-right pr-3">Vereador:</label>
					<select class="custom-select col-sm-9" name="pesquisa.codigoVereador" placeholder="Vereador" id="vereador">
						<c:choose>
							<c:when test="${not empty vereadores}">
								<option selected value="">Todos</option>
								<c:forEach items="${vereadores}" var="vereador">
									<option value="${vereador.codigo}">${vereador.pessoa.nome}</option>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<option>Nenhum vereador cadastrado !!!</option>
							</c:otherwise>
						</c:choose>		
					</select>	  
				</div>
				<button type="button" onclick="location.href='<c:url value="/projeto/listar"/>'" class="btn btn-primary">Limpar pesquisas</button>
				<button type="submit" class="btn btn-primary float-right">Pesquisar</button>
			</form>
		</div>
	</div>
	<div class="row justify-content-sm-center m-0">
		<div class="alert alert-warning col-sm-8" role="alert">
			<p class="lead">Para criar, alterar ou excluir um projeto, vá para a tela de vereadores, edite o vereador responsavel pelo projeto, e faça essas açoes por lá</p>
		</div>
	</div>
	<div class="row justify-content-sm-center m-0" >
			<div class="col-sm-8">
				<button class="btn btn-info" data-toggle="modal" data-target="#fuckingProjetos" style="margin-bottom: 12px; margin-top: 12px;">Novo Projeto</button>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th class="col-sm-4">Vereador</th>
							<th class="col-sm-4">Projeto</th>
							<th class="col-sm-2 text-center">Apresentado</th>
							<th class="col-sm-2 text-center">Aprovado</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty projetoList}">
								<c:forEach items="${projetoList}" var="projeto" varStatus="loop">
									<tr class="pega-clique onde-tem-os-valor-${loop.index}" onclick="feedValues(${loop.index})" data-codigo="${projeto.codigo}"
									 	data-aprovado="${projeto.aprovado}" data-apresentado="${projeto.apresentado}" data-nome="${projeto.nome}">
										<td >${projeto.vereador.pessoa.nome}</td>
										<td >${projeto.nome}</td>
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
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="text-center" colspan="4">Nenhum projeto encontrado</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
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
							<input type="text" class="form-control" value="${projeto.nome}" name="projeto.nome" placeholder="Nome" id="projName" disabled="disabled">
						</div>
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" name="projeto.apresentado" checked="${projeto.apresentado}" id="switchApresentado" disabled="disabled">
							<label class="custom-control-label" for="switchApresentado">Apresentado</label>
						</div>
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" name="projeto.aprovado" checked="${projeto.aprovado}" id="switchAprovado" disabled="disabled">
							<label class="custom-control-label" for="switchAprovado">Aprovado</label>
						</div>
						<button type="submit" class="btn btn-success float-right" disabled="disabled">Salvar</button>
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