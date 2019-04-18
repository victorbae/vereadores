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
	
	<div class="row justify-content-sm-center" style="margin-left: 0px; margin-right: 0px;">
		<div class="col-sm-8">
			<h3 class="display-4" style=" margin-top: 12px;">Vereadores</h3>
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
								<td colspan="3" class="text-center">Nenhum vereador cadastrado</td>
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