<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header id="cabecalho-restrito">
<nav class="navbar navbar-principal">

  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      <a class="navbar-brand" href="<c:url value="/" />">Catálogo<span class="navbar-brand-bold">Net</span><span class="navbar-brand-sub"></span></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      <ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${not empty pageContext.request.userPrincipal}">
						<c:url var="divulgue" value="/divulgue-seu-negocio"/>
						<li><a href="${divulgue}">Divulgue seu negócio</a></li>
						<c:url var="criar" value="/area-da-empresa/criar-anuncio/informacoes"/>
						<li><a href="${criar}">Criar anúncio</a></li>
						<c:url var="contato" value="/contato"/>
						<li><a href='${contato}'>Contato</a></li>
						<c:url var="minhaConta" value="/area-da-empresa"/>
						<li><a href='${minhaConta}'>Minha Conta</a></li>
						<c:url var="logout" value="/logout"/>
						<li><a href='${logout}'>Sair</a></li>
					</c:when>
					<c:otherwise>
						<c:url var="divulgue" value="/divulgue-seu-negocio"/>
						<li><a href="${divulgue}">Divulgue seu negócio</a></li>
						<c:url var="contato" value="/contato"/>
						<li><a href="${contato}">Contato</a></li>
						<li><a href="<c:url value="/login" />">Login / Cadastre-se</a></li>
					</c:otherwise>
				</c:choose>
      </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</header>