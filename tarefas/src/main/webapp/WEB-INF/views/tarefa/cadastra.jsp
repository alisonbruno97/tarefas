<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tarefas - Cadastro</title>

<link href="/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

	<spring:url value="/tarefa/cadastra" var="cadastra"/>
	
	<jsp:include page="../comum/header.jsp"></jsp:include>
	
	<div class="container">
		
		<c:if test="${not empty erro}">
			<div class="alert alert-danger" role="alert">
				${erro}
			</div>
		</c:if>
		
		<h1>Cadastro de Tarefas</h1>
		
		<form:form modelAttribute="tarefa" action="${cadastra}">
			
			<input type="hidden" name="id" id="id" value="${tarefa.id}"/>
			
			<div class="form-group">
				<label for="nome">Nome</label>
				<input type="text" name="nome" id="nome" value="${tarefa.nome}" class="form-control">
			</div>
			
			<div class="form-group">
				<label for="descricao">Descrição</label>
				<textarea rows="10" cols="" name="descricao" id="descricao" class="form-control">${tarefa.descricao}</textarea>
			</div>
			
			<div class="form-group">
				<label for="dataAgendamento">Data Agendamento</label>
				<input type="date" name="dataAgendamento" id="dataAgendamento" value="${tarefa.dataAgendamento}" class="form-control"/>
			</div>
			
			<c:if test="${tarefa.id == '0'}">
				<button type="submit" class="btn btn-primary">Cadastrar</button>
			</c:if>
			<c:if test="${tarefa.id != '0'}">
				<button type="submit" class="btn btn-primary">Editar</button>
			</c:if>
			
			
			<a href="/" class="btn btn-success">Voltar</a>
		</form:form>
		
	</div>	
	
	
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
</body>
</html>