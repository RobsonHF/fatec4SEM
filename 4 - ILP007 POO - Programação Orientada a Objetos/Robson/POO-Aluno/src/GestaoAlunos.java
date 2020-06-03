import java.awt.HeadlessException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.JOptionPane;

public class GestaoAlunos {

	static int indice = 0;
	static Aluno[] alunos;

	public static void criar() throws HeadlessException, ParseException {
		JOptionPane.showMessageDialog(null, "Coloque as característica para o aluno: ");
		long id = Long.parseLong(JOptionPane.showInputDialog("ID: "));
		String nome = JOptionPane.showInputDialog("Nome: ");
		String ra = JOptionPane.showInputDialog("RA: ");
		Date nascimento = new SimpleDateFormat("dd/MM/yyyy").parse(JOptionPane.showInputDialog("Data de Nascimento: "));

		alunos[indice] = new Aluno(id, nome, ra, nascimento);
		indice++;
	}

	public static void atualizar() throws HeadlessException, ParseException {
		String raDigitado = JOptionPane.showInputDialog("Digite o número do RA para atualizar: ");
		for (int i = 0; i < alunos.length; i++) {
			if (alunos[i].ra == raDigitado) {

				alunos[i].nascimento = new SimpleDateFormat("dd/MM/yyyy")
						.parse(JOptionPane.showInputDialog("Nova data de nascimento: "));
				alunos[i].nome = JOptionPane.showInputDialog("Novo nome: ");

			}

		}

	}

	public static void excluir() {
		String raDigitado = JOptionPane.showInputDialog("Digite o número do RA para excluir: ");
		for (int i = 0; i < alunos.length; i++) {
			if (alunos[i].ra == raDigitado) {
				alunos[i].id = 0;
				alunos[i].nascimento = new Date(00 / 00 / 0000);
				alunos[i].nome = "Aluno excluido da base!!!";
				alunos[i].ra = "";

			}

		}

	}

	public static void exibir() {
		String raDigitado = JOptionPane.showInputDialog("Digite o número do RA para exibir: ");
		for (int i = 0; i < alunos.length; i++) {
			if (alunos[i].ra == raDigitado) {
				JOptionPane.showMessageDialog(null, alunos[i]);
			}

		}

	}

	public static void menu() throws HeadlessException, ParseException {
		String tecla = "n";
		while (tecla != "S") {
			JOptionPane.showMessageDialog(null,
					"Aperte uma tecla: "+ "\n" + "'C' para Cadastrar um aluno; " + "\n" + "'E' para exibir um aluno; \n'R' para Remover um aluno; \n'A' para Atualizar um aluno; \n'S' para Sair. ");
			tecla = JOptionPane.showInputDialog("Escreva sua opção: ").toUpperCase();
			switch (tecla) {
			case "C":
				criar();
				break;
			case "E":
				exibir();
				break;
			case "R":
				excluir();
				break;
			case "A":
				atualizar();
				break;
			case "S":
				break;
			}
		}

	}

	public static void main(String[] args) throws HeadlessException, ParseException {
		menu();
	}
}
