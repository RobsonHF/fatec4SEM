public enum Exame {
	Vista, Audicao, Alergia, Movimento, Feses, Sangue, Cardiologia, ClinicoGeral, Dermatologia, Nutricao, Odontologia;
	
	private String exame = "";
	void nome(String nome) {
		exame = nome;
	}

	public String getEspecie() {
		return exame;
	}
	
}
