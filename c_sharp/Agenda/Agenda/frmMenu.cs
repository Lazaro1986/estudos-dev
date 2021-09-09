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
    public partial class frmMenu : Form
    {
        public frmMenu()
        {
            InitializeComponent();

            // Carega os contatos
            cl_geral.ConstroiListaContatos();

            // Apresenta versão do programa
            label_versao.Text = cl_geral.versao;
        }

        private void frmMenu_Load(object sender, EventArgs e)
        {

        }

        private void cmd_sair_Click(object sender, EventArgs e)
        {
            // Sair do App

            // Pergunta se pretende mesmo sair da aplicação
            if (MessageBox.Show("Deseja sair da aplicação?", "SAIR", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No) return;

            // Sair da aplicação definitivamente
            Application.Exit();
        }

        private void cmd_inserir_editar_Click(object sender, EventArgs e)
        {
            // Abre o formulário para gestão dos contatos
            frmInserirEditar formulario = new frmInserirEditar();
            formulario.ShowDialog();

        }

        private void cmd_pesquisar_Click(object sender, EventArgs e)
        {
            // Abrir o quadro de pesquisa
            frmTexto f = new frmTexto();
            f.ShowDialog();

            // Quando fecha o quadro de pesquisa, verifica se foi cancelado
            if (f.cancelado) return;

            // Abrir o quadro com o resultado da pesquisa
            frmResultados ff = new frmResultados(f.texto);
            ff.ShowDialog();
        }
    }
}
