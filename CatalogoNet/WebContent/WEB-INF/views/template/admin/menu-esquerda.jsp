<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!-- menu esquerda -->
		<div class="menu-esquerda col-md-2">

			<ul class="nav nav-pills nav-stacked nav-pills-black">
				<li class="active "role="presentation"><a href="">Home <span class="glyphicon glyphicon-home"></span></a></li>

				<!-- anuncios -->
				<li role="presentation" class="dropdown">
					
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Anúncios <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<c:url var="buscaAnuncio" value="/adminadmin/anuncios/busca-anuncio"/>
						<li role="presentation"><a href="${buscaAnuncio}">Lista de anúncios</a></li>
						<li role="separator" class="divider"></li>
						<c:url var="listaAnunciosAprovacao" value="/adminadmin/anuncios/lista-anuncios-aprovacao"/>
						<li role="presentation"><a href="${listaAnunciosAprovacao}">Anúncios a serem aprovados</a></li>
					</ul>
				</li>
				<!-- fim anuncios -->

				<!-- planos -->
				<li role="presentation" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Planos <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li role="presentation"><a href="#">Lista de planos</a></li>
						<li role="separator" class="divider"></li>
						<li role="presentation"><a href="#">Lista de planos</a></li>
					</ul>
				</li>
				<!-- fim planos -->

				<!-- pedidos -->
				<li role="presentation" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Pedidos <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li role="presentation"><a href="#">Lista de pedidos</a></li>
						<li role="separator" class="divider"></li>
						<li role="presentation"><a href="#">Pedidos pagos</a></li>
						<li role="presentation"><a href="#">Pedidos não pagos</a></li>
					</ul>
				</li>
				<!-- fim pedidos -->

				<!-- produtos -->
				<li role="presentation" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Produtos <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<c:url var="listaProdutos" value="/adminadmin/produtos/lista-produtos"/>
						<li role="presentation"><a href="${listaProdutos}">Lista produtos</a></li>
						<li role="separator" class="divider"></li>
						<c:url var="cadastrar" value="/adminadmin/produtos/cadastrar-produto"/>
						<li role="presentation"><a href="${cadastrar}">Cadastrar produtos</a></li>
					</ul>
				</li>
				<!-- fim produtos -->

				<!-- usuarios -->
				<li role="presentation" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Usuários <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<c:url var="buscaUsuario" value="/adminadmin/usuarios/busca"/>
						<li role="presentation"><a href="${buscaUsuario}">Busca de Usuários</a></li>
					</ul>
				</li>
				<!-- fim usuarios -->

				<!-- locais -->
				<li role="presentation" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Locais <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<c:url var="listaLocais" value="/adminadmin/locais/lista-locais"/>
						<li role="presentation"><a href="${listaLocais}">Lista de locais</a></li>
						<li role="separator" class="divider"></li>
						<c:url var="cadastrarEstado" value="/adminadmin/locais/cadastrar-estado"/>
						<li role="presentation"><a href="${cadastrarEstado}">Cadastrar Estado</a></li>
						<c:url var="cadastrarCidade" value="/adminadmin/locais/cadastrar-cidade"/>
						<li role="presentation"><a href="${cadastrarCidade}">Cadastrar Cidade</a></li>
						<c:url var="cadastrarBairro" value="/adminadmin/locais/cadastrar-bairro"/>
						<li role="presentation"><a href="${cadastrarBairro}">Cadastrar Bairro</a></li>
					</ul>
				</li>
				<!-- fim locais -->


				<!-- categorias -->
				<li role="presentation" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Categorias <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<c:url var="listaCategorias" value="/adminadmin/categorias/lista-categorias"/>
						<li role="presentation"><a href="${listaCategorias}">Lista de categorias</a></li>
					</ul>
				</li>
				<!-- fim categorias -->

				<li role="separator" class="divider"></li>

				<!-- configuracao -->
				<li role="presentation" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Configurações <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<c:url var="email" value="/adminadmin/configuracoes/email"/>
						<li role="presentation"><a href="${email}">Config. de Email</a></li>
						<c:url var="back" value="/adminadmin/configuracoes/backup"/>
						<li role="presentation"><a href="${back}">Config. de Backup</a></li>
					</ul>
				</li>
				<!-- fim configuracao -->
				
			</ul>


		</div>
		<!-- ./ fim menu equerda -->