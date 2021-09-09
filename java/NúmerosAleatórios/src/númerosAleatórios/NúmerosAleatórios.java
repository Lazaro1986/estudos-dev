
package númerosAleatórios;

import java.util.Random;

public class NúmerosAleatórios {
    public static void main(String[] args) {
        //instância um objeto da classe Random usando o construtor padrão
        Random gerador = new Random();
        //imprime sequência de 10 números inteiros aleatórios
        for (int i = 0; i < 100; i++) {
            System.out.println(gerador.nextInt());
        }
        //imprime sequência de 10 números inteiros aleatórios limitados até 100
        for (int i = 0; i < 100; i++) {
            System.out.println(gerador.nextInt(100));
        }
    }
    
}
