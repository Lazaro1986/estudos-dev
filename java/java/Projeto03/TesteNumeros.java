
/**
 * Escreva uma descrição da classe TesteNumeros aqui.
 * 
 * @author (seu nome) 
 * @version (um número da versão ou uma data)
 */
public class TesteNumeros
{
    public static void main(String[] args){
        //no Java temos as classes que representam os tipos
        //para fazermos conversões e etc...
        String snro = "1234";
        int inro = Integer.parseInt(snro);
        float fnro = Float.parseFloat(snro);
        double dnro = Double.parseDouble(snro);
        
        //dá para fazer ao contrário também
        int ival = 9876;
        String sval = Integer.toString(ival);
        
        //e temos a classe "Math" para outras funções aritméticas
        System.out.println(Math.pow(2,3)); //POTÊNCIA
        System.out.println(Math.sqrt(25)); //RAIZ QUADRADA
        System.out.println(Math.sin(90)); //SENO
        System.out.println(Math.E); //CONSTANTE
        System.out.println(Math.PI); //CONSTANTE
    }
}
