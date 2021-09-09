using System;
using System.Globalization;


namespace Vetor {
    class Program {
        static void Main(string[] args) {

            // Primeiro exemplo de vetor sem utilizar classes:
            /*
            //  Variável que vai informar o tamanho do vetor:
            int n = int.Parse(Console.ReadLine());

            //  Criando o vetor contendo números double:
            double[] vect = new double[n];

            //  Para entrar com os dados e guardar no vetor:
            for (int i = 0; i < n; i++) {
                vect[i] = double.Parse(Console.ReadLine(),CultureInfo.InvariantCulture);
            }

            //  Para calcular a soma dos valores alocados no vetor:
            double sum = 0.0;
            for (int i = 0; i < n; i++) {
                sum += vect[i];
            }

            //  Para calcular a média dos valores alocados no vetor:
            double avg = sum / n;

            //  Para mostrar os resultados:
            Console.WriteLine("Média: " + avg.ToString("F2", CultureInfo.InvariantCulture));
            */


            // Segundo exemplo utilizando a classe ou etores do tipo 'referência':
            int n = int.Parse(Console.ReadLine());

            Product[] vect = new Product[n];

            for (int i = 0; i < n; i++) {
                string name = Console.ReadLine();
                double price = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
                vect[i] = new Product { Name = name, Price = price };
            }

            double sum = 0.0;
            for (int i = 0; i < n; i++) {
                sum += vect[i].Price;
            }

            double avg = sum / n;

            Console.WriteLine("Preço médio = " + avg.ToString("F2", CultureInfo.InvariantCulture));

        }
    }
}
