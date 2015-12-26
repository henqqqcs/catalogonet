<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">ESQUECI MINHA SENHA</h4>
      </div>
      <!-- form -->
      <c:url var="esqueciSenhaHandle" value="/esqueci-senha-handle"/> 
      <form action="${esqueciSenhaHandle}" method="POST" id="formEsqueciSenha">
        <div class="modal-body">
        
			<div id="message"></div>
        
          <p>Digite abaixo seu e-mail com que se cadastrou e receba sua senha por e-mail.</p>
          <div class="form-item-wrapper">
            <label for="emailEsqueciSenha">Email</label>
            <input class="form-control" name="emailEsqueciSenha" id="emailEsqueciSenha" type="email" id="emailEsqueciSenha" placeholder="seu@email.com">
          </div>
        </div>
        <div class="modal-footer">
          <button style="float:left;" type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Fechar <span class="glyphicon glyphicon-remove"></span></button>
          <button type="submit" class="btn btn-default" id="submitEsqueciSenha">Enviar <span class="glyphicon glyphicon-play"></span></button>
        </div>
      </form>
      <!-- fim form -->
    </div>
  </div>
</div>
<!-- fim modal -->
</div>

<script type="text/javascript">
    $(document).ready(function() {
    $('#submitEsqueciSenha').click(function(e) {
    e.preventDefault();
    var ajaxdata = $("#emailEsqueciSenha").val();
    var value ='emailEsqueciSenha='+ajaxdata;
 
   $.ajax({
   url: "esqueci-senha-handle",
   type: "post",
   data: value,
   cache: false,
   success: function(data) {
	   $("#country").val('');
	   $("#message").html('Sua senha foi enviada para seu email!').slideDown('slow');
	   $("#message").addClass("alert alert-success" );
   },
   error: function(data) {
	   $("#country").val('');
	   $("#message").html('Este email não está cadastrado!').slideDown('slow');
	   $("#message").addClass( "alert alert-danger" );
   }
   });
});
});
</script>
