<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Insert tittle here</title>
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <meta name="description" content="XXXXXXXX DESCRIPTION XXXXXXXX">
  <meta name="keywords" content="YYYYYYY KEYWORDS YYYYYYYYYY">
  
<!-- dependencias -->
<c:import url="/WEB-INF/views/template/publico/arquivos-css-js-publico.jsp" />
</head>
<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />
	
	<!-- Cabeçalho principal -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_principal.jsp" />
	
	<!-- container -->
	<div class="container">
	
	
	<!-- 	section nails -->
	<section class="locais-container">

    <!-- local-top -->
    <div class="local-top">
      <!-- local-top-item -->
      <div class="local-top-item">

        <!-- thumbnail -->
        <div class="thumbnail">
          <span class="local-titulo"><strong>top</strong> restaurantes <span class="glyphicon glyphicon-chevron-down"></span></span>
        
        	  <c:url var="restaurante" value="/resources/imagens/restaurantes.jpg" /> 
              <img src="${restaurante}" alt="restaurantes df"/>

              <!-- lista-local-ranking -->
              <div class="lista-local-ranking">
                <ol>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">1</span>
                        <h3>Pizzaria do Zé sdfsdjkgfgksdfgsdfhj</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">2</span>
                        <h3>Primo Piato</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">3</span>
                        <h3>Dona Lenha</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">4</span>
                        <h3>PIZZARIA PIZZA A BESSA</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">5</span>
                        <h3>Pizzaria do Zé sdfsdjkgfgksdfgsdfhj</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div class="text-center">
                      <a href="#">Mais Pizzarias <span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                  </li>
                </ol>
              </div>
              <!-- fim lista-local-ranking -->



        </div>
        <!-- fim thumbnail -->
      </div>
      <!-- fim local-top-item -->
    </div>
    <!-- fim local-top -->

    <!-- local-top -->
    <div class="local-top">
      <!-- local-top-item -->
      <div class="local-top-item">

        <!-- thumbnail -->
        <div class="thumbnail">
          <span class="local-titulo"><strong>top</strong> pizzarias <span class="glyphicon glyphicon-chevron-down"></span></span>
          
          
              <c:url var="pizzaria" value="/resources/imagens/pizza.jpg" /> 
              <img src="${pizzaria}" alt="pizzaria df"/>

              <!-- lista-local-ranking -->
              <div class="lista-local-ranking">
                <ol>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">1</span>
                        <h3>Pizzaria do Zé sdfsdjkgfgksdfgsdfhj</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">2</span>
                        <h3>Primo Piato</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">3</span>
                        <h3>Dona Lenha</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">4</span>
                        <h3>PIZZARIA PIZZA A BESSA</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">5</span>
                        <h3>Pizzaria do Zé sdfsdjkgfgksdfgsdfhj</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div class="text-center">
                      <a href="#">Mais Pizzarias <span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                  </li>
                </ol>
              </div>
              <!-- fim lista-local-ranking -->



        </div>
        <!-- fim thumbnail -->
      </div>
      <!-- fim local-top-item -->
    </div>
    <!-- fim local-top -->

    <!-- local-top -->
    <div class="local-top">
      <!-- local-top-item -->
      <div class="local-top-item">

        <!-- thumbnail -->
        <div class="thumbnail">
          <span class="local-titulo"><strong>top</strong> bares <span class="glyphicon glyphicon-chevron-down"></span></span>
          
              <c:url var="bares" value="/resources/imagens/bar.jpg" /> 
              <img src="${bares}" alt="bares df"/>

              <!-- lista-local-ranking -->
              <div class="lista-local-ranking">
                <ol>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">1</span>
                        <h3>Pizzaria do Zé sdfsdjkgfgksdfgsdfhj</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">2</span>
                        <h3>Primo Piato</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">3</span>
                        <h3>Dona Lenha</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">4</span>
                        <h3>PIZZARIA PIZZA A BESSA</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">5</span>
                        <h3>Pizzaria do Zé sdfsdjkgfgksdfgsdfhj</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div class="text-center">
                      <a href="#">Mais Pizzarias <span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                  </li>
                </ol>
              </div>
              <!-- fim lista-local-ranking -->



        </div>
        <!-- fim thumbnail -->
      </div>
      <!-- fim local-top-item -->
    </div>
    <!-- fim local-top -->

    <!-- local-top -->
    <div class="local-top">
      <!-- local-top-item -->
      <div class="local-top-item">

        <!-- thumbnail -->
        <div class="thumbnail">
          <span class="local-titulo"><strong>top</strong> outros <span class="glyphicon glyphicon-chevron-down"></span></span>
          
              <c:url var="academia" value="/resources/imagens/academia.jpg" /> 
              <img src="${academia}" alt="academias df"/>
              
              <!-- lista-local-ranking -->
              <div class="lista-local-ranking">
                <ol>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">1</span>
                        <h3>Pizzaria do Zé sdfsdjkgfgksdfgsdfhj</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">2</span>
                        <h3>Primo Piato</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">3</span>
                        <h3>Dona Lenha</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">4</span>
                        <h3>PIZZARIA PIZZA A BESSA</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div>
                      <a href="#">
                        <span class="item-numero">5</span>
                        <h3>Pizzaria do Zé sdfsdjkgfgksdfgsdfhj</h3>
                        <span class="item-saiba-mais">Saiba Mais <span class="glyphicon glyphicon-chevron-right"></span></span>
                      </a>
                    </div>
                  </li>
                  <li>
                    <div class="text-center">
                      <a href="#">Mais Pizzarias <span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                  </li>
                </ol>
              </div>
              <!-- fim lista-local-ranking -->



        </div>
        <!-- fim thumbnail -->
      </div>
      <!-- fim local-top-item -->
    </div>
    <!-- fim local-top -->

  </section>
  <!--   fim section nails -->
  
  
  
  <!-- categorias mais acessadas -->
    <div class="categorias-mais-acessadas">
      <h2><strong>Categorias mais acessadas</strong>
      <small><a href="#">Mais categorias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a></small></h2>
      <hr>
      
      <!-- categorias-container -->
      <div class="categorias-container">
        <!-- categoria-group -->
        <div class="categorias-group">
          <h4>Restaurantes</h4>
          <nav>
            <ul>
              <li>
                <a href="#">Pizzarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Restaurantes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Churrascarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Lanchonetes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Padarias e confeitarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
            </ul>
          </nav>  
        </div>
        <!-- /categoria-group -->
        <!-- categoria-group -->
        <div class="categorias-group">
          <h4>Saúde e Beleza</h4>
          <nav>
            <ul>
              <li>
                <a href="#">Cabeleleiros <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Farmácias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Dentistas <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Drogarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Clínicas <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
            </ul>
          </nav>  
        </div>
        <!-- /categoria-group -->
        <!-- categoria-group -->
        <div class="categorias-group">
          <h4>Outros</h4>
          <nav>
            <ul>
              <li>
                <a href="#">Academias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Oficinas <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Hotéis <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Automóveis <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Supermercados <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
            </ul>
          </nav>  
        </div>
        <!-- /categoria-group -->
        <!-- categoria-group -->
        <div class="categorias-group">
          <h4>Restaurantes</h4>
          <nav>
            <ul>
              <li>
                <a href="#">Pizzarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Restaurantes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Churrascarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Lanchonetes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Padarias e confeitarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
            </ul>
          </nav>  
        </div>
        <!-- /categoria-group -->
      </div>
      <!-- fim categorias-container -->

      <!-- categorias-container -->
      <div class="categorias-container">
        <!-- categoria-group -->
        <div class="categorias-group">
          <h4>Restaurantes</h4>
          <nav>
            <ul>
              <li>
                <a href="#">Pizzarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Restaurantes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Churrascarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Lanchonetes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Padarias e confeitarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
            </ul>
          </nav>  
        </div>
        <!-- /categoria-group -->
        <!-- categoria-group -->
        <div class="categorias-group">
          <h4>Restaurantes</h4>
          <nav>
            <ul>
              <li>
                <a href="#">Pizzarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Restaurantes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Churrascarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Lanchonetes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Padarias e confeitarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
            </ul>
          </nav>  
        </div>
        <!-- /categoria-group -->
        <!-- categoria-group -->
        <div class="categorias-group">
          <h4>Restaurantes</h4>
          <nav>
            <ul>
              <li>
                <a href="#">Pizzarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Restaurantes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Churrascarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Lanchonetes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Padarias e confeitarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
            </ul>
          </nav>  
        </div>
        <!-- /categoria-group -->
        <!-- categoria-group -->
        <div class="categorias-group">
          <h4>Restaurantes</h4>
          <nav>
            <ul>
              <li>
                <a href="#">Pizzarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Restaurantes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Churrascarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Lanchonetes <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
              <li>
                <a href="#">Padarias e confeitarias <span style="color:#face0e;" class="glyphicon glyphicon-chevron-right"></span></a>
              </li>
            </ul>
          </nav>  
        </div>
        <!-- /categoria-group -->
      </div>
      <!-- fim categorias-container -->

    </div>
    <!-- /categorias mais acessadas -->
	
	</div>
	<!-- fim container -->
	
	<!-- rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

</body>
</html>