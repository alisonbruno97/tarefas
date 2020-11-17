<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tarefas - Home</title>

<link href="/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	
	<spring:url value="/tarefa/edita" var="edita"/>
	<spring:url value="/tarefa/deleta" var="deleta"/>
	<spring:url value="/tarefa/finaliza" var="finaliza"/>
	
	<jsp:include page="comum/header.jsp"></jsp:include>
	
	<div class="container">
		
		<div id="alertas">
		
			<c:if test="${not empty sucesso}">
				<div class="alert alert-success" role="alert">
					${sucesso}
				</div>
			</c:if>
			
			<c:if test="${not empty erro}">
				<div class="alert alert-danger" role="alert">
					${erro}
				</div>
			</c:if>
		
		</div>
		
		<div class="jumbotron">
			<h1>Tarefas a realizar</h1>
		</div>
		
		<c:if test="${not empty tarefasNaoFinalizadas}"> <!-- verificação se a lista tarefas é nula -->
			<table class="table">
			
				<tr>
					<th width="40%">Nome</th>
					<th width="20%">Data Agendamento</th>
					<th width="20%">Data Criação</th>
					<th width="20%" colspan="3">Ações</th>
				</tr>
				<c:forEach var="tarefa" items="${tarefasNaoFinalizadas}">
					
					<tr>
						<td>${tarefa.nome}</td>
						<td>${tarefa.dataAgendamento}</td>
						<td>${tarefa.dataCriacao}</td>
						<td><a href="${finaliza}/${tarefa.id}" class="btn btn-secondary">Finalizar</a></td>
						<td><a href="${edita}/${tarefa.id}" class="btn btn-warning">Editar</a></td>
						<td><a href="${deleta}/${tarefa.id}" class="btn btn-danger">Deletar</a></td>
					</tr>
					
				</c:forEach>
			</table>
		</c:if>
		
		
		
		<c:if test="${not empty tarefasFinalizadas}"> <!-- verificação se a lista tarefas finalizadas é nula -->
			
			<div class="jumbotron">
				<h1>Tarefas Finalizadas</h1>
			</div>
			
			<table class="table">
			
				<tr>
					<th width="40%">Nome</th>
					<th width="20%">Data Agendamento</th>
					<th width="20%">Data Criação</th>
					<th width="20%">Data Término</th>
				</tr>
				<c:forEach var="tarefa" items="${tarefasFinalizadas}">
					
					<tr>
						<td>${tarefa.nome}</td>
						<td>${tarefa.dataAgendamento}</td>
						<td>${tarefa.dataCriacao}</td>
						<td>${tarefa.dataTermino}</td>
					</tr>
					
				</c:forEach>
			</table>
		</c:if>
	
	</div>	
	
	
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			window.setTimeout("fadeAlertas();", 5000);
		});

		function fadeAlertas() {
			$("#alertas").fadeOut('slow');
		}
	</script>
</body>
</html>