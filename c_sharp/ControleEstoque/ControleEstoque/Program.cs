using System;
using System.Globalization;

namespace ControleEstoque {
    class Program {
        static void Main(string[] args) {

            /*
            Exemplo Get / Set:
            
            Produto p = new Produto("TV", 500.00, 10);

            p.Nome = "T";

            Console.WriteLine(p.Nome);

            Console.WriteLine(p.Preco);

            Console.WriteLine(p.Quantidade);
            ---------------------------------------------------------
            */

            //  Exemplo com Auto Properties:
            Produto p = new Produto("TV", 500.00, 10);

            p.Nome = "T";

            Console.WriteLine(p.Nome);
            Console.WriteLine(p.Preco);
            Console.WriteLine(p.Quantidade);

            /*
           Console.WriteLine("Entre os dados do produto:");
           Console.Write("Nome: ");
           string nome = Console.ReadLine();
           Console.Write("Preço: ");
           double preco = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);


           Produto p = new Produto(nome, preco);


           Console.WriteLine();
           Console.WriteLine("Dados do produto: " + p);

           Console.WriteLine();
           Console.Write("Digite o número de produtos a ser adicionado ao estoque: ");
           int qte = int.Parse(Console.ReadLine());
           p.AdicionarProdutos(qte);

           Console.WriteLine();
           Console.WriteLine("Dados atualizados: " + p);

           Console.WriteLine();
           Console.Write("Digite o número de produtos a ser removido do estoque: ");
           qte = int.Parse(Console.ReadLine());
           p.RemoverProdutos(qte);

           Console.WriteLine();
           Console.WriteLine("Dados atualizados: " + p);
           */
        }


    }
}

