
public enum Especie {
	Gato, Cachorro, Ave;
	
	private String especie = "";
	void nome(String nome) {
		especie = nome;
	}

	public String getEspecie() {
		return especie;
	}
	
}
