---
layout: codigolimpo/lesson
---

<div class="lessonHeader" style="background-image: url('/static/codigolimpo/header2.jpg')">
  <blockquote>
    <p>"The proper function of a man is to live, not to exist. I shall not waste my days in trying to prolong them. I shall use my time."</p>
    <small>Jack London</small>
  </blockquote>
</div>

Neste módulo vamos tratar de funções, métodos, rotinas. Aqui temos uma citação falando da função de uma pessoa, que, pro autor, vai além do que ele chama de “existir” e passa a ser o que ele chama de “viver”.

Pra começarmos esse módulo, gostaria que você refletisse sobre a “função das funções” em um programa. Para que elas servem e, por consequência, o que são boas funções/rotinas?

Se seguirmos a definição da [Wikipedia](http://pt.wikipedia.org/wiki/Sub-rotina){: target="ref" }, as funções servem para resolver **um** problema **específico**, parte de um problema maior.

A questão do tamanho
{: .lessonSection}

Assim, a primeira coisa que vamos discutir neste módulo tratando de métodos e funções é o tamanho delas.

E em questão de tamanho, os orientais são famosos entre as mulheres. Como dizem os japoneses e chineses, o ideal é que o método seja pequeno.

O raciocínio deles é que *"não existe essa de que a coisa é pequena demais"*.
{: .emphasis}

<img src="/static/codigolimpo/chineses.jpg" class="img-responsive center-block" alt="Soldados chineses" />

Assim, não há problemas em escrevermos muitos métodos, cada vez menores. Como diz [Robert C. Martin](http://en.wikipedia.org/wiki/Robert_Cecil_Martin){: target="ref" }, você deve extrair métodos e variáveis cada vez mais, até que você não consiga mais separar um conteúdo relevante. Métodos com apenas 1 ou 2 linhas são **bons**!

A chave, sempre, é deixar cada método, cada função, fazendo uma coisa e só uma coisa. Assim, terminamos criando muitos métodos pequenos de até 5 linhas e pouquíssimos grandes com 20-50 linhas. Métodos com 100, 200 linhas estão absolutamente fora de cogitação.

Vamos detalhar isso... Para isso, gostaria de começar traçando um paralelo com um jornal. Eu tenho alguns amigos jornalistas e eles me chamaram atenção para algumas coisas.

Escrevendo um artigo para um jornal
{: .lessonSection}

Em um jornal impresso, temos sempre uma manchete. Em seguida temos um [“lead”](http://pt.wikipedia.org/wiki/Lead){: target="ref" }, o primeiro parágrafo do texto jornalístico que carrega o conteúdo mais denso da matéria, as principais informações. Em seguida, podemos visualizar os detalhes, as fontes, as citações. Em um jornal, de forma geral, temos muitas matérias pequenas e poucas grandes.

Isso é exatamente o que queremos fazer no nosso código:

| No jornal | No código fonte |
|-----|-----|
| A manchete | A assinatura do método |
| A sinopse no primeiro parágrafo [(lead)](http://pt.wikipedia.org/wiki/Lead){: target="ref" } | O método público |
| Detalhes, números, depoimentos | Os métodos privados |
| Muitos artigos menores, poucos grandes | Muitos métodos pequenos, quase nenhum grande |
| Melhor se for escrito do mais geral para o mais concreto | Melhor se for escrito do mais geral para o mais concreto |
{: .table .table-striped .table-bordered .centered}

Assim, numa abordagem [top-down](http://en.wikipedia.org/wiki/Top-down_and_bottom-up_design), começamos escrevendo a assinatura do método principal que motivou a criação daquela classe.

Em seguida, vamos escrevendo este método público, criando apenas as assinaturas dos métodos privados que precisamos. Neste passo, é muito importante a leitura do código, como se ele fosse um texto.

Por fim, só depois de terminarmos de escrever o conteúdo do método público, de mais alto nível, implementamos aqueles métodos privados, com os detalhes, seguindo o mesmo processo.

Um só nível de abstração
{: .lessonSection}

Bom, para ajudar neste processo de criar métodos como um jornal, vamos analisar o [Exercício 2.1](assessment2.html). As funções deste problema estão confusas, certo? Considerando o que vimos acima, você saberia dizer por que?

Porque, dentro da mesma função, estamos vendo níveis de abstrações diferentes!
{: .emphasis}

O problema está no fato de que esse código não segue a estrutura do jornal. As funções não fazem uma única coisa. Ele não é lido como uma narrativa top-down. Devemos codificar como se estivéssemos descrevendo nossas funções, explicando o que elas fazem e usando o mesmo nível de abstração para cada método...

O que são esses níveis de abstração que eu menciono? Vamos ver com um exemplo usando o [crivo de Eratóstenes](http://pt.wikipedia.org/wiki/Crivo_de_Erat%C3%B3stenes){: target="ref" }:

  1. Verifique que o número desejado é positivo
  1. Crie um array com o tamanho do maior número a ser avaliado (limite)
  1. Retire todos os múltiplos de 2
  1. Procure o proximo inteiro não marcado e, deixando ele, marque todos os seus múltiplos
  1. Repita o passo 3 até que você tenha passado da raiz quadrada do maior valor

Esta aqui é uma descrição de “alto nível” do crivo de eratóstenes em português. Como devemos implementar um método que faz isso?

Seguindo a metáfora do jornal, o primeiro passo é criar um método público na classe que vai ser responsável pelo crivo. Este método deve ter um bom título, ou seja, um bom nome. Ele deve ser o “lead”, o resumo de alto nível e, portanto, ele apenas deve descrever os passos do crivo que vimos acima:

~~~~~~
public int[] GeneratePrimes(int maxValue)
{
  Validate(maxValue);
  AllocateNumberArrayWith(maxValue);
  CrossOutMultiplesOf(2);
  CrossOutMultiplesOfThePrimes();                
  return UncrossedIntegers();
}
~~~~~~
{: .prettyprint}

Vamos ler esse método, em voz alta, como um texto:

**Gerar Primos:**

  1. Valide o maior valor
  1. Aloque um array de números com o maior valor
  1. Risque os multiplos de 2
  1. Risque os multiplos dos primos
  1. Retorne os inteiros não marcados

Muito fácil de entender, não? Percebam que estamos fazendo aqui a “receita do bolo” mas que ainda deixamos vários detalhes em aberto. Como validamos o input? Como "riscamos" os múltiplos dos primos? Como colocamos os inteiros desmarcados no array de retorno? Tudo isso é feito pelas funções de mais baixo nível.

Seguindo nossa metáfora do jornal, aquele método público foi o “lead” da matéria. O resumo. O essencial.

O resumo pode (e deve) deixar algumas coisas em aberto. Assim, nosso próximo passo é implementar o restante. Os detalhes estão em cada um desses métodos privados, que podem (ou não) chamar métodos de mais baixo nível ou APIs externas.

~~~~~~
private void CrossOutMultiplesOfThePrimes()
{
  int limit = this.IterationLimit;
  for (int i = 3; i <= limit; i++) {
    if (NotCrossed(i)){
      CrossOutMultiplesOf(i);
    }
  }
}
~~~~~~
{: .prettyprint}

Acima está um exemplo de implementação de um dos métodos privados. Percebam que apesar dele ser de mais “baixo nível” que o *GeneratePrimes*, ele chama outros métodos de mais baixo nível ainda:

~~~~~~
private bool NotCrossed(int number)
{
   return !this.crossedOut[number];
}

private void CrossOutMultiplesOf(int number)
{
  for (int i = number + number; i < this.IterationLimit; i += number){
    crossedOut[i] = true;
  }
}
~~~~~~
{: .prettyprint}

O menor nível de abstração termina quando realmente fazemos as operações. Neste exemplo, apresentamos três níveis de abstração para as funções. Dependendo da complexidade do que se quer fazer, este número pode ser maior ou menor.

Pausa para reflexão
{: .lessonSection}

Ainda temos mas coisas para ver deste assunto, mas sugiro que você dê uma pausa agora. Reveja sua solução para o [Exercício 2.1](assessment2.html) ou, melhor ainda, algum código que você tenha escrito recentemente para a faculdade ou para o trabalho.

Seu código está seguindo o que explicamos acima? Ele está claro, legível como um jornal e cada método está num só nível de abstração?

Escrever software é como qualquer tipo de escrita. Quando estamos escrevendo da primeira vez, "passamos para o papel" nossos pensamentos e eles normalmente saem longos, com nomes ruins e métodos complicados. O segredo é não parar por aí. Precisamos reler, rever, reescrever. Dividir funções, renomear variáveis, eliminar duplicações, reordenar métodos, criar novas classes, novos métodos.

No final, devemos terminar com um código limpo. Não precisamos, no entanto, escrever todo código já correto e simples "de primeira". Precisamos, sim, arrumá-lo/refatorá-lo antes de considerá-lo "pronto".

<a href="class2-2.html" class="btn btn-green btn-block spaced">Módulo 2, parte 2.</a>
