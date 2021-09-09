
/**
 * Escreva uma descrição da classe FuncHorista aqui.
 * 
 * @author (seu nome) 
 * @version (um número da versão ou uma data)
 */
public class FuncHorista extends Funcionario
{
    private int qtd;
    private double val;
    
    /**
     * Construtor para objetos da classe FuncHorista
     */
    public FuncHorista(String nom, String ema, int qtd, double val)
    {
        //chamando o construtor da classe pai
        super(nom, ema);
        
        //inicialização de outras variáveis específicas da classe
        this.qtd = qtd;
        this.val = val;
    }
    
    //método para realizar o cálculo do salário
    //utilizando a constante (TAX) herdada da super classe
    public double calcularSalario(){
        double bas = this.qtd * this.val;
        double sal = bas - (bas * this.TAX);
        return sal;
    }
}
