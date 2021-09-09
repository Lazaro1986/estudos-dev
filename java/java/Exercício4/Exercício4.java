/*
Escreva uma classe Java que converta metros para centímetros
*/
package Exercício4;

import java.util.Scanner;

public class Exercício4 {
    public static void main(String[] args){
    Scanner ler = new Scanner(System.in);
    System.out.println("Informe a medida em metros:");
    int metro = ler.nextInt();
    int centimetro = metro*100;
    System.out.println(metro+"m equivalem a "+centimetro+"cm");
    }
}
