
/**
 * Classe que representa o processamento aritmético
 * para operações simples - Calculadora Simples
 * 
 * @author (Lázaro Josué)
 * @version (1.0)
 */
public class Calculadora
{
    /**
     * Método que testa a operação e processa o cálculo aritmético
     */
    public static double exec(double n1, double n2, String op){
        double res = 0;
        if(op.equals("+")){
            res = n1 + n2;
        }
        else if(op.equals("-")){
            res = n1 - n2;
        }
        else if(op.equals("*")){
            res = n1 * n2;
        }
        else if(op.equals("/")){
            res = n1 / n2;
        }
        else {
            res = 0;
        }
        return res;
    }
}
