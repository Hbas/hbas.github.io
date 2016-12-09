---
layout: codigolimpo/exercises
---
{% include codigolimpo/assessment4.md %}

<!-- Button trigger modal -->
<button type="button" class="btn btn-brown btn-lg btn-block btn-confirmation" data-toggle="modal" data-target="#confirmTrial">
  Fiz o exercício acima
</button>

<!-- Modal -->
<div class="modal fade" id="confirmTrial" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form action="class4.html">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Confirmação de aprendizado</h4>
        </div>
        <div class="modal-body">
          <p>Por favor, confirme que você realmente fez os exercícios desta página, digitando o texto abaixo (sem as aspas):</p>
          <p class="confirmation">"<span id="expectedText">Fiz os exercícios de auto-avaliação do módulo de comentários</span>"</p>
          <input type="text" id="confirmationField" class="form-control"></input>
        </div>
        <div class="modal-footer">        
            <input type="submit" id="nextLesson" class="btn btn-green" disabled="disabled" value="Próxima lição"></input>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  $("#confirmationField").on('input propertychange paste', function (){
    var textOk = $("#confirmationField").val() === $("#expectedText").text();
    $("#nextLesson").prop('disabled', !textOk);
  });
</script>
