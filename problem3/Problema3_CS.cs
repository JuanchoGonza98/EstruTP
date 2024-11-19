using System;

class Program
{
    static int[,] MultiplicarMatrices(int[,] A, int[,] B)
    {
        int filasA = A.GetLength(0);
        int columnasA = A.GetLength(1);
        int filasB = B.GetLength(0);
        int columnasB = B.GetLength(1);

        // Verificar compatibilidad de dimensiones
        if (columnasA != filasB)
        {
            throw new Exception("Las dimensiones de las matrices no son compatibles para la multiplicación.");
        }

        // Crear la matriz resultado
        int[,] resultado = new int[filasA, columnasB];

        // Multiplicación manual
        for (int i = 0; i < filasA; i++)
        {
            for (int j = 0; j < columnasB; j++)
            {
                for (int k = 0; k < columnasA; k++)
                {
                    resultado[i, j] += A[i, k] * B[k, j];
                }
            }
        }

        return resultado;
    }

    static void Main(string[] args)
    {
        try
        {
            int[,] A = {
                { 1, 2, 3 },
                { 4, 5, 6 }
            };

            int[,] B = {
                { 7, 8 },
                { 9, 10 },
                { 11, 12 }
            };

            int[,] resultado = MultiplicarMatrices(A, B);

            Console.WriteLine("Resultado:");
            for (int i = 0; i < resultado.GetLength(0); i++)
            {
                for (int j = 0; j < resultado.GetLength(1); j++)
                {
                    Console.Write(resultado[i, j] + " ");
                }
                Console.WriteLine();
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
    }
}
using MathNet.Numerics.LinearAlgebra;

var matrixA = Matrix<double>.Build.DenseOfArray(new double[,] { { 1, 2, 3 }, { 4, 5, 6 } });
var matrixB = Matrix<double>.Build.DenseOfArray(new double[,] { { 7, 8 }, { 9, 10 }, { 11, 12 } });
var resultado = matrixA * matrixB;
Console.WriteLine(resultado);
