/*
Escreva uma classe Java que leia e imprima a
soma e a multiplicação de dois números.
*/
package Exercício9;

import java.util.Scanner;

public class Exercício9 {
    public static void main(String[] args){
        Scanner ler = new Scanner(System.in);
        System.out.println("Informe um primeiro numero");
        int num1 = ler.nextInt();
        System.out.println("Informe um segundo número");
        int num2 = ler.nextInt();
        int soma = num1+num2;
        int mult = num1*num2;
        System.out.println(num1+" + "+num2+" = "+soma);
        System.out.println(num1+" * "+num2+" = "+mult);
    }
    
}
