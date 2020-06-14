
// Robson Henrique Ferreira

import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class Main {
	public static void main(String[] args) {

		int a = 1;
		Scanner scanner = new Scanner(System.in);
		Map<String, String> dicionario = new TreeMap<String, String>();

		while (a == 1) {

			System.out.println("Digite uma palavra para ser procurada no dicionário:");

			String palavra = scanner.nextLine();

			String significado = dicionario.get(palavra);

			if (significado != null) {
				
				System.out.println(significado);

			} else {

				System.out.println("A palavra ainda não existe! Digite o significado para gravar no dicionário:");

				significado = scanner.nextLine();

				dicionario.put(palavra, significado);
			}

		}

		scanner.close();
	}
}
