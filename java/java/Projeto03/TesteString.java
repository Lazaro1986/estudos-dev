
/**
 * Escreva uma descrição da classe TesteString aqui.
 * 
 * @author (seu nome) 
 * @version (um número da versão ou uma data)
 */
public class TesteString
{
    public static void main(String[] args){
        //String é uma classe do Java
        //portanto, as variáveis são "objetos"...
        
        String texto1 = "texto de teste e coisa e tal";
        String texto2 = new String("outro texto bla bla bla");
        
        System.out.println(texto1.toUpperCase()); //passa o texto todo para letras maiúsculas
        System.out.println(texto1.substring(5,10)); //mostra a partir do caracter na posição 5 até a posição 10
        System.out.println(texto1.equals("asdf")); //compara o texto da variável 'texto1' se é igual ao parametro informado
        System.out.println(texto1.charAt(15)); //qual o caracter na posição 15
        
        //declaramos um vetor (array) usando colchetes
        //no Java, temos vetor com tipos definidos
        String[] vetor = texto1.split(" "); // divide em pedaços cada vez que encontra o espaço em branco
        System.out.println(vetor[4]);
    }
}
