---
layout: codigolimpo/lesson
---

<div class="lessonHeader" style="background-image: url('/static/codigolimpo/header1.jpg')">
  <blockquote>
    <p>"The beginning of wisdom is to call things by their right names."</p>
    <small>Chinese proverb</small>
  </blockquote>
</div>

Vamos começar o nosso curso falando de nomes. Como diz o provérbio chinês, o primeiro passo para a sabedoria é chamar as coisas pelos nomes corretos.

Em programação, isso não é diferente. A grande maioria dos caracteres que lemos num código-fonte são nomes.

Variáveis, métodos, argumentos, classes, pacotes, projetos. Todos têm nomes. São esses nomes que comunicam o que estamos fazendo, que permitem que um sistema seja mantido e estendido. Por causa disso, é muito importante que os nomes sejam claros e bem escritos. Nesta parte do curso, reforçaremos este ponto e daremos algumas dicas para ajudar vocês a colocarem bons nomes.

## 10 passos para um nome melhor
{: .lessonSection}

*1. Invista tempo*
{: .lessonSection}

É fácil dizer que nomes são importantes. O que eu gostaria de reforçar com vocês é que eles são **muito** importantes. As vezes, não queremos passar 20 segundos pensando num nome. *20 segundos*.

Vejam nos exercícios o que isso causa. Tudo que está ruim aí, está assim apenas porque quem escreveu esse código não quis parar para pensar.

Frequentemente, não sabemos o que colocar. Nestes casos, peço que vocês **se esforcem**. Não precisam (nem devem) passar, literalmente, meia hora pensando num nome de variável. Comecem com um passo simples...


*2. Pensem no propósito*
{: .lessonSection}

Expliquem para si mesmos, para o colega ou para um [rubber duck](http://en.wikipedia.org/wiki/Rubber_duck_debugging){: target="ref" } por que essa variável/método/classe existe. O que ela significa? Por que ela foi criada? O que ela faz? Como é usada?

Se um nome que você escreveu precisa de uma conversa, uma frase ou um comentário para ser explicado, você encontrou seu ponto de partida:

~~~~~~
int d; // (um comentário explicando a variável)
~~~~~~

*3. Não deixem implícito*
{: .lessonSection}

Escrever (ou mais frequentemente pensar) num comentário que explicaria a variável é apenas o ponto de partida:

~~~~~~
int d; //número de dias no mês
~~~~~~

O problema do código com a variável *"d"*, acima, não é que ele está confuso ou que falte informação. É a informação que não faz parte da variável.

Se tirarmos o comentário, a informação fica apenas **implícita** no código. Todos os dias, milhares de programadores deixam informações implícitas para os colegas ou, frequentemente, para eles mesmos quebrarem a cabeça tentando entender depois.

Vejam o problema da informação implícita no [Exercício 1.1](assessment1.html){: target="exerc" }. O código é bem razoável, não tem expressões complexas, tem poucas variáveis, não tem truques exóticos de sintaxe, não tem código alinhado, está tudo formatado...

A solução para este problema está em renomear as variáveis para elas mostrarem a informação explicitamente. Veja abaixo:

~~~~~~
int d; //número de dias no mês

int daysInMonth; //comentário desnecessário
~~~~~~

*4. Faça distinções*
{: .lessonSection}

Outro ponto bastante importante é fazer distinções entre as variáveis.

Números após os argumentos, por exemplo, não são distinções suficientes. Vejam como os nomes utilizados para estes argumentos não dizem absolutamente nada sobre eles:

~~~~~~
public static void copy (int a1[], int a2[]) {
  for (int i = 0; i < a1.length; i++) {
      a2[i] = a1[i];
    }
}
~~~~~~

Qual a diferença de "a1" para "a2" ? Imagine agora a mesma função com os argumentos "source" e "destination". Bem melhor, não?

Não usem números para diferenciar variáveis. Também não usem Model, Data, Info, Object...

~~~~~~
var expectedRevenue;
var expectedRevenueModel;
var expectedRevenueData;
var expectedRevenueInfo;

class Customer { ... }
class CustomerObject { ... }
~~~~~~

Qual a diferença entre as variáveis acima? E entre as classes? Estes sufixos não dizem nada.

Também não coloquem, por exemplo, duas funções com apenas um 's' de diferença, principalmente na mesma classe. Queremos evitar enganos, deixar explícitas as diferenças.

~~~~~~
getActiveAccount();
getActiveAccounts();
~~~~~~

No código acima, o ideal é refatorar o primeiro método para *get<strong>First</strong>ActiveAcccount()*.

Por fim, nunca, em hipótese alguma, dêem o nome “variável” para uma variável. “auxiliar”, comumente encontrada em sua forma reduzida “aux”, é outro péssimo exemplo.

~~~~~~
var aux;
var variable;
var foo;
var bar;
~~~~~~

*5. Pronuncie*
{: .lessonSection}

~~~~~~
string creymdhms;
//creymdhms = creation date: year, month, day, hour, minute, and second

string modymdhms;
//modymdhms = modification date: year, month, day, hour, minute, and second
~~~~~~

Imaginem esse diálogo entre dois programadores, baseado no código acima:

 - “Cara, nesse trecho tás preenchendo crein-dimis com o ano passado?”
 - “Não pô, em modin-dimis eu botei o dia de hoje e em crein-dimis um dia antes.”

Além de evitar diálogos ridículos, colocar nomes de variáveis que sejam pronunciáveis é importante.

Programar é uma atividade social, que precisa ser explicada, discutida e revisada.
{: .emphasis}

É muito mais difícil conversar sobre uma coisa que você não consegue nem pronunciar. Usem o português ou, frequentemente, o inglês para nomear as coisas. Não usem siglas e abreviações estúpidas.

Considere que alguém renomeou essas variáveis para “dataDeCriacaoFormatada” e “dataDeModificacaoFormatada”. Muito melhor, não?

~~~~~~
if(CheckIfSomethingHasHappened()) { .. }
if(SomethingHasHappened())  { .. }
~~~~~~

Leiam o código acima em voz alta. Veja, na primeira linha, como a leitura fica ligeiramente dificultada pelo “if check if”.

O ideal é que o código se aproxime de um texto, de uma redação. O programador deve contar, para ele mesmo ou para um colega, o que ele quis fazer ali. Deve escrever sem precisar de comentários, de uma maneira que o próprio código seja formado por frases / instruções.

*6. Evite convenções ultrapassadas*
{: .lessonSection}

Hungarian Notation foi inventada pelo programador da Microsoft Charles Simonyi. Um dos projetos que Simonyi trabalhava era o Excel. No Excel (pré-histórico) haviam muitas operações feitas em cima da linha (inteiro) e da coluna (também um inteiro).

Para evitar confusões, Simonyi trabalhava com uma convenção de código que, entre outras coisas, diferenciava linhas de colunas. Pelo fato das variáveis ficarem com nomes estranhos e, como ele é Hungaro, chamaram de Hungarian Notation. Assim, na convenção dele, as variáveis eram prefixadas pelo tipo de coisa que elas significavam.

~~~~~~
int rwSelectionStart; //row
int colSelectionEnd; // column
~~~~~~

Isso era muito bom, pois sempre que se faziam operações com linhas e colunas, por exemplo, era mais visível quando se fazia uma comparação entre linhas e quando havia um erro, comparando a linha com a coluna.

~~~~~~
// Rows with rows, columns with columns
int dy = rwSelectionStart – rwSelectionEnd;
int erro = rwSelectionStart – colSelectionEnd;
~~~~~~

O problema é que o negócio pegou e ficou meio fora de controle. Tem gente hoje em dia que confunde “tipo” com "classe" e utiliza a convenção de Simonyi quando não deveria:

~~~~~~
// Hungarian Notation em Java?
string str_name;
int i_age;
~~~~~~

Quando o código é seu, é sempre preferível, ao invés de criar convenções de nomes, criar novas classes. Além de deixar o código mais legível, se a linguagem for compilada, você percebe erros antes mesmo de executar seu programa.

~~~~~~
class Column { int value; }
class Row { int value; }
~~~~~~

*7. Considere o contexto*
{: .lessonSection}

Para dar um nome significativo às nossas variáveis, às vezes temos que escrever "uma frase" como o nome da variável. Nestes anos de mercado, vi *vários* desenvolvedores com receio de deixar variáveis com nomes grandes.

**Não tem problema!**

Quanto menor o escopo da variável, mais específica ela tende a ser e, portanto, maior o nome.Dito isso, em alguns casos, há uma repetição quando usamos nomes para uma variável que correspondem a um contexto específico.

~~~~~~
int theNumberOfStudentsEnrolledInACourse;
~~~~~~

Na maioria das vezes que você estiver escolhendo o nome da sua variável, lembre-se de considerar o contexto que ela faz parte. Se você está dentro da classe Course, “enrolledStudents” ao invés de "theNumberOfStudentsEnrolledInACourse" é suficiente.

~~~~~~
public class Course {
  int enrolledStudents;
}
~~~~~~

*8. Considere usar construtores com nome*
{: .lessonSection}

Às vezes, temos muitos construtores, com muitos parâmetros. O que significa cada um dos construtores abaixo, o que são os parâmetros? Fica um pouco confuso, não?

~~~~~~
new ComplexNumber(2, 9, 4);
new ComplexNumber(4);
new ComplexNumber("4.5");
~~~~~~

Nestes casos, a solução é criar um construtor privado e utilizar métodos públicos e estáticos que representem os construtores (agora com nome) da classe.

~~~~~~
private ComplexNumber() { }

ComplexNumber.FromAPlusBI(2, 9, 4);
ComplexNumber.FromNumber(4);
ComplexNumber.FromString("4.5");
~~~~~~

*9. Use nomes do domínio*
{: .lessonSection}

~~~~~~
double multiplicacao (double d1, double d2);

double multiplicacao (double multiplicando, double multiplicador);
~~~~~~

*10. Não tenha medo*
{: .lessonSection}

O mais difícil ao escolher bons nomes é que isso requer capacidade de descrever e se comunicar. Somos de exatas, normalmente não temos muita facilidade para isso, nem somos ensinados na faculdade. Assim, é natural que a maioria dos programadores não faça isso tão bem quanto gostaríamos. No entanto, se esforcem que vocês farão isso cada vez melhor, é tudo uma questão de prática.

Uma outra coisa que já percebi foi gente com medo de colocar nomes melhores, pois não foram eles que fizeram o código e imaginam que vão atrapalhar os colegas ao modificar os nomes das coisas. Esqueçam. Ninguém costuma realmente decorar todos os nomes de classes, métodos e variáveis. Contamos com padrões de codificação e bom senso para saber os nomes das coisas que realmente importam e o auto-completar para todo o resto.

Por fim, considerem [the boy scout rule](http://programmer.97things.oreilly.com/wiki/index.php/The_Boy_Scout_Rule){: target="ref" }: sempre deixem o acampamento mais limpo do que vocês encontraram.

Resumindo, não tenham medo de renomear o que está confuso. A cada *commit* procurem sempre melhorar o código do que já está lá. Ao invés de reclamar porque mudaram os nomes das variáveis, seus colegas vão agradecer. Se todos fizerem isso, o código vai ficando cada vez melhor.

10 passos para um bom nome:
{: .emphasis}

 1. Invista tempo
 1. Pense no propósito
 1. Não deixe implícito
 1. Faça distinções
 1. Pronuncie
 1. Evite convenções ultrapassadas
 1. Considere o contexto
 1. Considere usar “construtores” com nome
 1. Use nomes do domínio
 1. Não tenha medo

 <a href="exercises1.html" class="btn btn-green btn-block spaced">Aos exercícios!</a>
