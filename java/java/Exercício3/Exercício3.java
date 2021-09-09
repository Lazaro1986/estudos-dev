/*
Faça uma classe Java que peça as 4 notas bimestrais e mostre a média
 */
package Exercício3;

import java.util.Scanner;

public class Exercício3 {
    public static void main(String[] args){
        Scanner ler = new Scanner(System.in);
        System.out.println("Informe a nota do primeiro bimestre:");
        float nota1 = ler.nextFloat();
        System.out.println("Informe a nota do segundo bimestre:");
        float nota2 = ler.nextFloat();
        System.out.println("Informe a nota do terceiro bimestre:");
        float nota3 = ler.nextFloat();
        System.out.println("Informe a nota do quarto bimestre:");
        float nota4 = ler.nextFloat();
        float media = (nota1+nota2+nota3+nota4)/4;
        System.out.println("A média obtida foi "+media);
    }
    
}
