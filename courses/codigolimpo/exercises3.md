---
layout: codigolimpo/exercises
---

{% include codigolimpo/exercises3.md %}

<!-- Button trigger modal -->
<button type="button" class="btn btn-brown btn-lg btn-block btn-confirmation" data-toggle="modal" data-target="#confirmTrial">
  Já fiz os exercícios acima. Gostaria de seguir para o próximo assunto
</button>

<!-- Modal -->
<div class="modal fade" id="confirmTrial" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form action="assessment4.html">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Confirmação de aprendizado</h4>
        </div>
        <div class="modal-body">
        <p>Por favor, confirme que você realmente fez os exercícios desta página, digitando o texto abaixo (sem as aspas). Esta é sua última chance para praticar um pouco mais esse assunto antes de seguir para a próxima lição.</p>
          <p class="confirmation">"<span id="expectedText">Fiz os exercícios do módulo de revisão de código com minha dupla</span>"</p>
          <input type="text" id="confirmationField" class="form-control" />
        </div>
        <div class="modal-footer">
            <input type="submit" id="nextLesson" class="btn btn-green" disabled="disabled" value="Seguir para o próximo assunto" />
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
