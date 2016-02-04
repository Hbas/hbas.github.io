---
layout: codigolimpo/lesson
---

<div class="lessonHeader" style="background-image: url('/static/codigolimpo/atolado.jpg')">
  <blockquote>
    <p>"There are some people who have trouble recognizing a mess."</p>
    <small>Bill Cosby</small>
  </blockquote>
</div>

Neste módulo, vamos tratar de comentários. Tenho a mesma opinião que muitos dos assinantes do [Manifesto Ágil](http://manifestoagil.com.br/){: target="ref" } e do [Manifesto pelo Software de Qualidade](http://manifesto.softwarecraftsmanship.org/){: target="ref" }: o uso correto de comentários é quando **falhamos** em expressar nossas intenções através de código.

Reforço o ponto que *um código comentado é uma falha*. Usamos comentários em nosso código porque nem sempre temos capacidade, conhecimentos ou tempo de fazer um código limpo. Escrevemos uma classe ou um módulo e achamos ele confuso. Nossos colegas reclamam. "Tá, eu vou comentar", você responde... Não! Não faça isso!

Ao invés de passar tempo explicando a confusão que você fez, passe esse mesmo tempo limpando seu código.
{: .emphasis}

Sou tão chato com comentários porque já experimentei na pele suas limitações. Nada atrapalha tanto quanto um comentário desatualizado.
Já outras pessoas pregam o uso de comentários o tempo todo, mesmo que eles sejam inúteis, que só façam "encher linguiça" como o código abaixo:

~~~~~~
/**
 * Gets the name
 * @@return the name
 */
public String getName() {
  return this.name;
}
~~~~~~

Então quer dizer que o método "getName" retorna o nome? Sério? De tão inúteis, esses comentários podem até ser [gerados automaticamente](http://submain.com/products/ghostdoc.aspx){: target="ref" }. Assim, da próxima vez que lhe exigirem que *todos* os métodos sejam comentados, procure uma ferramenta e coloque ela para "trabalhar" por você.

Toda essa discussão sobre comentários acontece pois, na prática, no mundo real, programadores não conseguem manter os comentários atualizados. Algumas pessoas dizem que isso é porque eles não fazem o trabalho corretamente. Segundo essas pessoas, eles devem ser disciplinados e manter os comentários sempre atualizados e relevantes.

Na minha opinião, ao invés de gastar esforço com isso, por que não redirecionar esse tempo e energia para tornar o código tão limpo e expressivo que não seja necessário comentar? Como vimos nos módulos anteriores deste curso, um bom código é auto-explicativo. Ele é formado por bons nomes, suas funções e métodos são lidas como um texto, como uma redação.

Como vocês viram ao fazer os exercícios dos módulos passados, vocês conseguem escrever um código **limpo**. Na maioria dos casos, foi apenas uma questão de criar uma função que diga a mesma coisa que estaria no comentário. Assim, o código que vocês fizeram não precisou de comentários!

Dito isto, considero que existem 3 situações em que comentários são úteis e necessários:

  1. Para colocar a licensa de uso e/ou copyright no começo de cada arquivo/classe;
  1. Para colocar *//TODO*, atividades pendentes e instruções para outros programadores; e
  1. Em APIs e bibliotecas públicas, onde os criadores não fazem parte da equipe/empresa que vai utilizar a biblioteca/API e, por causa disso, descrevem na forma de JavaDocs (ou similares) a arquitetura/intenções das classes e métodos criados, além do uso correto e esperado destes elementos.

  Eu poderia dar diversos exemplos de mal uso dos comentários ou do quanto eles atrapalham. No entanto, prefiro mostrar isso na prática. Assim, vamos aos exercícios:

 <a href="exercises4.html" class="btn btn-green btn-block spaced">//Quando escrevi esse comentário, este botão não fazia nada</a>
