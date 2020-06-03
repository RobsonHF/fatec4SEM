import java.util.Date;

import javax.swing.JOptionPane;

public class Aluno {
	
	long id;
	String nome;
	String ra;
	Date nascimento;
	

	public Aluno(long id, String nome, String ra, Date nascimento) {
		super();
		this.id = id;
		this.nome = nome;
		this.ra = ra;
		this.nascimento = nascimento;
	}


	public void exibir() {
	//mostrar dados do aluno na tela	
		JOptionPane.showMessageDialog(null, "ID: " + id + "\nNome: " + nome + "\nRA: " + ra + "\nNascimento: " + nascimento);
	}
		
	

}
