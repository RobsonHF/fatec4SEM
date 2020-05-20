
public class DicionarioPalavra {
	
	private String palavra;
	private String definicao;
	
	public DicionarioPalavra (String palavra, String definicao){
		this.palavra = palavra;
		this.definicao = definicao;
		
	}

	public String getPalavra() {
		return palavra;
	}

	public void setPalavra(String palavra) {
		this.palavra = palavra;
	}

	public String getDefinicao() {
		return definicao;
	}

	public void setDefinicao(String definicao) {
		this.definicao = definicao;
	}

}
