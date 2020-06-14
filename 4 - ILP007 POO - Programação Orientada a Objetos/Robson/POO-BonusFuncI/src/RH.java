// ROBSON HENRIQUE FERREIRA

import java.util.List;

public class RH {
	private List<Funcionario> funcionarios;

	public double valorBonus(Funcionario funcionario) {
		
		int faltas = funcionario.getFaltasNoAno();
		double bonus;
		
		if (faltas < 2) {
			bonus = 0.3;
			
		} else if (faltas < 5) {
			bonus = 0.15;
			
		} else {
			bonus = 0.05;
		}
		
		return bonus;
	}

	public void mostrarBonusTodosFuncionarios() {
		
		for (Funcionario funcionario : funcionarios) {
			
			double bonus = valorBonus(funcionario);
			
			System.out.println("Nome do funcionário: " + funcionario.getNome() + "\nBonus Calculado: "+ bonus*100+"%.");
		}
	}

	public void adicionarFuncionario(Funcionario f) {
		
		funcionarios.add(f);
	}

	public void removerFuncionario(Funcionario f) {
		
		funcionarios.remove(f);
	}

}
