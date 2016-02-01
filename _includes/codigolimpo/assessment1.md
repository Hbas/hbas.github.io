## Exercício 1.1: Palindromos

Um palíndromo é lido da mesma maneira da direita para a esquerda e da esquerda para a direita. O maior palíndromo formado a partir do produto de 2 números com dois dígitos é “9009” (91 vezes 99).


Revise o código abaixo, que tem o objetivo de encontrar o maior palíndromo formado a partir do produto de 2 números com três digitos, listando todos os problemas e, em seguida, refatore-o para clarificá-lo.

~~~~~~
public static void main(string[] args)
{
    int temp = -1234;
    for (int a = 100; a < 1000; a++)
    {
        for (int b = 100; b < 1000; b++)
        {
            if (Check(a * b))
            {
                temp = a * b > temp ? a * b : temp;
            }
        }
    }
    System.out.println(temp);
    System.in.read();
}

private static bool check(int number)
{
    var ok = true;
    var aux = number.toString(); //number as a string
    int pos1 = 0; //zero
    int pos2 = aux.Length - 1; //the last position
    while (pos1 < pos2 && ok)
    {
        if (aux[pos1] != aux[pos2])
            ok = false;
        pos1++;
        pos2--;
    }
    return ok;	 
}
~~~~~~
{: .prettyprint}

## Exercício 1.2: sdn-sei-la-o-q

Se somarmos todos os números naturais abaixo de 10 que são multiplos de 3 ou 5, encontraremos 23 (3+5+6+9)

Revise o código, listando todos os problemas e, em seguida, refatore o algoritmo abaixo, que encontra a soma de todos os múltiplos de 3 ou 5 abaixo de 1000, para clarificá-lo.

~~~~~~
public static void main(string[] args)
{
    int sdnmd3o5ad1000 = 0; //Soma Dos Numeros Multiplos De 3 Ou 5 Abaixo De 1000
    int n1 = 3; //tres
    int n2 = 5;//cinco
    for (int i = 0; i < 1000; i++)
    {
        if (i % n1 == 0 || i % n2 == 0)
        {
            sdnmd3o5ad1000 += i;
        }
    }
    System.out.println(sdnmd3o5ad1000);
    System.in.read();
}
~~~~~~
{: .prettyprint}
