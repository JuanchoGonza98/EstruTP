using System;
using System.Collections.Generic;

class Estudiante
{
    public string Nombre { get; set; }
    public int Edad { get; set; }
    public int Calificacion { get; set; }

    public Estudiante(string nombre, int edad, int calificacion)
    {
        Nombre = nombre;
        Edad = edad;
        Calificacion = calificacion;
    }
}

class Program
{
    static void MergeSort(List<Estudiante> lista, int izquierda, int derecha)
    {
        if (izquierda < derecha)
        {
            int medio = (izquierda + derecha) / 2;

            MergeSort(lista, izquierda, medio);
            MergeSort(lista, medio + 1, derecha);
            Merge(lista, izquierda, medio, derecha);
        }
    }

    static void Merge(List<Estudiante> lista, int izquierda, int medio, int derecha)
    {
        int n1 = medio - izquierda + 1;
        int n2 = derecha - medio;

        List<Estudiante> izquierdaTemp = new List<Estudiante>();
        List<Estudiante> derechaTemp = new List<Estudiante>();

        for (int i = 0; i < n1; i++)
            izquierdaTemp.Add(lista[izquierda + i]);

        for (int i = 0; i < n2; i++)
            derechaTemp.Add(lista[medio + 1 + i]);

        int iIzq = 0, iDer = 0, k = izquierda;

        while (iIzq < n1 && iDer < n2)
        {
            if (izquierdaTemp[iIzq].Edad <= derechaTemp[iDer].Edad) // Ordenar por edad
            {
                lista[k] = izquierdaTemp[iIzq];
                iIzq++;
            }
            else
            {
                lista[k] = derechaTemp[iDer];
                iDer++;
            }
            k++;
        }

        while (iIzq < n1)
        {
            lista[k] = izquierdaTemp[iIzq];
            iIzq++;
            k++;
        }

        while (iDer < n2)
        {
            lista[k] = derechaTemp[iDer];
            iDer++;
            k++;
        }
    }

    static void Main(string[] args)
    {
        List<Estudiante> estudiantes = new List<Estudiante>
        {
            new Estudiante("Alice", 20, 85),
            new Estudiante("Bob", 19, 90),
            new Estudiante("Charlie", 22, 78),
            new Estudiante("Diana", 21, 88)
        };

        MergeSort(estudiantes, 0, estudiantes.Count - 1);

        foreach (var estudiante in estudiantes)
        {
            Console.WriteLine($"{estudiante.Nombre}, Edad: {estudiante.Edad}, Calificación: {estudiante.Calificacion}");
        }
    }
}
