
/**
 * Classe para representar um objeto caneta e suas funcionalidades.
 * 
 * @author (Lázaro Josué) 
 * @version (1.0)
 */
public class Caneta
{
    //Características da canet
    //representadas pos variáveis
    String cor;
    int tamanho;
        
    //Método que ajusta a cor da tinta da caneta
    public void ajustarCor(String cor)
    {
        this.cor = cor;
    }
    
    //Método que ajusta o tamanho da ponta da caneta
    public void ajustarTamanho(int tamanho)
    {
        this.tamanho = tamanho;
    }
    
    //Funcionalidades da caneta
    //representadas pos métodos
    public void escrever(String txt)
    {
        System.out.println("Cor: " + this.cor);
        System.out.println("Tamanho da ponta: " + this.tamanho);
        System.out.println("Texto informado: " + txt);
    }
}
