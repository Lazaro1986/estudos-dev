
/**
 * Classe que inicializa o sistema
 * 
 * @author (Lázaro Josué) 
 * @version (1.0)
 */
public class Principal
{
    public static void main(String[] args){
        Funcionario func = null;
        
        String nom = Tela.retornaTxt("Nome");
        String ema = Tela.retornaTxt("E-mail");
        
        String tip = Tela.retornaTxt("H - Horista | I - Integral");
        if(tip.equals("H")){
            int qtd = Tela.retornaInt("Qtd de horas");
            double val = Tela.retornaDbl("Valor hora");
            func = new FuncHorista(nom, ema, qtd, val);
        }
        
        if(tip.equals("I")){
            double sal = Tela.retornaDbl("Salário base");
            func = new FuncIntegral(nom, ema, sal);
        }
        
        //a ideia é usar os métodos da forma mais "genérica"
        //sem fazer distinçao se é horista ou integral
        double sal = func.calcularSalario();
        nom = func.getNome();
        Tela.mostraTxt(nom + " seu salário será: " + sal);
    }
}
