// ROBSON HENRIQUE FERREIRA

import java.util.Scanner;

// ROBSON HENRIQUE FERREIRA

public class Empresa {
	
	RH rh;

	public Empresa() {
		this.rh = new RH();
	}
	
	public Funcionario contratarFuncionario() {
		
		long id = 1;
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Coloque as características do funcionário.");
		
		System.out.println("Nome: ");
		String nome = scanner.nextLine();
		
		System.out.println("Matricula: ");
		String matricula = scanner.nextLine();
		
		System.out.println("Faltas no ano: ");
		int faltasNoAno = Integer.valueOf(scanner.nextLine());
		
		System.out.println("Ultima nota de avaliacao: ");
		float ultimaNotaAvaliacao = Float.valueOf(scanner.nextLine());
		
		Funcionario funcionario = new Funcionario(id++, nome, matricula, 0, faltasNoAno, ultimaNotaAvaliacao, 0, false, null, null);
					
		return funcionario;
	}
	
	public static void main (String[] Args) {
		Empresa empresa = new Empresa();
		
		for (int i=0;i<5;i++) {
			Funcionario funcionario = empresa.contratarFuncionario();
			
			empresa.rh.adicionarFuncionario(funcionario);
		}
		
		empresa.rh.mostrarBonusTodosFuncionarios();
	}
	

}
