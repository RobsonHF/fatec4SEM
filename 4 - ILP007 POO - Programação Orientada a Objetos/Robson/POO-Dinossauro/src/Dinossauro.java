// Robson Henrique Ferreira

public class Dinossauro {
	
	int energia;
	int velocidade;
	int temperatura;
	boolean humor;
	
	
	
	public Dinossauro(int energia, int velocidade, int temperatura, boolean humor) {
		super();
		this.energia = energia;
		this.velocidade = velocidade;
		this.temperatura = temperatura;
		this.humor = humor;
	}

	public void pular() {
		if (energia > 0) {
			energia -= 1;
			humor = true;
			System.out.println("O dinossauro pulou, mas perdeu energia.");
			System.out.println("Humor do dinossauro: feliz.");
		} else {
			System.out.println("Sem energia para pular");
		}
	}

	public void correr() {
		if (energia > 0) {
			energia -= 1;
			humor = true;
			System.out.println("O dinossauro correu, mas perdeu energia.");
			System.out.println("Humor do dinossauro: feliz.");
		} else {
			System.out.println("Sem energia para correr.");
		}
	}

	public void comer() {
		energia += 1;
		humor = true;
		System.out.println("O dinossauro comeu e ganhou energia.");
		System.out.println("Humor do dinossauro: feliz");
	}

	public void atirar() {
		if (energia > 0) {
			energia -= 1;
			humor = true;
			System.out.println("O dinossauro atirou, mas diminuiu energia.");
			System.out.println("Humor do dinossauro: feliz.");
		} else {
			System.out.println("Sem energia para atirar.");
		}

	}

	public void tomarSol() {
		if (energia > 0) {
			velocidade += 1;
			energia -= 1;
			System.out.println("O dinossauro aumentou sua velocidade, mas perdeu energia.");
		} else {
			System.out.println("Sem energia para ganhar velocidade.");
		}
		humor = true;
		System.out.println("Humor do dinossauro: feliz.");
	}

	public void ficarNaSombra() {
		energia += 1;
		humor = false;
		System.out.println("O dinossauro descansou na sombra e ganhou energia.");
		System.out.println("Humor do dinossauro: TRISTE.");
	}
}
