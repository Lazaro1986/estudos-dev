/*
Faça um Programa que pergunte quanto você ganha por hora e o número de horas 
trabalhadas no mês. Calcule e mostre o total do seu salário no referido mês
*/
package Exercício6;

import java.util.Scanner;

public class Exercício6 {
    public static void main(String[] args){
        Scanner ler = new Scanner(System.in);
        System.out.println("Quantidade de horas trabalhadas");
        double quantHoras = ler.nextDouble();
        System.out.println("Valor da hora");
        double valorHora = ler.nextDouble();
        double salarioTotal = quantHoras*valorHora;
        System.out.println("Salário total no mês R$"+salarioTotal);
        
    }
    
}
