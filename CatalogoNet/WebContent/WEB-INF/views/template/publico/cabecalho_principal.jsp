<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="cabecalho-principal">
	<!-- container -->
	<div class="container">

		<div class="cabecalho-form">
		
			<c:url var="busca" value="/busca/buscaRequest" />
			<form action="${busca}" method="POST">
				<div class="cabecalho-form-busca">
					<label for="input-busca" class="cabecalho-label-busca">Buscar
					</label> <input type="text" class="form-control form-busca"
						id="input-busca" value="${stringBusca}" name="busca"  placeholder="O que você está procurando?">
				</div>

				<div class="cabecalho-form-local">
					<label for="input-busca" class="cabecalho-label-local">Local
					</label> <input type="text" class="form-control form-local"
						id="input-local"  value="${stringLocal}" name="local" placeholder="Asa sul, Guará, etc">
				</div>

				<div class="cabecalho-form-botao">
					<button type="submit" class="btn btn-primary btn-busca">
						Buscar <span class="  glyphicon glyphicon-search"></span>
					</button>
				</div>
			</form>

		</div>


	</div>
	<!-- /container -->

</header>