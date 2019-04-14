<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Novo Partido</title>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
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
					    <a class="nav-link text-dark" href="<c:url value="/partido'"/>">Partidos</a>
					  </li>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	
	<div class="row justify-content-sm-center">
		<div class="col-sm-5">
			<h2 class="display-4" style="margin-bottom: 12px; margin-top: 12px; text-align: center;">Novo Vereador</h2>
			<form action="<c:url value="/vereador/salvar"/>" method="post">
			  <div class="form-group">
				<input type="hidden" name="vereador.codigo" value="${vereador.codigo}"> 
				<input type="text" class="form-control" value="${vereador.nome}" name="vereador.nome" placeholder="Nome">
			  </div>
			  <div class="form-group">
	              <input type="text" class="form-control" id="data" name="vereador.dataAssociacao" placeholder="Data Associacao" value="${vereador.dataAssociacao}" onfocus="(this.type='date')" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"/>
		      </div>
			  
			  <button type="submit" class="btn btn-success float-right">Salvar</button>
			</form>
		</div>
	</div>
	
	
	<div class="row justify-content-sm-center" style="margin-left: 0px; margin-right: 0px;">
		<div class="col-sm-8">
			<h3 class="display-4" style=" margin-top: 12px;">Projetos</h3>
			<button class="btn btn-info" data-toggle="modal" data-target="#projeto" style="margin-bottom: 12px; margin-top: 12px;">Novo Projeto</button>
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th >Nome</th>
						<th >Apresentado</th>
						<th >Aprovado</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty vereador.projetos}">
							<c:forEach items="${projetoLvereador.projetosist}" var="projeto">
								<tr>
									<td onclick="location.href='<c:url value="/projeto/editar/${projeto.codigo}'"/>'">${projeto.nome}</td>
									<td>
										<c:choose>
											<c:when test="${projeto.apresentado == true}">
												<i class="fas fa-check"></i>
										     </c:when>
											<c:otherwise>
												<i class="fas fa-times"></i>
											</c:otherwise>
										</c:choose>
								    </td>
									<td>
										<c:choose>
											<c:when test="${projeto.aprovado == true}">
												<i class="fas fa-check"></i>
										     </c:when>
											<c:otherwise>
												<i class="fas fa-times"></i>
											</c:otherwise>
										</c:choose>
								    </td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="text-center">Nenhum projeto cadastrado</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
		
	<div class="modal" tabindex="-1" role="dialog" id="projeto">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Projeto</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="<c:url value="/partido/salvar"/>" method="post">
						<div class="form-group">
							<input type="hidden" name="partido.codigo" value="${projeto.codigo}"> 
							<input type="text" class="form-control" value="${projeto.nome}" name="projeto.nome" placeholder="Nome">
						</div>
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" name="projeto.apresentado" value="${projeto.apresentado}" id="switchApresentado">
							<label class="custom-control-label" for="switchApresentado">Apresentado</label>
						</div>
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" name="projeto.aprovado" value="${projeto.aprovado}" id="switchAprovado">
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