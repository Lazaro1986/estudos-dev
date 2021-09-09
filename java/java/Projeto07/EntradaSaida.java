
/**
 * Classe auxiliar para exibição de janelas de diálogo
 * 
 * @author (Lázaro Josué)
 * @version (1.0)
 */

import javax.swing.*;

public class EntradaSaida{
    /**
     * Método que exibe uma janela de diálogo para receber
     * um texto e retornar esse texto
     * @param (String)
     * @return (String)
     */
    public static String receberString(String txt){
        String sval = JOptionPane.showInputDialog(txt);
        return sval;
    }
    
    /**
     * Método que exibe uma janela de diálogo para receber
     * um texto e converter para inteiro
     * @param (String)
     * @return (int)
     */
    public static int receberInt(String txt){
        String sval = receberString(txt);
        int ival = Integer.parseInt(sval);
        return ival;
    }
    
    /**
     * Método que exibe uma janela de diálogo para receber
     * um texto e converter para bouble
     * @param (String)
     * @return (double)
     */
    public static double retornaDbl(String txt){
        String sval = receberString(txt);
        double dval = Double.parseDouble(sval);
        return dval;
    }
    
    /**
     * Método que exibe uma janela de diálogo para exibir
     * um texto informado por parâmetro
     * @param (String)
     */
    public static void mostrarTexto(String txt){
        JOptionPane.showMessageDialog(null, txt);
    }
}
