import java.util.List;

public class CtrlVeterinario {
	public void adicionaVet(String nome, int crmv, boolean statusContrato, List<Especialidade> especializacoes) {
		Veterinario newVet = new Veterinario(nome, crmv, statusContrato, especializacoes);
	}

	public Veterinario buscaVet(int crmv) {		
		for(int i=0,i<veterinarios.lenght;i++) {
			if(veterinarios[i].crmv = crmv) {
				return veterinario;
			} 
		}		
	}
}
