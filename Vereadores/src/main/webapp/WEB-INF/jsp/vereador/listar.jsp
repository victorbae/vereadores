<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Vereadores</title>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
	.pega-clique:hover{
		cursor: pointer;
	}
</style>
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
	
	<h3 class="display-4 text-center" style="margin-top: 12px;">Vereadores</h3>
	<div class="row justify-content-sm-center m-0">
		<div class="jumbotron col-md-8 m-2 p-5">
			<form method="post" action="<c:url value="/vereador/pesquisar"/>">
				<div class="form-row mb-3">
					<label for="dataInicio" class="col-sm-3 lead text-right pr-2 ">Data de associação</label>
					<div class="col pl-0">
						<p class="lead mb-0">De:</p>
						<input type="text" class="form-control" id="dataInicio" placeholder="Data Inicial" onfocus="(this.type='date')" name="pesquisa.dataInicio">
					</div>
					<div class="col pr-0">
						<p class="lead mb-0">Até:</p>
						<input type="text" class="form-control" id="dataFim" placeholder="Data Final" onfocus="(this.type='date')" name="pesquisa.dataFim">
					</div>
				</div>
				<div class="form-row mb-3">
					<label for="nome" class="col-sm-3 lead text-right pr-3">Nome:</label>
					<input type="text" class="form-control col-sm-9" id="nome" placeholder="Nome do vereador" name="pesquisa.nome">
				</div>
				<div class="form-row mb-3">
					<label for="partido" class="col-sm-3 lead text-right pr-3">Partido:</label>
					<select class="custom-select col-sm-9" name="pesquisa.codigoPartido" placeholder="Partido" id="partido">
						<c:choose>
							<c:when test="${not empty partidos}">
								<option selected value="">Todos</option>
								<c:forEach items="${partidos}" var="partido">
									<option value="${partido.codigo}">${partido.sigla} - ${partido.nome}</option>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<option>Nenhum partido cadastrado !!!</option>
							</c:otherwise>
						</c:choose>		
					</select>	  
				</div>
				<button type="button" onclick="location.href='<c:url value="/vereador/listar"/>'" class="btn btn-primary">Limpar pesquisas</button>
				<button type="submit" class="btn btn-primary float-right">Pesquisar</button>
			</form>
		</div>
	</div>
	<div class="row justify-content-sm-center m-0">
		<div class="col-sm-8">
			<button class="btn btn-info" onclick="location.href='<c:url value="/vereador/novo"/>'" style="margin-bottom: 12px; margin-top: 12px;">Novo Vereador</button>
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th colspan="1">Nome</th>
						<th scope="col">Data Associaçao</th>
						<th scope="col">Partido</th>
						<th scope="col">#</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty vereadorList}">
							<c:forEach items="${vereadorList}" var="vereador">
								<tr class="pega-clique">
									<td onclick="location.href='<c:url value="/vereador/editar/${vereador.codigo}"/>'">${vereador.pessoa.nome}</td>
									<td onclick="location.href='<c:url value="/vereador/editar/${vereador.codigo}"/>'">${vereador.dataAssociacao}</td>
									<td onclick="location.href='<c:url value="/vereador/editar/${vereador.codigo}"/>'">${vereador.partido.sigla}</td>
									<td>
								      	<button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='<c:url value="/vereador/excluir/${vereador.codigo}"/>'">
								      		Excluir
								      	</button>
								    </td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="text-center">Nenhum vereador encontrado</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
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