package com.fernanda;

import javax.swing.JOptionPane;

import com.fernanda.entities.Empresa;
import com.fernanda.service.RH;

public class Application {

	public static String menu() {
		String menuText = "Menu:"
				+ "1) Cadastrar Funcionário"
				+ "2) Cadastrar Salário"
				+ "3) Exibir lista de bônus"
				+ "\n\n\n"
				+ "9) Sair ";
		return menuText;
	};
	
	
	public static void main(String[] args) {
		
		RH rh = new RH();
		Empresa emp = new Empresa(rh);
		
		for (int i = 0; i < 3; i++) {
			rh.adicionarFuncionario(emp.contratarFuncionario());
		}
		
		rh.mostrarBonusTodosFuncionarios();

	}

}
