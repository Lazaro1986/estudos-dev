using System.Globalization;
using System.Security.Cryptography.X509Certificates;

namespace ControleEstoque {
    class Produto {

        //  Atributos:
        private string _nome;   //  O atributo _nome não será feito Auto Propertie pq ele tem uma verificação de condição 'if' na Propertie.
        public double Preco { get; private set; }
        public int Quantidade { get; private set; }
        

        //  Construtores:

        //  Construtor padrão:
        public Produto() {
        }

        //  Costrutor com com 3 argumentos:
        public Produto(string nome, double preco, int quantidade) {
            _nome = nome;
            Preco = preco;
            Quantidade = quantidade;
        }

        /*
        //  Método Get / Set:       Get -> capturar /   Set -> alterar
        public string GetNome() {
            return _nome;
        }

        public void SetNome(string nome) {
            if (nome != null && nome.Length > 1) {  // Só vai atribuir esse novo nome se ele não for nulo e o tamanho dele for maior que 1.
                _nome = nome;
            }
        }
        */

        
        //  Simplificando o método Get/Set definidos através de uma properties:
        //  Properties ou propriedades:
        public string Nome {
            get { return _nome; }
            set {
                if (value != null && value.Length > 1) {  // Só vai atribuir esse novo nome se ele não for nulo e o tamanho dele for maior que 1.
                    _nome = value;
                }
            }
        }

        /*
        //  Utilizado Auto Properties
        */

        /*
        public double GetPreco() {
            return _preco;
        }
        */

        /*
        public double Preco {
            get { return _preco; }
        }
        //  Utilizado Auto Properties
        */

        /*
        public int GetQuantidade() {
            return _quantidade;
        }
        */

        /*
        public int Quantidade {
            get { return _quantidade; }
        }
        //  Utilizado Auto Properties
        */

        /*
        //  Construtor com 2 argumentos:
        public Produto(string nome, double preco) {
            Nome = nome;
            Preco = preco;
            Quantidade = 0; // Por padrão os atributos numéricos já recebem o valor 0, no entanto neste caso, esta linha é dispensável.
        }
        */

        public double ValorTotalEmEstoque() {
            return Preco * Quantidade;
        }

        public void AdicionarProdutos(int quantidade) {
            Quantidade += quantidade;
        }

        public void RemoverProdutos(int quantidade) {
            Quantidade -= quantidade;
        }

        public override string ToString() {
            return _nome
                + ", $ "
                + Preco.ToString("F2", CultureInfo.InvariantCulture)
                + ", "
                + Quantidade
                + " unidades, Total: $ "
                + ValorTotalEmEstoque().ToString("F2", CultureInfo.InvariantCulture);

        }
    }
}
