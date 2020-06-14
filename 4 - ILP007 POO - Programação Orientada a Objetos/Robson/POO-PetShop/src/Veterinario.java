import java.util.ArrayList;

public class Veterinario {
	ArrayList<Dono> clientes;
	String endereco;
	boolean aberto;
	boolean aceitaPetGrande;
	String telefone;
	
		
	public Veterinario(String endereco, boolean aberto, boolean aceitaPetGrande,
			String telefone) {
		super();

		this.endereco = endereco;
		this.aberto = aberto;
		this.aceitaPetGrande = aceitaPetGrande;
		this.telefone = telefone;
	}

	public void trabalhar() {
		System.out.println("trabalhou");
	}

	
}


