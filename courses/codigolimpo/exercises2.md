---
layout: codigolimpo/exercises
---
{% include codigolimpo/assessment2.md %}

## Exercício 2.2:  Multiplos de 3 ou 7

Se somarmos todos os números naturais abaixo de 10 que são multiplos de 3 ou 7, encontraremos 25 (3+6+7+9)

Revise o código, listando todos os problemas e, em seguida, refatore o algoritmo abaixo, que deve imprimir a soma de todos os múltiplos de 3 ou 7 abaixo de 1000, para clarificá-lo.

~~~~~~
static void Main(string[] args)
{
  int result = 0;
  for (int i = 0; i < 1000; i++)
  {
    if (IsMultiple(i, 3, true))
    {
      result += i;
    }
    else if (IsMultiple(i, 7, false))
    {
      result += i;
    }
  }
  Console.WriteLine(result);
  Console.ReadKey();
}

private static bool IsMultiple(int i, int j, bool debug)
{
  var ret = i % j == 0;
  if (debug)
    Console.WriteLine("{0} % {1}? {2}", i, j, ret);
  return ret;
}
~~~~~~
{: .prettyprint}

## Exercício 2.3: Contar domingos.

A seguir, apresentamos os “requisitos” de um algoritmo na forma de um conjunto de testes unitários utilizando a plataforma NUnit. Em seguida, apresentamos uma solução para estes testes, com um código-fonte longe do ideal.

Revise o código da solução, listando todos os problemas e, sem realizar nenhuma alteração nos testes unitários e **sem utilizar a classe DateTime**, refatore o método *FirstOfMonthSundays*.

~~~~~~
[TestFixture]
public class CountSundaysTest
{
  private CountSundays _algorithm;

  [SetUp]
  public void Setup()
  {
    _algorithm = new CountSundays();
  }

  [Test]
  public void OnlyYearsAfter1900AreValid()
  {
    var year = 1899;
    Assert.Throws<ArgumentException>(() => _algorithm.FirstOfMonthSundays(year));
  }

  [Test]
  public void ThereWhere2SundaysThatWhereFirstDayOfMonthOn1900()
  {
    var year = 1900;
    Assert.AreEqual(2, _algorithm.FirstOfMonthSundays(year));
  }

  [Test]
  public void ThereWhere1SundayThatWhereFirstDayOfMonthOn1913()
  {
    var year = 1913;
    Assert.AreEqual(1, _algorithm.FirstOfMonthSundays(year));
  }

  [Test]
  public void ThereWhere3SundaysThatWhereFirstDayOfMonthOn2015()
  {
    var year = 2015;
    Assert.AreEqual(3, _algorithm.FirstOfMonthSundays(year));
  }

  [Test]
  public void SumAllFirstMonthSundaysOnThe21Century()
  {
    var centuryStartYear = 1901;
    var centuryEndYear = 2000;
    Assert.AreEqual(171, _algorithm.FirstOfMonthSundays(centuryStartYear, centuryEndYear));
  }
}
~~~~~~
{: .prettyprint}

~~~~~~
class CountSundays
{
  internal int FirstOfMonthSundays(int startYear, int endYear)
  {
    int sundays = 0;
    for (int year = startYear; year <= endYear; year++)
    {
       sundays += FirstOfMonthSundays(year);
    }
    return sundays;
  }

  internal int FirstOfMonthSundays(int year)
  {
    if (year < 1900)
      throw new ArgumentException("Year must be greater than 1900: " + year);

    //1 Jan 1900 was a Monday.
    int currYear = 1900, dayOfWeek = 1, currentMonth = 0, dayOfMonth = 1;
    bool nextIterationIsNextWeek = false, insideYear;
    int sundayFirstCount = 0;
    int[] month = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

    while (currYear <= year)
    {
      insideYear = true;
      if ((currYear % 4 == 0 && currYear % 100 != 0)
        || currYear % 400 == 0)
      {
        month[1] = 29;
      }
      else
        month[1] = 28;

      while (insideYear)
      {
        if (dayOfWeek == 0 && dayOfMonth == 1)
        {
            sundayFirstCount++;
        }
        if (nextIterationIsNextWeek)
        {
            dayOfWeek = 0;
            nextIterationIsNextWeek = false;
        }
        else
            dayOfWeek++;

        if (dayOfWeek == 6)
        {
            nextIterationIsNextWeek = true;
        }

        if (dayOfMonth == month[currentMonth])
        {
            dayOfMonth = 1;
            if (currentMonth == 11)
            {
                currentMonth = 0;
                insideYear = false;
            }
            else
            {
                currentMonth++;
            }
        }
        else
        {
            dayOfMonth++;
        }
      }
      if (currYear != year)
        sundayFirstCount = 0;
      currYear++;
    }
    return sundayFirstCount;    
  }
}
~~~~~~
{: .prettyprint}

## Exercício 2.4: Grandes inteiros

A seguir, apresentamos os “requisitos” de um algoritmo na forma de um conjunto de testes unitários utilizando a plataforma NUnit. Em seguida, apresentamos uma solução para estes testes, com um código-fonte longe do ideal.

Revise o código da solução, listando todos os problemas e, sem realizar nenhuma alteração nos testes unitários e **sem utilizar a classe BigInteger**, refatore a classe *HugeNumber*.

~~~~~~
[TestFixture]
public class HugeNumberTest
{
  [Test]
  public void One()
  {
    Assert.AreEqual("2", HugeNumber.TwoPow(1).Text);
  }

  [Test]
  public void Two()
  {
    Assert.AreEqual("4", HugeNumber.TwoPow(2).Text);
  }

  [Test]
  public void Four()
  {
    Assert.AreEqual("16", HugeNumber.TwoPow(4).Text);
    Assert.AreEqual(7, HugeNumber.TwoPow(4).DigitSum);
  }

  [Test]
  public void OneThousand()
  {
    Assert.AreEqual(1366, HugeNumber.TwoPow(1000).DigitSum);
  }
}
~~~~~~
{: .prettyprint}

~~~~~~
public class HugeNumber
{
  public string Text { get; private set; }
  public int DigitSum { get; private set; }

  public static HugeNumber TwoPow(int number)
  {
    var hugeNumber = new HugeNumber("2");
    for (int i = 1; i < number; i++)
    {
      hugeNumber.Add(hugeNumber);
    }
    return hugeNumber;
  }

  private HugeNumber(string number)
  {
    Text = number;
  }

  public void Add(HugeNumber secondAddend)
  {
    StringBuilder sum = new StringBuilder();
    DigitSum = 0;
    int biggestAddendLenght = Math.Max(this.Text.Length, secondAddend.Text.Length);
    int excess = 0;
    for (int i = 0; i < biggestAddendLenght; i++)
    {
      excess = SumDigit(secondAddend, sum, excess, i);
    }
    if (excess != 0)
      sum.Insert(0, excess);
    DigitSum += excess;
    Text = sum.ToString();
  }

  private int SumDigit(HugeNumber secondAddend, StringBuilder sum, int excess, int i)
  {
    int s = DigitAt(i) + secondAddend.DigitAt(i) + excess;
    excess = s / 10;
    sum.Insert(0, s % 10);
    DigitSum += (s % 10);
    return excess;
  }

  public int DigitAt(int potenceOfTen)
  {
    if (Text.Length <= potenceOfTen)
      return 0;
    int index = Text.Length - 1 - potenceOfTen;
    return Text[index] - '0';
  }
}
~~~~~~
{: .prettyprint}
