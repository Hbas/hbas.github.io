---
layout: codigolimpo/exercises
---
{% include codigolimpo/assessment1.md %}

## Exercício 1.3: Fibonacci

Cada número numa sequencia de Fibonacci é gerado adicionando os dois números anteriores. Começando com os valores 1 e 2, os 10 primeiros termos são:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

Escreva e, em seguida, refatore um algoritmo que encontra a soma de todos os números **pares** de Fibonacci abaixo de **4 milhões**.

## Exercício 1.4: Números. Complexos.

Um número complexo é um número “Z” que pode ser escrito na forma “Z = X + iY”, em que “X” e “Y” são números reais e i denota a unidade imaginária. Esta tem a propriedade i² = -1, sendo que X e Y são chamados respectivamente parte real e parte imaginária de Z.

Revise, listando todos os problemas e, em seguida, refatore o código abaixo, que lê e multiplica dois números complexos.Revise, listando todos os problemas e, em seguida, refatore o código abaixo, que lê e multiplica dois números complexos.

~~~~~~
internal class ComplexNumber
{
  private double x, complexNumberImaginaryPart;

  public ComplexNumber(double x, double y)
  {
    this.x = x;
    this.complexNumberImaginaryPart = y;
  }

  public ComplexNumber(int x)
  {
    this.x = x;
    this.complexNumberImaginaryPart = 0;
  }

  public ComplexNumber(string x)
  : this(x, false)
  { }

  public ComplexNumber(string z, bool containsY)
  {
    if (containsY)
    {
      int i = z.IndexOf('+');
      x = double.Parse(z.Substring(0, i).Trim());
      complexNumberImaginaryPart = double.Parse(z.Substring(i + 1).Replace('i', ' ').Trim());
    }
    else
    {
      x = double.Parse(z);
      complexNumberImaginaryPart = 0;
    }
  }

  public static ComplexNumber operator *(ComplexNumber c1, ComplexNumber c2)
  {
    ComplexNumber c3 = new ComplexNumber(0);
    c3.x = c1.x * c2.x - c1.complexNumberImaginaryPart * c2.complexNumberImaginaryPart;
    c3.complexNumberImaginaryPart = c1.complexNumberImaginaryPart * c2.x + c1.x * c2.complexNumberImaginaryPart;
    return c3;
  }

  public override string ToString()
  {
    return string.Format("{0} + {1}i", x, complexNumberImaginaryPart);
  }
}

class Program
{
  static void Main(string[] args)
  {
    Console.WriteLine("Digite o primeiro numero");
    var l = Console.ReadLine();
    var c1 = new ComplexNumber(l, l.Contains('i'));
    Console.WriteLine("Digite o valor de X do segundo numero");
    var x2 = double.Parse(Console.ReadLine());
    Console.WriteLine("Digite o valor de Y do segundo numero");
    var y2 = double.Parse(Console.ReadLine());
    var c2 = new ComplexNumber(x2, y2);
    Console.WriteLine("A multiplicação é: " + (c1 * c2));
    Console.ReadLine();
  }
}
~~~~~~


## Exercício 1.5: Números. Complexos. (parte 2)

Utilizando a classe ComplexNumber do exercício anterior, implemente o método “Parse” do trecho de código abaixo. Se o input lido na segunda linha não corresponder ao formato esperado, você deve levantar FormatException.

Após a implementação, refatore seu código.

~~~~~~
class Program
{
  static void Main(string[] args)
  {
    Console.WriteLine("Dentre as opções abaixo, informe o formato do input, seguido pela tecla ENTER");
    Console.WriteLine("1 - Apenas um inteiro");
    Console.WriteLine("2 - Apenas um double");
    Console.WriteLine("3 - Dois inteiros separados por vírgula");
    Console.WriteLine("4 - Dois doubles separados por ponto e vírgula");
    Console.WriteLine("5 - Dois inteiros, com o caracter ‘+’ como separador mais e a letra 'i'");
    Console.WriteLine("6 - Dois doubles, com o caracter ‘+’ como separador e e a letra 'i'");
    int format = int.Parse(Console.ReadLine());
    try
    {
      Console.WriteLine("Agora, digite o input e aperte ENTER");
      var complexNumber = Parse(format, Console.ReadLine());
      Console.WriteLine("O número digitado foi: " + complexNumber);
    }
    catch (FormatException)
    {
      Console.WriteLine("Formato não corresponde ao informado anteriormente");
    }
    Console.ReadLine();
  }

  private static ComplexNumber Parse(int type, string input)
  {
    throw new NotImplementedException();
  }
}
~~~~~~
