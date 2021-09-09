using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Calculadora
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label_algoritmo_Click(object sender, EventArgs e)
        {

        }

        private void cmd_sair_Click(object sender, EventArgs e)
        {
            // Fechar a aplicação
            Application.Exit();
        }

        private void cmd_calcular_Click(object sender, EventArgs e)
        {
            // Executa o cálculo da operação

            int parcela1;
            int parcela2;
            string tipo_operacao;

            int resultado = -11111111; // Resultado final da operação

            string algoritmo = text_operacao.Text;

            string sinais = "+-*/";

            int index = 0;

            foreach(char c in algoritmo)
            {
                foreach(char s in sinais)
                {
                    if(c == s)
                    {
                        // Define os 3 elementos da operação
                        // Parcela 1
                        parcela1 = int.Parse(algoritmo.Substring(0, index));

                        // Sinal
                        tipo_operacao = c.ToString();

                        // Parcela 2
                        parcela2 = int.Parse(algoritmo.Substring(index + 1));

                        // Analisa a operação que vai ser realizada
                        switch (tipo_operacao)
                        {
                            case "+":
                                // Adição
                                resultado = parcela1 + parcela2;
                                break;

                            case "-":
                                // Subtração
                                resultado = parcela1 - parcela2;
                                break;

                            case "*":
                                // Multiplicação
                                resultado = parcela1 * parcela2;
                                break;

                            case "/":
                                // Divisão
                                resultado = parcela1 / parcela2;
                                break;
                        }

                        break;

                    }
                }

                // Analisa resultado
                if (resultado != -11111111)
                    break;
                index++;
            }

            // Apresentação do resultado final
            if (resultado == -11111111)
                MessageBox.Show("Erro na operação!");
            else
            MessageBox.Show(algoritmo + " = " + resultado);

            // Limpa o algoritmo
            text_operacao.Text = "";
            text_operacao.Focus();
        }

        private void text_operacao_KeyDown(object sender, KeyEventArgs e)
        {
            // Ao pressionar a tecla 'ENTER' executa a operação
            // exceto no caso de não existir texto

            // Verifica se existe texto
            if (text_operacao.Text == "") return;

            // Analisa se foi pressionada a tecla 'ENTER'
            if (e.KeyCode == Keys.Return)
                cmd_calcular_Click(cmd_calcular, EventArgs.Empty);

            else if(e.KeyCode == Keys.Escape)
            {
                text_operacao.Text = "";
                text_operacao.Focus();
            }
        }
    }
}
