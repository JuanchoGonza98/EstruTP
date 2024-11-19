using System;
using System.Collections.Generic;

class Producto
{
    public string Nombre { get; set; }
    public double Precio { get; set; }
    public int Cantidad { get; set; }

    public Producto(string nombre, double precio, int cantidad)
    {
        Nombre = nombre;
        Precio = precio;
        Cantidad = cantidad;
    }
}

class Program
{
    static Producto BusquedaBinaria(List<Producto> lista, string clave)
    {
        if (lista == null || lista.Count == 0)
        {
            throw new Exception("La lista está vacía.");
        }

        int izquierda = 0, derecha = lista.Count - 1;

        while (izquierda <= derecha)
        {
            int medio = (izquierda + derecha) / 2;

            if (lista[medio].Nombre == clave)
            {
                return lista[medio];
            }
            else if (string.Compare(lista[medio].Nombre, clave) < 0)
            {
                izquierda = medio + 1;
            }
            else
            {
                derecha = medio - 1;
            }
        }

        throw new Exception($"Producto '{clave}' no encontrado.");
    }

    static void Main(string[] args)
    {
        try
        {
            List<Producto> productos = new List<Producto>
            {
                new Producto("Arroz", 50, 20),
                new Producto("Harina", 30, 15),
                new Producto("Leche", 60, 10),
                new Producto("Pan", 40, 25),
                new Producto("Queso", 100, 5)
            };

            string clave = "Leche";
            Producto resultado = BusquedaBinaria(productos, clave);

            Console.WriteLine($"Producto encontrado: {resultado.Nombre}, Precio: {resultado.Precio}, Cantidad: {resultado.Cantidad}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}

