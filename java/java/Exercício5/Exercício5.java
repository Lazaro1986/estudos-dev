/*
 Faça um programa em Java que calcule a área de um círculo (Math.PI)
 */

package Exercício5;

import java.util.Scanner;

public class Exercício5 {
    public static void main(String[] args){
        Scanner ler = new Scanner(System.in);
        System.out.println("Informe a medida do raio:");
        float raio = ler.nextFloat();
        //double pi = 3.1415;
        double area = Math.PI*raio*raio;
        System.out.println("A área do círculo é "+area+"m2");
    }
    
}
