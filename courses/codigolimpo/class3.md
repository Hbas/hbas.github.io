---
layout: codigolimpo/lesson
---

<div class="lessonHeader" style="background-image: url('/static/codigolimpo/colaboracao.jpg')">
  <blockquote>
    <p>"Training often gives people solutions to problems already solved. Collaboration addresses challenges no one has overcome before."</p>
    <small>Marcia Conner</small>
  </blockquote>
</div>

Neste módulo vamos tratar de revisões de código. Atualmente, as maneiras mais comuns de revisar código nas empresas de TI são através de revisões informais, revisões formais e pair-programming.

Antes de detalharmos estes 3 tipos de revisões, no entanto, vamos começar pelos objetivos de todas elas:

  - Difundir conhecimentos e habilidades;
  - Encontrar problemas no sistema, como defeitos, baixa performance e alto consumo de memória, com uma boa relação custo-benefício; e
  - Descobrir oportunidades de refatoração/clarificação do código-fonte.

Revisão informal (ou 'vê isso aqui, por favor')
{: .lessonSection}

Revisões informais de código são normalmente feitas como parte do desenvolvimento de software e da rotina diária das pessoas envolvidas. Normalmente, correspondem as revisões feitas quando um colega solicita, podendo ser feitas com os dois desenvolvedores lado-a-lado (chamadas de "walkthrough") ou através de uma solicitação por e-mail diretamente entre os envolvidos.

Em projetos que fazem apenas revisões informais, normalmente não há nenhuma visibilidade para a gerência de quais artefatos foram revisados, a quantidade/qualidade dos defeitos encontrados e nenhuma obrigatoriedade de que esta revisão seja feita, ficando a cargo da vontade e iniciativa das pessoas.

No entanto, se as revisões informais forem feitas na frequencia correta e mantidas mesmo em momentos de stress, tornam-se uma das maneiras mais eficientes e baratas de atingir todos os 3 objetivos citados acima.

Revisão de código formal
{: .lessonSection}

A revisão formal parte do que é feito em revisões informais e leva a um passo além. Numa revisão formal, há, naturalmente, papéis e passos definidos a serem seguidos.

**Papéis:**

  - **Autor**: A pessoa que criou o artefato (código, documento, etc) a ser revisado.
  - **Moderador**: A pessoa que irá planejar e coordenar a inspeção. Usualmente, é o próprio autor ou um líder técnico.
  - **Leitor**: A pessoa que irá mostrar o(s) artefato(s) a serem inspecionados, passando por cada parte, e pedir que as pessoas comentem/avaliem aquele pedaço. Idealmente, o leitor *não* é o autor do artefato.
  - **Escritor**: A pessoa que irá anotar (registrar) os problemas encontrados.
  - **Participante**: Todos os participantes da reunião, incluindo os presentes nos papeis acima.

**Passos:**

  - **Planejamento**: O moderador deve escolher as pessoas que irão participar, combinar o horário que a inspeção vai ser realizada e distribuir os artefatos a serem inspecionados
  - **Preparação**: Individualmente, cada participante analisa os artefatos, tomando nota dos defeitos encontrados.
  - **Reunião de Inspeção**: Nesta reunião, todos os participantes se juntam e o leitor vai apresentando um a um os artefatos. A medida em que ele vai apresentando, os participantes vão fazendo comentários e apontando problemas, enquanto o escritor registra.
  - **Retrabalho**: Após a reunião, o autor busca soluções para os problemas encontrados e corrige os artefatos.
  - **Checagem**: Por fim, outra pessoa verifica se os itens levantados foram corretamente corrigidos.
{: .justify}

É possível encontrar facilmente várias [dicas, explicações e sugestões](http://smartbear.com/SmartBear/media/pdfs/best-kept-secrets-of-peer-code-review.pdf){: target="ref" } sobre revisões na internet. Além dessas, gostaria de compartilhar com vocês alguns pontos que eu vivi pessoalmente:

  - Adote uma postura crítica e procure problemas com o artefato, não com a pessoa (autor). Lembre-se dos objetivos da revisão!
  - Faça mais de uma passagem pelo código, focando em uma área/objetivo/conjunto possível de problemas a cada passagem.
  - Tenha um checklist, com os erros mais comuns, e mantenha ele atualizado, acrescentando e removendo itens

Tendo participado de algumas revisões formais, pessoalmente acredito que suas principais vantagens em relação a revisão informal são sua maior consistência, frequência e visibilidade, já que a geração de documentos e outras evidências trás uma maior cobrança por parte da gerência para que as revisões sejam feitas, além de permitir que a equipe de testes e/ou o cliente não considerem o sistema como "pronto" sem essa revisão.

Em compensação, usualmente há maiores custos e, às vezes, até desperdício de tempo, principalmente pela necessidade de reunir várias pessoas simultaneamente, pelo esforço de documentar o que foi feito durante a revisão e pela própria "formalidade" do processo. Para evitar esse tipo de problema, ferramentas mais modernas, como o [Git Lab](https://about.gitlab.com/){: target="ref" }, [Gerrit](https://code.google.com/p/gerrit/){: target="ref" }, [Review Board](http://www.reviewboard.org/){: target="ref" } e o [Crucible](https://www.atlassian.com/software/crucible/overview){: target="ref" } auxiliam o processo de revisão de código e podem deixá-lo assincrono.

Pair programming
{: .lessonSection}

E se, ao invés de esperar algumas horas/dias para fazer uma revisão de código, esperarmos apenas alguns segundos? E se a pessoa estiver do seu lado?

Pair programming é uma técnica de desenvolvimento de software utilizada em projetos ágeis onde 2 programadores trabalham juntos em uma única máquina.

Um programador, chamado de **piloto**, digita o código-fonte e se preocupa com aspectos mais imediatos, como o que ele está fazendo agora, erros de digitação e se o código está compilando. Enquanto isso, o outro programador, chamado de **navegador** revisa o código sendo digitado e, além de ajudar, se preocupa mais em considerar apectos "estratégicos" como melhorias, problemas futuros e quais serão os próximos passos.

Uma maneira muito interessante de fazer pair programming, é combiná-la com a prática do [TDD](http://desenvolvimentoagil.com.br/xp/praticas/tdd/){: target="ref" } no que é chamado de *ping-pong pair programming*:

**Ping-pong Pair Programming**

  1. A primeira pessoa (A) escreve um novo teste unitário e verifica que ele falha.
  1. A segunda pessoa (B) implementa o código necessário para aquele teste e todos os anteriores passarem.
  1. "A" refatora o código.
  1. "B" refatora o código.
  1. "B" escreve um novo teste unitário e verifica que ele falha.
  1. "A" implementa o código necessário para aquele teste e todos os anteriores passarem.
  1. "B" refatora o código.
  1. "A" refatora o código.
  1. Repita, retornando ao passo 1, até que todas as funcionalidades tenham sido escritas



 <a href="exercises3.html" class="btn btn-green btn-block spaced">Ok, vamos praticar!</a>
