package com.fernanda.service;

import java.util.Set;

import com.fernanda.entities.Funcionario;

public class RH {

	private Set<Funcionario> funcionarios;
	private double bonus;
	
	public Double valorBonus(Funcionario func) {
		if (func.getFaltasNoAno() < 2) {
			bonus = 0.3;
		}
		if (func.getFaltasNoAno() >=2 && func.getFaltasNoAno() < 4) {
			bonus = 0.15;
		}
		if (func.getFaltasNoAno() >= 4) {
			bonus = 0.05;
		}
		return bonus;
	}
	
	public void mostrarBonusTodosFuncionarios() {
		for (Funcionario f : funcionarios) {
			System.out.println(valorBonus(f));
		}
	}
	
	public void adicionarFuncionario (Funcionario func) {
		funcionarios.add(func);
	}
	
	public void removerFuncionario (Funcionario func) {
		funcionarios.remove(func);
	}
}
