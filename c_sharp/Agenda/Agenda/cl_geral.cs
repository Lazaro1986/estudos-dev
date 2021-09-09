using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Agenda
{
    public static class cl_geral
    {
        public static string versao = "v 1.0.0";

        // Lista de contatos
        public static List<cl_contato> LISTA_CONTATOS;

        //====================================================================
        public static void ConstroiListaContatos()
        {
            // Método para carregamento da lista de contatos

            // Verificar se o arquivo existe
            string pasta_documentos = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            string nome_arquivo = pasta_documentos + @"/Arquivo_contatos.txt";

            // Cria a lista vazia
            LISTA_CONTATOS = new List<cl_contato>();

            if (File.Exists(nome_arquivo))
            {
                StreamReader arquivo = new StreamReader(nome_arquivo, Encoding.UTF8);

                // Caregar todos os contatos do arquivo
                while(!arquivo.EndOfStream)
                {
                    // Carrega nome
                    string nome = arquivo.ReadLine();
                    // Carrega numero
                    string numero = arquivo.ReadLine();

                    // Adicionar à lista de contatos os contato carregado
                    cl_contato novo_contato = new cl_contato();
                    novo_contato.nome = nome;
                    novo_contato.numero = numero;
                    LISTA_CONTATOS.Add(novo_contato);

                }

                arquivo.Dispose();
            }
        }

        //====================================================================
        public static void GravarNovoRegistro(string _nome, string _numero)
        {
            // Gravar um novo registro (na lista e no arquivo)

            // Gravar na lista
            /*
            cl_contato novo = new cl_contato();
            novo.nome = _nome;
            novo.numero = _numero;
            LISTA_CONTATOS.Add(novo);
            
            É o mesmo que:

            LISTA_CONTATOS.Add(
                new cl_contato()
                {
                    nome = _nome,
                    numero = _numero
                }
                );

            Que também é o mesmo que:
            */
            LISTA_CONTATOS.Add(new cl_contato() { nome = _nome, numero = _numero });

            // Atualiza arquivo
            GravarArquivo();
        }

        //====================================================================
        // Atualiza arquivo
        public static void GravarArquivo()
        {
            string pasta_documentos = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            string nome_arquivo = pasta_documentos + @"/Arquivo_contatos.txt";

            StreamWriter arquivo = new StreamWriter(nome_arquivo, false, Encoding.UTF8);
            foreach(cl_contato contato in LISTA_CONTATOS)
            {
                arquivo.WriteLine(contato.nome);
                arquivo.WriteLine(contato.numero);
            }
            arquivo.Dispose();
        }
    }
}
