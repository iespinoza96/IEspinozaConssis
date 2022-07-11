using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IEspinozaConssis
{
    class SumaMatrices
    {
        int[,] Matriz1;
        int[,] Matriz2;
        int[,] Matriz3;

        public void GetDatos()
        {
            Matriz1 = new int[10, 10];
            Matriz2 = new int[10, 10];
            Matriz3 = new int[10, 10];

            Console.WriteLine("Ingrese los datos de la matriz 1: \n");

            for (int i = 1; i <= 3; i++)//for de filas 
            {
                for (int j = 1; j <= 3; j++)//for de columnas 
                {
                    Console.WriteLine("Ingrese la posicion ["+i+","+j+"]: ");

                    string datos;

                    datos = Console.ReadLine();

                    Matriz1[i, j] = int.Parse(datos);
                }
            }

            Console.WriteLine("Ingrese los datos de la matriz 2: \n");

            for (int i = 1; i <= 3; i++)//for de filas 
            {
                for (int j = 1; j <= 3; j++)//for de columnas 
                {
                    Console.WriteLine("Ingrese la posicion [" + i + "," + j + "]: ");

                    string datos;

                    datos = Console.ReadLine();

                    Matriz2[i, j] = int.Parse(datos);
                }
            }

            // Suma de matrices 

            for (int i = 1; i <= 3; i++)//for de filas 
            {
                for (int j = 1; j <= 3; j++)//for de columnas 
                {

                    Matriz3[i, j] = Matriz1[i,j] + Matriz2 [i,j];
                }
            }
        }

        public void SetDatos()
        {
            Console.WriteLine("La suma de la Matriz 1 y la Matriz 2 es:");
            for (int i = 1; i <= 3; i++)//for de filas 
            {
                Console.Write("\n");
                for (int j = 1; j <= 3; j++)//for de columnas 
                {

                    Console.Write(  Matriz3[i, j] +" ");
                }
            }
            Console.ReadKey();
        }

        public void Factorial()
        {
            int Numero, Resultado = 1;

            Console.WriteLine("Ingrese un numero: \n");

            Numero = int.Parse(Console.ReadLine());

            for (int i = 1; i <= Numero; i++)// ciclo for en el que el limite sea igual o menor al numero ingresado 
            {
                Resultado = Resultado * i;
            }

            Console.WriteLine("El factorial del numero:"+ Numero+ " es:"+Resultado);
            Console.ReadKey();
        }
        static void Main(string[] args)
        {
            SumaMatrices suma = new SumaMatrices();

           // suma.GetDatos();

            //suma.SetDatos();

            suma.Factorial();
            //Console.Write("\n\n");

        }
    }
}
