
/**
 * Classe que representa os atributos e métodos de um Monitor de Computador
 * 
 * @author (Lázaro Josué) 
 * @version (1.0)
 */
public class Monitor
{
    //atributos do monitor
    private int reso;
    private String tipo;
    private String sep;
    
    //metodo construtor - para inicializar os dados do objeto
    public Monitor(){
        this.tipo = "LED";
        this.ajustarReso(1024);
    }
    
    //metodos auxilliares para ajustar os atributos
    
    //metodo que exibe uma mensagem ao ligar o monitor
    public void ligar(){
        System.out.println("Ligando monitor... OK");
        System.out.println("");
    }
    
    //metodo que exibe uma mensagem na tela
    public void exibirMsg(String txt){
        System.out.println("");
        System.out.println(this.sep);
        System.out.println("Resolução atual: " + this.reso);
        System.out.println(txt);
        System.out.println(this.sep);
        System.out.println("");
    }
    
    //metodo para ajustar a resolucao do monitor
    public void ajustarReso(int reso){
         if(reso != 1024 && reso != 1280 && reso != 1600){
             this.reso = 1024;
         }
         else{
             this.reso = reso;
         }
         this.ajustarSep();
    }
    
    //metodo que exibe uma mensagem ao desligar o monitor
    public void desligar(){
        System.out.println("");
        System.out.println("Desligando o monitor... Até mais...");
    }
    
    //metodo para ajustar o simbolo que representa a resolução
    private void ajustarSep(){
        String sep = "";
        int qtd = (int) (this.reso/100);
        for(int i = 0; i < qtd; i++){
            sep += "-";
        }
        this.sep = sep;
    }
}
