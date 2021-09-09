using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Agenda
{
    public partial class frmResultados : Form
    {
        string texto;

        //================================================================
        public frmResultados(string texto)
        {
            InitializeComponent();

            // Definir o texto de pesquisa
            this.texto = texto.ToUpper();
        }

        //================================================================
        private void frmResultados_Load(object sender, EventArgs e)
        {
            // Executa a pesquisa e constroi a lista
            ExecutaPesquisa();
        }

        //================================================================
        private void ExecutaPesquisa()
        {
            // Realiza a pesquisa e apresenta dados
            List<cl_contato> Lista_resultados = new List<cl_contato>();

            foreach (cl_contato contato in cl_geral.LISTA_CONTATOS)
            {
                if (contato.nome.ToUpper().Contains(texto) ||
                    contato.numero.ToUpper().Contains(texto))
                {
                    Lista_resultados.Add(contato);
                }
            }

            // Apresentar os resultados na lista
            lista_final.Items.Clear();
            foreach (cl_contato contato in Lista_resultados)
                lista_final.Items.Add(contato.nome + " (" + contato.numero + ")");

            label_numero_registros.Text = "Registros: " + lista_final.Items.Count;
        }

        //================================================================
        private void cmd_fechar_Click(object sender, EventArgs e)
        {
            // Fecha o quadro
            this.Close();
        }

        //================================================================
        private void cmd_nova_pesquisa_Click(object sender, EventArgs e)
        {
            // Pedir novo texto
            frmTexto f = new frmTexto();
            f.ShowDialog();

            // Quando o quadro é fechado
            if (f.cancelado) return;
            texto = f.texto.ToUpper();
            ExecutaPesquisa();
        }
    }
}
