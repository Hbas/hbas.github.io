## Exercício 2.1: Crivo de Eratóstenes

O [Crivo de Eratóstenes](http://pt.wikipedia.org/wiki/Crivo_de_Erat%C3%B3stenes){: target="ref" } é um antigo algoritmo para encontrar números primos até um certo valor limite. O crivo é atribuído ao matemático grego Eratóstenes (c. 285-194 a.C.), o terceiro bibliotecário-chefe da Biblioteca de Alexandria.

O código abaixo corresponde a uma implementação deste crivo. Revise-o, listando todos os problemas e, em seguida, refatore esta implementação.

~~~~~~  
public class EratosthenesSieve
{
    /// <param name="maxValue>the generation limit.</param>;
    public static int[] generatePrimes(int maxValue)
    {
        if (maxValue >= 2) // the only valid case
        {
            // declarations
            int l = maxValue + 1; // size of array
            bool[] f = new bool[l];
            int i;
            // initialize all flags to true.
            for (i = 0; i < l; i++)
                f[i] = true;
            // get rid of 2 first known non-primes
            f[0] = f[1] = false;
            // the eratosthenes sieve
            int j;
            for (i = 2; i < Math.Sqrt(l) + 1; i++)
            {
                if (f[i]) // if i is uncrossed, cross its multiples.
                {
                    for (j = 2 * i; j < l; j += i)
                        f[j] = false; // multiple is not prime
                }
            }
            // counting how many primes are there
            int count = 0;
            for (i = 0; i < l; i++)
            {
                if (f[i])
                    count++; // increase prime count.
            }
            int[] r = new int[count];
            // move the primes into the result
            for (i = 0, j = 0; i < l; i++)
            {
                if (f[i]) // if prime
                    r[j++] = i;
            }
            return r; // return the result
        }
        else // maxValue < 2
        {
            return null; // What should I do?
        }
    }
}
~~~~~~
{: .prettyprint}
