<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lista Projetos</title>
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
	<div class="row justify-content-sm-center" style="margin-left: 0px; margin-right: 0px;">
		<div class="col-sm-8">
			<h3 class="display-4" style=" margin-top: 12px;">Projetos</h3>
			<button class="btn btn-info" onclick="location.href='<c:url value="/partido/novo'"/>'" style="margin-bottom: 12px; margin-top: 12px;">Novo Projeto</button>
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
						<c:when test="${not empty projetoList}">
							<c:forEach items="${projetoList}" var="projeto">
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