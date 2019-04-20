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
	
	<div class="row justify-content-sm-center">
		<div class="col-sm-5">
			<h2 class="display-4" style="margin-bottom: 12px; margin-top: 12px; text-align: center;">Novo Partido</h2>
			<form action="<c:url value="/partido/salvar"/>" method="post">
			  <div class="form-group">
				<input type="hidden" name="partido.codigo" value="${partido.codigo}"> 
				<input type="text" class="form-control" value="${partido.numero}" name="partido.numero" placeholder="Número" required="required">
			  </div>
			  <div class="form-group">
				<input type="text" class="form-control" value="${partido.nome}" name="partido.nome" placeholder="Nome" required="required">
			  </div>
			  <div class="form-group">
				<input type="text" class="form-control" value="${partido.sigla}" name="partido.sigla" placeholder="Sigla" required="required">
			  </div>
			  
			  <button type="submit" class="btn btn-success float-right">Salvar</button>
			</form>
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