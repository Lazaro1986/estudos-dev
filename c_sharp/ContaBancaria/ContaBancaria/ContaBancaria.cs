using System.Globalization;

namespace ContaBancaria {
    class ContaBancaria {

        //  Atributos:
        public int Numero { get; private set; }
        public string Titular { get; set; }
        public double Saldo { get; private set; }

        //  Construtores:
        public ContaBancaria(int numero, string titular) {
            Numero = numero;
            Titular = titular;
        }

        public ContaBancaria(int numero, string titular, double depositoInicial) : this(numero, titular) {
            Deposito(depositoInicial);
        }


        //  Operações:
        public void Deposito(double quantia) {
            Saldo += quantia;
        }
        public void Saque(double quantia) {
            Saldo -= quantia;
            Saldo -= 5.0;
            //  Ou apenas: Saldo -= quantia + 5.0;
        }






        //  ToString para mostrar os dados da conta:
        public override string ToString() {
            return "Conta "
                + Numero
                + ", Titular: "
                + Titular
                + ", Saldo: $ "
                + Saldo.ToString("F2", CultureInfo.InvariantCulture);
        }


    }
}
