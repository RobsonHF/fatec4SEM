
public enum Especialidade {
	Oftalmologia, Cardiologia, ClinicoGeral, Dermatologia, Nutricao, Odontologia;
	
	private String especialidade = "";
	void nome(String nome) {
		especialidade = nome;
	}

	public String getEspecie() {
		return especialidade;
	}
	
}
