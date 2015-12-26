<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- menu-esquerda -->
<ul class="nav nav-pills nav-stacked">
	<li class="active"><a href="<c:url value="/area-da-empresa"/>">Home</a></li>
	<li><a
		href="<c:url value="/area-da-empresa/criar-anuncio/informacoes"/>">Criar
			Anúncio</a></li>
	<li><a href="<c:url value="/area-da-empresa/meus-anuncios"/>">Meus
			Anúncios</a></li>
	<li><a href="<c:url value="/area-da-empresa/contratar-plano"/>">Contratar
			Plano</a></li>
	<li><a href="<c:url value="/area-da-empresa/meus-planos"/>">Meus
			Planos</a></li>
	<li><a href="<c:url value="/area-da-empresa/meus-pedidos"/>">Meus
			Pedidos</a></li>
	<li><a href="<c:url value="/area-da-empresa/meus-dados"/>">Meus
			Dados</a></li>
</ul>
<!-- /menu-esquerda -->