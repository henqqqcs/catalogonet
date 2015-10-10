<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<script type="text/javascript">
    $(document).ready(function() {
    $('#emailSubscribeBtn').click(function(e) {
    e.preventDefault();
    var ajaxdata = $("#emailSubscribe").val();
    var value ='emailSubscribe='+ajaxdata;
 
   $.ajax({
   url: "newsletter-subscribe-handle",
   type: "post",
   data: value,
   cache: false,
   success: function(data) {
	   $("#country").val('');
	   $("#messageSubscribe").html('Pronto! Seu email foi cadastrado').slideDown('slow');
	   $("#messageSubscribe").addClass("alert alert-success" );
   },
   error: function(data) {
	   $("#country").val('');
	   $("#messageSubscribe").html('Ops! Este email está correto?').slideDown('slow');
	   $("#messageSubscribe").addClass( "alert alert-danger" );
   }
   });
});
});
</script>

<div class="clearfix"></div>

      <footer id="footer">

        <!-- container -->
        <div class="container">

          <!-- social share icons -->
          <div class="footer-social-icons">
          	<c:url var="facebook" value="/resources/publico/imagens/facebook-icon.png" /> 
            <a target="_blank" href="#"><img class="footer-social-item" src="${facebook}" alt="facebook-icon" /></a>
          	<c:url var="twitter" value="/resources/publico/imagens/twitter-icon.png" /> 
            <a target="_blank" href="#"><img class="footer-social-item" src="${twitter}" alt="twitter-icon" /></a>
          	<c:url var="google" value="/resources/publico/imagens/google-plus-icon.png" /> 
            <a target="_blank" href="#"><img class="footer-social-item" src="${google}" alt="google-plus-icon" /></a>
          </div>
          <!-- fim social share icons -->

          <!-- footer-contato -->
          <div class="footer-contato">
            <p class="rodape-titulo">Contato</p>
            <div class="footer-content">
              <p class="rodape-item"><strong>Telefone:</strong></p>
              <p class="rodape-item">(23) 2343-2342 </p>
              <p class="rodape-item"><strong>Email:</strong></p>
              <p class="rodape-item">contato@catalogonet.com.br </p>
              <br>
              <p class="rodape-item"><button type="submit" class="btn btn-primary">Entre em contato!</button></p>
            </div>
          </div>
          <!-- fim footer-contato -->

          <!-- footer-info -->
          <div class="footer-info">
            <p class="rodape-titulo">Para Você</p>
            <div class="footer-content">
              <p class="rodape-item"><a href="#">Divulgue seu negócio</a></p>
              <p class="rodape-item"><a href="#">Entre em contato</a></p>
              <p class="rodape-item"><a href="#">Registre-se</a></p>
              <p class="rodape-item"><a href="#">Login</a></p>
            </div>
            <p class="rodape-titulo">Trabalhe Conosco</p>
            <div class="footer-content">
              <p class="rodape-item"><a href="#">Trabalhe conosco</a></p>
            </div>
          </div>
          <!-- fim footer-info -->

          <!-- footer-payment -->
          <div class="footer-payment">
            <p class="rodape-titulo">Receba novidades e promoções</p>
            <div class="footer-content">
              <div id="messageSubscribe"></div>
              <c:url var="subscribeUrl" value="/newsletter-subscribe-handle" />
              <form action="${subscribeUrl}" method="POST">
                <input class="form-control"  id="emailSubscribe" name="emailSubscribe" placeholder="seu@email.com" />
                <button type="submit" id="emailSubscribeBtn" class="btn btn-primary btn-block">Quero Receber!</button>
              </form>
            </div>

            <p class="rodape-titulo">Este site aceita</p>
            <div class="footer-content">
              <div class="footer-payment-box">
              	<c:url var="pagseguroRodape" value="/resources/publico/imagens/pagseguro-rodape.png" /> 
                <img src="${pagseguroRodape}" alt="pagseguro-icon" />
              	<c:url var="paypalRodape" value="/resources/publico/imagens/paypal-rodape.png" /> 
                <img src="${paypalRodape}" alt="paypal-icon" />
              </div>
            </div>
          </div>
          <!-- fim footer-payment -->

          <div class="clear"></div>

      </div>
      <!-- fim container -->

    </footer>