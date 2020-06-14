// Robson Henrique Ferreira

public class Funcionario {

	long id;
	String nome;
	String matricula;
	String admissao;
	String demissao;
	Float salario;
	String horario;

	public Funcionario(long id, String nome, String matricula, String admissao, String demissao, Float salario,
			String horario) {
		super();
		this.id = id;
		this.nome = nome;
		this.matricula = matricula;
		this.admissao = admissao;
		this.demissao = demissao;
		this.salario = salario;
		this.horario = horario;
	}

	public void exibir() {
		System.out.println("----------------------------------\nDados do funcionário: \n" + "Funcionario id: " + id + "\n" + "Nome: " + nome + "\n"
				+ "Matricula: " + matricula + "\n" + "Admissão: " + admissao + "\n" + "Demissão: " + demissao + "\n"
				+ "Salario: " + salario + "\n" + "Horario: " + horario);
	}
}