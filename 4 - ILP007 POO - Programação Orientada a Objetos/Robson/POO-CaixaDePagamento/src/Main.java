// ROBSON HENRIQUE FERREIRA

import java.util.HashMap;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		
		int a = 1;		
		
		HashMap<String, Forma> forma = new HashMap<String, Forma>();
		forma.put("1", new Forma("Pagamento em dinheiro: "));
		forma.put("2", new Forma("Pagamento em cartão de débito: "));
		forma.put("3", new Forma("Pagamento em cartão de crédito: "));
		forma.put("4", new Forma("Pagamento em cheque: "));
		forma.put("5", new Forma("Pagamento em deposito bancario: "));
		
		Scanner scanner = new Scanner(System.in);

		while (a == 1) {
			
			
			System.out.println("Qual é o valor a ser pago? ");
			
			Double valor = Double.valueOf(scanner.nextLine());
			
			System.out.println("Qual será a forma de pagamento? \nOpções:\n[1]Dinheiro\n[2]Cartão de Débito\n[3]Cartão de Crédito\n[4]Cheque\n[5]Depósito");
								
			String tipo = scanner.nextLine();
			
			Forma formaDePagamento = forma.get(tipo);
			
			System.out.println(formaDePagamento.forma +""+ valor);
			
		}
		scanner.close();
	}
}
