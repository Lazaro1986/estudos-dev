
/**
 * Escreva uma descrição da classe Funcionario aqui.
 * 
 * @author (seu nome) 
 * @version (um número da versão ou uma data)
 */
public abstract class Funcionario
{
    //constante (final) que pode ser acessada
    //dentro da estrutura hierárquica (protected)
    protected final double TAX = 0.10;
    
    private String nom;
    private String ema;
    
    /**
     * Construtor para objetos da classe Funcionario
     */
    public Funcionario(String nom, String ema){
        this.nom = nom;
        this.ema = ema;
    }
    
    //construtor vazio
    public Funcionario(){
        
    }
    
    //método que ajusta o nome do funcionário
    public void setNome(String nom){
        this.nom = nom;
    }
    
    //método que retorna o nome do funcionário
    public String getNome(){
        return this.nom;
    }
    
    //método modelo para ser OBRIGATÓRIAMENTE implementado
    //nas subclasses (classes que herdam Funcionario)
    public abstract double calcularSalario();
}
