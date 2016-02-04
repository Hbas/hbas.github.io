## Exercício 4.1: The Matrix

Quais dos comentários abaixo devem ser mantidos? Justifique sua resposta

~~~~~~  
/// <summary>
/// Unfortunately, no one can be told what the Matrix is. You have to see it for yourself.
/// </summary>
public class Matrix
{
   /// <summary>
   ///  The Oracle: So, what do you think? Do you think you're The One?
   ///  Neo: I don't know.
   /// </summary>
   public static Matrix Identity
   {
      get
      {
         int[] firstRow = { 1, 0, 0 };
         int[] secondRow = { 0, 1, 0 };
         int[] thirdRow = { 0, 0, 1 };
         int[][] theOne = { firstRow, secondRow, thirdRow };
         return new Matrix(theOne);
      }
   }

   /// <summary>
   /// [Opens a pillbox, empties the contents into his palms, and outstretches his hands]
   /// This is your last chance. After this, there is no turning back....
   /// </summary>
   public Matrix(int[][] data)
   {
      ...
   }

   /// <summary>
   ///  Transpose this matrix
   /// </summary>
   /// <returns>The transposed matrix</returns>
   public Matrix Transpose()
   {
      ...
   }

   /// <summary>
   ///  Sum the matrix
   /// </summary>  
   /// <param name="m2">Another matrix</param>                 
   /// <returns>The sum</returns>
   public Matrix Sum(Matrix m2)
   {
      ...
   }

}
~~~~~~

## Exercício 4.2: Let´s comment

Quais dos comentários abaixo devem ser mantidos? Justifique sua resposta

**4.2.1:**

~~~~~~  
// Example: "Tue, 02 Apr 2003 22:18:49 GMT"
private final String DATE_REGEXP =
"[0-9]{2}\\s[JFMASOND][a-z]{2}\\s"+
"[0-9]{4}\\s[0-9]{2}\\:[0-9]{2}\\:[0-9]{2}\\sGMT";
~~~~~~

**4.2.2:**

~~~~~~
// Example: "Tue, 02 Apr 2003 22:18:49 GMT"
private final String DATE_REGEXP =
"[SMTWF][a-z]{2}\\,\\s[0-9]{2}\\s[JFMASOND][a-z]{2}\\s"+
"[0-9]{4}\\s[0-9]{2}\\:[0-9]{2}\\:[0-9]{2}\\sGMT";
~~~~~~

**4.2.3:**

~~~~~~
// Copyright (C) 2000-2016 by Henrique Borges. All rights reserved.
// Released under the terms of the GNU General Public License version 2 or later.</code></pre>
~~~~~~

**4.2.4:**

~~~~~~
// TODO Refactor next week, after the release
~~~~~~
