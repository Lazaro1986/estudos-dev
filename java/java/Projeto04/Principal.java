
/**
 * Exercício para treinar os recursos vistos até agora
 * - Classificação, organização dos atributos e métodos
 * - e também alguns recursos da linguagem (String, Arrays, etc)
 * 
 * @author (Lázaro Josué) 
 * @version (1.0)
 */
public class Principal
{
    public static void main(String[] args){
        //obter os dados que o usuário informa
        int ini = Tela.retornaInt("Informe um número inteiro:");
        int fim = Tela.retornaInt("Informe outro número inteiro:");
        
        //cria o objeto para o processamento
        Pares p = new Pares();
        String res = p.retornaNros(ini, fim);
        
        //saída com o resultado
        Tela.mostraTxt(res);
    }
}
