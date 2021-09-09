
/**
Classe Principal de início do sistema.
 * 
 * @author (Lázaro Josué) 
 * @version (1.0)
 */
public class Principal
{
    public static void main(String[] args){
        //criação do objeto Monitor
        Monitor m1 = new Monitor();
        
        //uso dos métodos disponíveis
        m1.ligar();
        m1.exibirMsg("Opa, olá pessoal!");
        m1.ajustarReso(1600);
        m1.exibirMsg("Outra mensagem legal...");
        m1.desligar();
    }
}
