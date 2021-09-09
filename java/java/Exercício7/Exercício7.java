/*
Faça uma classe Java que leia a altura e o peso de uma pessoa e 
calcule seu IMC 
IMC = peso/altura²
 */
package Exercício7;

import java.util.Scanner;

public class Exercício7 {
    public static void main(String[] args){
        Scanner ler = new Scanner(System.in);
        System.out.println("Altura");
        float altura = ler.nextFloat();
        System.out.println("Peso");
        float peso = ler.nextFloat();
        float imc = peso/(altura*altura);
        System.out.println("IMC = "+imc);
    }
      
}
