package controller;

import java.util.List;

import model.Funcionario;

public class RH {

	private List<Funcionario> funcionarios;
	
	public Double valorBonus(Funcionario funcionario) {
		if (funcionario.getFaltasNoAno() < 2) return funcionario.getSalario() * 0.3;
		else if (funcionario.getFaltasNoAno() < 5) return funcionario.getSalario() * 0.15;
		return funcionario.getSalario() * 0.05;
	}
	
	public void mostrarTodosOsFuncionarios() {
		for (Funcionario f : funcionarios) {
			System.out.println("ID: " + f.getId()
							 + "\nNome: " + f.getNome()
							 + "\nMatrícula: " + f.getMatricula()
							 + "\nSalario: " + f.getSalario()
							 + "\nFaltas no ano: " + f.getUltimaNotaAvaliacao()
							 + "\n");
			
		}
	}
	
	public void adicionarFuncionario(Funcionario f) {
		funcionarios.add(f);
	}
	
	public void removerFuncionari(Funcionario f) {
		funcionarios.remove(f);
	}	
}