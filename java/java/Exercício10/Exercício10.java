/*
Escreva um programa que calcule a área e
o perímetro de um quadrado 
*/
package Exercício10;

import java.util.Scanner;

public class Exercício10 {
    public static void main(String[] args){
        Scanner ler = new Scanner(System.in);
        System.out.println("Informe o valor do lado do quadrado");
        int lado = ler.nextInt();
        System.out.println("A area de um quadrado de lado "+lado+" é "+(lado*lado));
        System.out.println("O perímetro de um quadrado de lado "+lado+" é "+(lado*4));
    }
    
}
