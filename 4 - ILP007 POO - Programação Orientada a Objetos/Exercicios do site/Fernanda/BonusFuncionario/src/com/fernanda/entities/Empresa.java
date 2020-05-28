package com.fernanda.entities;

import java.util.Scanner;

import javax.swing.JOptionPane;

import com.fernanda.service.RH;

public class Empresa {

	
	
	Funcionario func;
	
	Long contId = 1L;
	RH rh;

	public Empresa(RH rh) {
		this.rh = rh;
	}
	//nome, matricula, faltasNoAno, ultimaNotaAvaliacao a informação ID deve ser autoincrement
	
	public Funcionario contratarFuncionario() {
		String nome = JOptionPane.showInputDialog("Digite o nome do funcionário: ");
		String matricula = JOptionPane.showInputDialog("Número de matrícula: ");
		Integer faltas = Integer.parseInt(JOptionPane.showInputDialog("Faltas no ano:"));
		Float nota = Float.parseFloat(JOptionPane.showInputDialog("Última nota de avaliação: "));
		
		func = new Funcionario(contId, nome, matricula, null, faltas, nota, null, null, null, null);
		
		contId++;
		
		return func;
	}
}
