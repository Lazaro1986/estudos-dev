
/**
 * Escreva uma descrição da classe Principal aqui.
 * 
 * @author (seu nome) 
 * @version (um número da versão ou uma data)
 */

import java.util.*;

public class Principal
{
    public static void main(String[] args){
        String res = "sim";
        int opt = 0;
        
        while(res.equalsIgnoreCase("sim")){
            opt = EntradaSaida.receberInt("1: cad, 2: pesq, 3: limite");
            switch(opt) {
                case 1:
                    Sistema.cadastrarCliente();
                    break;
                case 2:
                    Sistema.pesquisarCliente();
                    break;
                case 3:
                    Sistema.aumentarLimite();
                    break;
                default:
                    EntradaSaida.mostrarTexto("Entrada Inválida");
            }
            res = EntradaSaida.receberString("Continuar?");
        }
    }
}
