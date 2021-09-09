
/**
 * Escreva uma descrição da classe FuncIntegral aqui.
 * 
 * @author (seu nome) 
 * @version (um número da versão ou uma data)
 */
public class FuncIntegral extends Funcionario
{
    private double bas;
    
    /**
     * Construtor para objetos da classe FuncIntegral
     */
    public FuncIntegral(String nom, String ema, double bas)
    {
        //chamando / inicializando o construtor da classe pai
        super(nom, ema);
        this.bas = bas;
    }
    
    //método para realizar o cálculo do salário
    //utilizando a constante (TAX) herdada da super classe
    public double calcularSalario(){
        double sal = this.bas - (this.bas * this.TAX);
        return sal;
    }
}
