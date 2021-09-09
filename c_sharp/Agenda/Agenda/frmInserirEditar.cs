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
    public partial class frmInserirEditar : Form
    {
        int indice;

        //====================================================================
        public frmInserirEditar()
        {
            InitializeComponent();
            ConstroiLista();
        }

        //====================================================================
        private void cmd_fechar_Click(object sender, EventArgs e)
        {
            // Fechar formulário
            this.Close();
        }

        //====================================================================
        private void frmInserirEditar_Load(object sender, EventArgs e)
        {

        }

        //====================================================================
        private void ConstroiLista()
        {
            // Adiciona à lista de contatos os contatos registrados
            Lista_contatos.Items.Clear();

            foreach(cl_contato contato in cl_geral.LISTA_CONTATOS)
            {
                Lista_contatos.Items.Add(contato.nome + " (" + contato.numero + ")");
            }

            // Atualizar o numero de registros
            label_numero_registros.Text = "Registros: " + Lista_contatos.Items.Count;

            // Impedir edição e exclusão de registros
            cmd_apagar.Enabled = false;
            cmd_editar.Enabled = false;
        }

        //====================================================================
        private void cmd_gravar_Click(object sender, EventArgs e)
        {
            // Inserir um novo registro na lista

            // Verificar se todos os csmpos estão preenchidos
            if(text_nome.Text == "" || text_numero.Text == "")
            {
                MessageBox.Show("Os campos não estão todos preenchidos.");
                return;
            }

            // Verifica se existe registro igual na lista
            foreach(cl_contato contato in cl_geral.LISTA_CONTATOS)
            {
                if(contato.nome == text_nome.Text &&
                    contato.numero == text_numero.Text)
                {
                    MessageBox.Show("ERRO! Esse registro já existe.");
                    return;
                }
            }

            // Gavar novo registro
            cl_geral.GravarNovoRegistro(text_nome.Text, text_numero.Text);

            // Atualizar a lista de contatos
            ConstroiLista();

            // Prepera o quadro para um novo registro
            text_nome.Text = "";
            text_numero.Text = "";
            text_nome.Focus();
        }

        //====================================================================
        private void Lista_contatos_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Selecionar um contato

            // Verificar se indice = -1
            if (Lista_contatos.SelectedIndex == -1) return;

            // Seleciona um indice da lista
            indice = Lista_contatos.SelectedIndex;
            cmd_editar.Enabled = true;
            cmd_apagar.Enabled = true;
        }

        //====================================================================
        private void cmd_apagar_Click(object sender, EventArgs e)
        {
            // Apaga o registro selecionado

            //1º excluir o registro da lista
            cl_geral.LISTA_CONTATOS.RemoveAt(indice);

            //2º atualizar o ficheiro
            cl_geral.GravarArquivo();

            //3º reconstruir a lista de contatos
            ConstroiLista();
        }

        private void cmd_editar_Click(object sender, EventArgs e)
        {

        }
    }
}
