/*
Escreva uma classe Java que peça um número e então mostre a mensagem ''O número informado foi [número]''
*/
package Exercício1;

import java.util.Scanner;

public class Exercício1 {
    public static void main(String[] args) {
        Scanner obter = new Scanner(System.in);
        System.out.print("Digite um número: ");
        int número = obter.nextInt();
        System.out.println("O número digitado foi "+número);
    }
    
}
