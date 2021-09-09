
/**
 * Escreva uma descrição da classe ClienteVip aqui.
 * 
 * @author (seu nome) 
 * @version (um número da versão ou uma data)
 */
public class ClienteVip extends Cliente
{
    //variável que contém o llimite do cheque especial
    double limite = 3000;
    
    public ClienteVip(String n, String e, int i){
        super(n, e, i);
    }
    
    public void ajustarLimite(){
        this.limite += 1000;
    }
    
    public double retornarLimite(){
        return this.limite;
    }
}
