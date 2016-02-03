---
layout: codigolimpo/lesson
---

<div class="lessonHeader" style="background-image: url('/static/codigolimpo/header3.jpg')">
  <blockquote>
    <p>"I love argument, I love debate. I don't expect anyone just to sit there and agree with me, that's not their job."</p>
    <small>Margaret Thatcher</small>
  </blockquote>
</div>

Continuando o módulo 2, Funções, vamos agora para a parte dos argumentos e parâmetros. As funções têm argumentos e, ao contrário do que acontece no trabalho da Primeira Ministra da Inglaterra, em codificação, quanto menos argumentos numa função, melhor.

O caso ideal são as funções sem nenhum parâmetro. Parâmetros fazem com que o método seja mais difícil de entender, testar e manter, já que eles trazem dependências e fluxos diferentes de acordo com o parâmetro passado.

Observe, por exemplo, o caso da função assertEquals, presente em muitos frameworks de testes unitários:

~~~~~~
Assert.AreEquals(expected, actual);
Assert.AreEquals(actual, expected);
~~~~~~


Percebam que, por se tratar de uma função díade (com 2 parâmetros) precisamos prestar atenção e pensar sobre a ordem, o tipo dos parâmetros, etc.

Nos casos em que não é possível/adequado fazer a função sem nenhum parâmetro, preferimos as funções que tenham 1, 2 ou até 3 argumentos. Quando temos mais de 3 parâmetros para uma função, temos um forte indicativo que algo deve estar errado.

Abaixo, vamos detalhar melhor alguns desses indicativos de que algo está errado.

Por que passar algo como argumento?
{: .lessonSection}

Normalmente, existem três razões comuns para passarmos argumentos:

> *1. Se estamos perguntando algo sobre o argumento, como, por exemplo, se existe um arquivo com este nome*

~~~~~~
bool exists(string fileName)
~~~~~~


> *2. Quando, utilizando o estado/atributos da classe atual, estamos fazendo alguma operação sobre o argumento, transformando-o em outra coisa*

~~~~~~
class Directory {
  InputStream open(string fileName);
}
~~~~~~


> *3. Quando estamos usando eventos, notificando a classe de algo que aconteceu ou lhe dando alguma “ordem”*

~~~~~~
void log(string msg)
~~~~~~


Assim, evite fazer funções que não sigam estas 3 situações. Um caso clássico é quando fazemos uma função em nossa classe para modificarmos o comportamento do argumento. Nestas situações, fica bem mais fácil de entender e manter o código se vocês refatorarem para uma das 3 situações "comuns", como eu mostro abaixo:

~~~~~~
//Ruim: Adiciona o “footer” de “this”, modificando “p”
this.AppendFooterTo(p);

//Melhor: Evento / Comando
p.Append(this.getFooter());
~~~~~~


Muitos parâmetros
{: .lessonSection}

Quando temos uma função com muitos parâmetros, é interessante analisar se alguns destes parâmetros não representam um conceito (classe) na aplicação que estamos desenvolvendo. Veja o código abaixo:

~~~~~~
public static Circle MakeCircle(double x, double y, double radius)  { ... }
~~~~~~


Neste caso, talve os dois primeiros parâmetros (x e y) representem um *Ponto*:

~~~~~~
public static Circle MakeCircle(Point center, double radius) { ... }
~~~~~~


Com isto em mente e, já que o método estava estático, é melhor deixar o próprio ponto criar um círculo:

~~~~~~
public Circle MakeCircle(double radius) { ... }

var circle = center.MakeCircle(5);
~~~~~~


Outro caso comum de funções com muitos parâmetros é quando parte destes parâmetros são sempre passados para vários métodos:

~~~~~~
public class BusinessService<T> {
  void Insert(T entity, Logger log);
  void Remove(T entity, Logger log);
  bool HasSomething(Logger log);
}
~~~~~~


No caso acima, por exemplo, podemos mover o *Logger* para um atributo da classe e retirar este argumento de várias funções

Funções que fazem e respondem
{: .lessonSection}

Nossas funções devem fazer algo com o estado do objeto ou responder alguma pergunta sobre o mesmo. No exemplo abaixo, temos uma função “set” que não segue essa recomendação. Depois que a operação é realizada, ela também funciona como um “get”.

~~~~~~
public string Set(String attribute, String value) { ... }

if (Set("name","henrique") == "henrique"){
  // Success
}
~~~~~~


Veja, na chamada, como fica confuso o código que faz uso dessa funcionalidade. Tentê lê-la, como se fosse uma redação: *"Se atribuir a 'nome', 'henrique' for igual a 'henrique'"*? Ahn?

Funções com flags (booleanos)
{: .lessonSection}

Funções com parâmetros booleanos são horríveis. Se, dependendo de um parâmetro booleano, a função fizer uma coisa ou outra... Então a função não faz uma única coisa. Ela não está resolvendo **um** problema específico. São *duas* funções:

~~~~~~
//Uma função, duas responsabilidades :(
Render(bool isContainer)

//Duas funções, uma responsabilidade :)
RenderContainer();
RenderPanel();
~~~~~~


Funções com side effects
{: .lessonSection}

Abaixo temos um code smell de nomenclatura (que vimos no [Módulo 1](class1.html){: target="ref" }) e de funções:

~~~~~~
public boolean CheckPassword (string userName, string password){
  User user = FindByName(userName);
  if (user != User.NULL && user.password == password){
    Session.Initialize();
    return true;
  }
  return false;
}
~~~~~~


Se vocês perceberam, o método chamado CheckPassword *inicializa a sessão* do usuário se a senha for válida!

Sempre que temos um método com um side effect, estamos deixando nosso código significativamente mais obscuro. Quando encontrarem esses casos, refatorem, mudem o nome, tirem esse efeito colateral do corpo do método. Deixem seus métodos fazendo apenas uma coisa.

Funções que retornam erros
{: .lessonSection}

Quando criamos e usamos métodos, temos expectativas sobre os parâmetros e sobre o que será retornado. As vezes, por um problema de conexão, infra-estrutura ou uma falha do programador, o método não recebe as informações que precisava. Neste casos, temos uma **excessão**.

Divisões por zero, pegar objetos por IDs inválidos, falhas no banco de dados e muitas outras coisas são motivo para nosso sistema levantar excessão. Antes da criação destes mecanismos, no entanto, era comum programar utilizando códigos de retorno:

~~~~~~
if (delete(item) == OP_OK) {
  if (delete(item.child) == OP_OK) {
    if (cache.deleteKey(item.key()) == OP_OK){
        logger.log("item deleted");
        return OP_OK;
    } else {
        logger.log("cache not deleted");
        return FATAL_ERROR;
    }
  } else {
    logger.log("child item not deleted");
    return FATAL_ERROR;
} else {
  logger.log("delete failed");
  return FATAL_ERROR;
}
~~~~~~


Hoje em dia, raras são as situações em que isso é recomendável. Quando retornamos um código de erro (ou mesmo *null*) criamos o problema de que o código cliente vá ter que tratar isso imediatamente, piorando a legibilidade das nossas funções. Se, no entanto, você utilizar excessões, o tratamento de erro pode ser feito num momento posterior e mais adequado, conforme refatoração abaixo:

~~~~~~
try {
  delete(item);
  delete(item.child);
  cache.deleteKey(item.key());
} catch(Exception e) {
  logger.log(e.GetMessage());
}
~~~~~~


São **poucos** os casos em que temos expectativas de que o método vá **tentar** fazer algo. Métodos do tipo *TryGet* e *FirstOrDefault* são exemplos desse tipo de situação. Apenas nestes casos faz sentido retornar um valor "default" ou, melhor ainda, usar o padrão de projeto [Null Object](http://en.wikipedia.org/wiki/Null_Object_pattern){: target="ref" }. Sempre que possível, no entanto, evite métodos que "tentam" e prefira métodos que "fazem".


<a href="exercises2.html" class="btn btn-green btn-block spaced">Vamos refatorar algumas funções!</a>
