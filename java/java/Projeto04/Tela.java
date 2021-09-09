
/**
 * Escreva uma descrição da classe Tela aqui.
 * 
 * @author (seu nome) 
 * @version (um número da versão ou uma data)
 */

import javax.swing.*;

public class Tela
{
    /**
     * 
     */
    public static int retornaInt(String txt){
        //usa o método do Java para abrir uma janela de diálogo
        //sempre retorna uma String
        String snum = JOptionPane.showInputDialog(txt);
        
        //converter uma String para número
        int inum = Integer.parseInt(snum);
        
        //retornar para quem usa esse método
        return inum;
    }
    
    /**
     * 
     */
    public static void mostraTxt(String txt){
        //mostra na janela de diálogo o texto informado
        JOptionPane.showMessageDialog(null, txt);
    }
}
