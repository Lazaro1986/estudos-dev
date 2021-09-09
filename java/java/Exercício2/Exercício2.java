/*
Escreva um programa que leia o nome e o sobrenome de uma pessoa 
separadamente e mostre uma mensagem, “Bem vindo Nome Sobrenome”.
 */
package Exercício2;

import java.util.Scanner;

public class Exercício2 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);
        System.out.println("Digite seu nome:");
        String nome = ler.nextLine();
        System.out.println("Digite seu sobrenome:");
        String sobrenome = ler.nextLine();
        System.out.println("Bem vindo "+nome+" "+sobrenome);
    }
    
}
