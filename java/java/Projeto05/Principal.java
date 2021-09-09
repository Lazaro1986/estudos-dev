
/**
 * Sistema que faz uma operação aritmética simples
 * - REcebe 2 números e um operador e mostra o resultado
 * - CALCULADORA SIMPLES
 * 
 * @author (Lázaro Josué)
 * @version (1.0)
 */
public class Principal
{
    public static void main(String[] args){
        /**
         * Métod Principal
         */
        double n1 = Tela.retornaDbl("Informe um valor:");
        double n2 = Tela.retornaDbl("Informe outro valor:");
        String op = Tela.retornaTxt("Operação: (+, -, *, /)");
        
        double res = Calculadora.exec(n1, n2, op);
        
        Tela.mostraTxt("Resultado: " + res);
    }
}
