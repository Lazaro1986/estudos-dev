
/**
 * Escreva uma descrição da classe TesteJanela aqui.
 * 
 * @author (seu nome) 
 * @version (um número da versão ou uma data)
 */

import javax.swing.*;

public class TesteJanela
{
    public static void main(String[] args){
        String sida;
        //SEMPRE virá um texto (String)
        sida = JOptionPane.showInputDialog("Digite sua idade");
        
        //mas eu posso usar uma classe para converter
        //nesse caso, converte uma String num formato de número
        //exemplo: "234" para 234
        int ida = Integer.parseInt(sida);
        
        String msg = "";
        if(ida >= 18){
            msg = "Ok. Tudo estabelecido";
        } else {
            msg = "Não teve sorte... oeee";
        }
        //mostra uma mensagem na janela de diáologo
        JOptionPane.showMessageDialog(null, msg);
    }
}
