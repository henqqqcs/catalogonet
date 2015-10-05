<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<!-- meus-anuncios-header -->
			<div class="meus-anucios-header clearfix">

				<div class="col-md-7">
					<!-- meus-anucios-header-titulo -->
					<div class="meus-anucios-header-titulo">
						<h1>${anuncio.titulo}</h1>
					</div>
					<!-- fim meus-anucios-header-titulo -->

					<!-- meus-anucios-header-info -->
					<div class="meus-anucios-header-info">
						<p>
						 <span itemprop="addressLocality">${anuncio.cidade.nome}</span>,
					                  <span itemprop="addressRegion">${anuncio.estado.nome}</span><c:if test="${not empty anuncio.cep}"> | CEP: <span itemprop="postalCode">${anuncio.cep}</span></c:if>
						</p>
						<p>
						<c:if test="${not empty anuncio.bairro}">
							<span class="district">${anuncio.bairro.nome}</span>
							<c:if test="${not empty anuncio.endereco}">, <span itemprop="streetAddress">${anuncio.endereco}</span></c:if>
						</c:if>
						</p>
						<p><strong><span class="glyphicon glyphicon-earphone"></span> ${anuncio.telefone1 }</strong></p>
					</div>
					<!-- fim meus-anucios-header-info -->
				</div>
				<div class="col-md-5 meus-anucios-header-links">
					<p><a class="btn btn-black"href="">Visualizar Anúncio</a></p>
					<p><a class="btn btn-black"href="">Contratar Plano</a></p>
				</div>

			</div>
			<!-- fim meus anuncios header -->