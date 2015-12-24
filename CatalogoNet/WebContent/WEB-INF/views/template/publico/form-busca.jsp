<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script type="text/javascript">
$(window).scroll(function(){var a=$(window).scrollTop(),e=screen.width,r=210;e>780&&(r=130),e>=981&&(r=150),780>=e?(a>r?($(".wrapper-form-busca").hide(),$(".wrapper-form-busca-hidden").show()):$(".wrapper-form-busca").show(),a>r&&!$(".wrapper-form-busca-hidden").hasClass("active")?($(".wrapper-form-busca-hidden").addClass("active"),0==$(".busca-hidden-mensagem-clique").text().length&&$(".busca-hidden-mensagem-clique").append('<span id="mensagem-to-apend">Clique aqui para pesquisar <span class="glyphicon glyphicon-search"></span></span>')):r>=a&&$(".wrapper-form-busca-hidden").hasClass("active")&&($(".busca-hidden-mensagem-clique").text().length>0&&$("#mensagem-to-apend").remove(),$(".wrapper-form-busca-hidden").removeClass("active"),$(".wrapper-form-busca").removeClass("wrapper-fixed"))):a>r&&!$(".wrapper-form-busca").hasClass("active")?($(".wrapper-form-busca").addClass("wrapper-fixed"),$(".wrapper-form-busca").addClass("active")):r>=a&&$(".wrapper-form-busca").hasClass("active")&&($(".wrapper-form-busca").removeClass("wrapper-fixed"),$(".wrapper-form-busca").removeClass("active"))});
</script>

<script type="text/javascript">

$(document).ready(function(){
  $('#busca-hidden-mensagem').on('click',function(){
     $(".wrapper-form-busca-hidden").hide();
     $('.wrapper-form-busca').show(500);
     $('.wrapper-form-busca').addClass('wrapper-fixed');
     $('.wrapper-form-busca').addClass('active');
  })


});
</script>


<!-- form-busca -->
<div style="display:block;" class="wrapper-form-busca">

  <!-- container -->
  <div class="container-fluid">

      <!-- form-wrapper -->
      <div class="form-busca-local-wrapper">
    
        <c:url var="busca" value="/busca/buscaRequest" />
        <!-- form -->
        <form:form action="${busca}" method="POST">
          <!-- info -->
          <div class="form-busca">
            <label for="input-busca" class="form-busca-label">Buscar</label> 
            <input id="input-busca" type="text" class="form-control form-busca" value="${stringBusca}" name="busca" placeholder="O que você está procurando?">
          </div>
          <!-- fim info -->

          <!-- local -->
          <div class="form-local">
            <label for="input-local" class="form-local-label">Local</label> 
            <input id="input-local" type="text" class="form-control form-local" value="${stringLocal}" name="local" placeholder="Asa sul, Guará, etc">
          </div>
          <!-- fim local -->

          <!-- botao -->
          <div class="form-botao">
            <button type="submit" class="btn btn-default btn-busca">
              Buscar <span class="glyphicon glyphicon-search"></span>
            </button>
          </div>
          <!-- fim botao -->
        </form:form>
        <!-- fim form -->

      </div>
      <!-- fim form-wrapper -->
  </div>
  <!-- /container -->
</div>
<!-- fim form-busca -->

<!-- form-busca -->
<div class="wrapper-form-busca-hidden">
       <div id="busca-hidden-mensagem">
       	<div class="busca-hidden-mensagem-clique"></div>
      </div>
</div>
<!-- fim form-busca -->