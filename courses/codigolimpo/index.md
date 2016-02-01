---
layout: codigolimpo/lesson
---

<div class="lessonHeader" style="background-image: url('/static/codigolimpo/desembarque.jpg')">
  <blockquote>
    <p>"You are about to embark upon the Great Crusade, toward which we have striven these many months."</p>
    <small>Dwight D. Eisenhower</small>
  </blockquote>
</div>

Olá pessoal, bem-vindos ao curso de *Código Limpo: Direto das Trincheiras*. Estamos aqui hoje para falar de uma guerra que aflige muitas empresas de software do mundo. **A Guerra do software**.

Ela começa de um jeito bem típico. Uma necessidade por um novo sistema ou alguma mudança em um sistema existente. Mas ela vem combinada à inexperiência e, no pior dos casos, desleixo e um prazo apertado.

Mesmo assim, a maioria dos programadores são verdadeiros **heróis**. *Nós entregamos.*
{: .emphasis}

Aqui trazemos um exemplo de uma demanda de software. Para fins didáticos, nos restringimos a uma única função em Javascript. Só reforçando, ela faz *exatamente* o que foi pedido. Ela funciona, sem nenhum defeito conhecido.

Funciona, então deixa quieto. Certo? Prestem bastante atenção nesta função. O que ela faz?

<a id="funcaoJavascript"></a>

~~~~~~
function s (a, b) {
  var c = a - b;
  var aux = b * b + a * 5;
  if (0 == c)
    return a * 2;
  else if (!a)
    return b;
  else if (b == 0)
    return a;
  else
    return b + a;
}
~~~~~~
{: .prettyprint}

<div class="largeSpace"></div>

Como muitos podem ter percebido, a função acima simplesmente **soma 2 números**.

"Funciona... Deixa quieto..."
{: .emphasis}

Deixar as coisas do jeito que estão seria certo se ninguém nunca mais tocasse naquele código, se ele realmente não tiver nenhum defeito e se você não quiser ter orgulho do que faz. Fim da guerra, podemos voltar pra casa tranquilos.

Mas, no mundo real, a guerra continua. Requisitos surgem, mudam, são retirados. Defeitos são encontrados. O código **tem** que ser mantido.
{: .emphasis}

<img src="/static/codigolimpo/bombaNuclear.jpg" class="img-responsive center-block" alt="Deixa quieto?" />


Assim, as gambiarras são feitas, novos defeitos surgem, são corrigidos, o prazo chega, o prazo passa, você tem que trabalhar horas extras, você se esforça mais e mais.

<img src="/static/codigolimpo/programador1.jpg" class="img-responsive center-block" alt="Guerra de Programador - Parte 1" />
<img src="/static/codigolimpo/programador2.jpg" class="img-responsive center-block" alt="Guerra de Programador - Parte 2" />

Então... Como resolver? Vamos **declarar guerra ao código ruim**. Vamos batalhar pelo código limpo, dentro do prazo e do escopo pedido.

Este curso tem como meta ajudar nesta luta.

Assim, os objetivos deste curso são:

  1. Reconhecer o código ruim, desde o início
  1. Aumentar a produtividade: Reduzir o tempo de manutenção, evolução e debug nos projetos de software
  1. Realmente saber “Orientação a Objetos”
  1. Melhorar seu código, sua carreira e, quem sabe, sua qualidade de vida.

<div class="row spaced">
  <div class="col-xs-6">
    <img src="/static/codigolimpo/alvo.jpg" class="img-responsive center-block" alt="Alvo: Código ruim" />
  </div>
  <div class="col-xs-6">
    <img src="/static/codigolimpo/praticandoTiro.jpg" class="img-responsive center-block" alt="Tiro" />
  </div>
</div>

Sobre as aulas
{: .lessonSection}

Nossas aulas serão majoritariamente on-line, através deste site, e o aprendizado se dará principalmente através da resolução de exercícios individuais e da revisão de código com colegas.

Para cada unidade, começaremos com um exercício de auto-avaliação sobre o tópico. Você deve buscar, sozinho ou com colegas, aprender o necessário para resolver o problema com a maior qualidade possível e, individualmente, resolver e enviar este exercício para o professor-tutor por e-mail ou através de ferramentas como o Github. Por se tratar apenas de uma auto-avaliação, independente da qualidade do código nesta primeira etapa, seu instrutor irá liberar seu acesso a lição.

Com isso, você terá acesso a um texto e/ou vídeo explicando o assunto, bem como a um conjunto maior de exercícios. Você deve aprender o conteúdo, realizar individualmente estes novos exercícios, revisar os exercícios de auto-avaliação, e enviar tudo novamente.

Após o segundo envio, o professor-tutor irá corrigir o material recebido e lhe dar feedback, solicitando melhorias. Dependendo do caso, o professor-tutor pode liberar seu acesso a exercícios complementares (extras) de algum assunto ou unidade. Apenas quando o professor-tutor avaliar que o conteúdo foi *realmente apreendido* por você é que você deve acessar a próxima unidade.

Durante todo o curso, um forum / lista de e-mails estará disponível. Além disso, ocasionalmente, o professor-tutor irá agendar reuniões presenciais ou reuniões on-line (através de ferramentas como Skype e/ou GTalk) para a discussão de assuntos, resolução sincrona de dúvidas e compartilhamento de informações.

Abaixo, exibimos a ementa deste curso:

**Ementa**
{: .close-to-bottom}

  1. A Batalha dos Nomes (Como colocar nomes de métodos, classes, etc)
  1. A Busca da Função (Como fazer métodos e funções legíveis)
  1. Companhia (Breve introdução ao pair-programming e a revisão de código)
  1. A Morte dos Comentários (Quando usar e quando não usar comentários)
  1. A Luta de Classes (Como dividir responsabilidades/conceitos)
  1. O Princípio da Solidez (Os princípios de design S.O.L.I.D.)
  1. Melhoria contínua e próximos passos (Breve introdução ao Refactoring e TDD)
  1. Projeto de conclusão (Open-Source)    

<a href="assessment1.html" class="btn btn-green btn-block spaced">Que comecem as batalhas!</a>
