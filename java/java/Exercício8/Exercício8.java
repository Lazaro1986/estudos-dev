/*
Faça um Programa que peça a temperatura em graus Fahrenheit,
transforme e mostre a temperatura em graus Celsius
C = (5 * (F-32) / 9) 
 */
package Exercício8;

import java.util.Scanner;

public class Exercício8 {
    public static void main(String[] args){
        Scanner ler = new Scanner(System.in);
        System.out.println("Temperatura em Fahrenheit");
        float fahrenheit = ler.nextFloat();
        float celsius = (5*(fahrenheit-32)/9);
        // C = (F-32)/1,8
        // C = (F-32)*5/9
        System.out.println("A temperatura em Celsius é "+celsius+"°C");
    }
    
}
