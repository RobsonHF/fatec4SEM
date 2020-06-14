
// Robson Henrique Ferreira

import java.util.Scanner;

public class Teste {

	public static void main(String[] args) {

		Dinossauro skeep = new Dinossauro(10, 10, 100, true);
		Scanner scan = new Scanner(System.in);
		int a = 1;

		while (a == 1) {
			System.out.println("Características do dinossauro: \n" + "energia: " + skeep.energia + "\n" + "velocidade: "
					+ skeep .velocidade + "\n" + "temperatura: " + skeep.temperatura + "\n" + "humor: " + skeep.humor);
			System.out.println(" (P)ular \n (C)orrer \n Co(M)er \n (A)tirar \n Tomar (S)ol \n Ficar na S(O)mbra");
			String textoMaiusculo = scan.nextLine().toUpperCase();
			char letra = textoMaiusculo.charAt(0);
			switch (letra) {
			case 'P':
				skeep.pular();
				break;
			case 'C':
				skeep.correr();
				break;
			case 'M':
				skeep.comer();
				break;
			case 'A':
				skeep.atirar();
				break;
			case 'S':
				skeep.tomarSol();
				break;
			case 'O':
				skeep.ficarNaSombra();
				break;
			default: System.out.println("Coloque uma opção válida");
			scan.close();
			}
			
		}
	}
}
