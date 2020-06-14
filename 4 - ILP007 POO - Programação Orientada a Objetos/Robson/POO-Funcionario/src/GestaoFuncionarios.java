// Robson Henrique Ferreira

import java.util.Scanner;

public class GestaoFuncionarios {

	int indice = 0;
	Funcionario[] funcionarios;
	int id = 0;
	Scanner scanner = new Scanner(System.in);

	GestaoFuncionarios() {
		funcionarios = new Funcionario[50];
	}

	public void criar() {

		id++;

		System.out.println("Digite o nome: ");
		String nome = scanner.nextLine();

		System.out.println("Digite o n� da Matricula: ");
		String matricula = scanner.nextLine();

		System.out.println("Digite a data de admiss�o: ");
		String admissao = scanner.nextLine();

		System.out.println("Digite a data de demissao: ");
		String demissao = scanner.nextLine();

		System.out.println("Digite o sal�rio: ");
		Float salario = Float.valueOf(scanner.nextLine());

		System.out.println("Digite o hor�rio: ");
		String horario = scanner.nextLine();

		Funcionario funcionario = new Funcionario(id, nome, matricula, admissao, demissao, salario, horario);

		funcionarios[indice] = funcionario;
		indice++;

	}

	public void exibir() {

		System.out.println("Digite a matr�cula do(s) funcion�rio(s) para exibir:");
		String matricula = scanner.nextLine();
		boolean ha = false;
		for (int i = 0; i < indice; i++) {
			if (funcionarios[i].matricula.equals(matricula)) {
				funcionarios[i].exibir();
				ha = true;
			}
		}
		if (ha == false) {
			System.out.println("N�o existe matr�cula");
		}
	}

	public void excluir() {

		System.out.println("Digite a matr�cula a ser exclu�da:");
		String matricula = scanner.nextLine();
		boolean ha = false;

		for (int i = 0; i < indice; i++) {
			if (funcionarios[i].matricula.equals(matricula)) {
				System.out.println("Funcion�rio exclu�do: "+funcionarios[i].nome);
				
				for (int j = i + 1; j < indice; j++) {
					
					funcionarios[i] = funcionarios[j];
					indice--;
					ha = true;
					
				}
				
			}

		}
		if (ha == false) {
			System.out.println("Matricula n�o encontrada.");
		}

	}

	public void atualizar() {

		System.out.println("Digite a matr�cula a ser atualizada: ");
		String matricula = scanner.nextLine();
		boolean ha = false;

		for (int i = 0; i < indice; i++) {
			if (funcionarios[i].matricula.equals(matricula)) {
				
				long id = funcionarios[i].id;
				
				System.out.println("Digite o nome: ");
				String nome = scanner.nextLine();
				
				System.out.println("Digite a data de admiss�o: ");
				String admissao = scanner.nextLine();

				System.out.println("Digite a data de demissao: ");
				String demissao = scanner.nextLine();

				System.out.println("Digite o sal�rio: ");
				Float salario = Float.valueOf(scanner.nextLine());

				System.out.println("Digite o hor�rio: ");
				String horario = scanner.nextLine();
				
				Funcionario funcionario = new Funcionario(id, nome, matricula, admissao, demissao, salario, horario);

				funcionarios[i] = funcionario;
													
			}
			
		}if (ha == false) {
			System.out.println("Matricula n�o encontrada.");
		}


	}

	public void menu() {
		while (true) {
			System.out.println("Digite a op��o: \n(C)riar\n(E)xibir\n(R)emover\n(A)tualizar\n(S)air");
			String textoMaiusculo = scanner.nextLine().toUpperCase();
			char letra = textoMaiusculo.charAt(0);
			switch (letra) {
			case 'C':
				criar();
				break;
			case 'E':
				exibir();
				break;
			case 'R':
				excluir();
				break;
			case 'A':
				atualizar();
				break;
			case 'S':
				System.exit(0);
			}
		}
	}
}