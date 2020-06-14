// Robson Henrique Ferreira

public class Main {
	public static void main(String[] args) {
		
		Piloto robson = new Piloto("Robson", "1111", 25, 5, false);		
		Piloto anna = new Piloto("Anna", "2222", 24, 5, false);
				
		Passageiro joaozinho = new Passageiro("Little Joao", 10, 'm', true, "primeira");		
		Passageiro maria = new Passageiro("Big Maria", 30, 'f', false, "primeira");
		
		Passageiro[] passageiros1 = {joaozinho};		
		Passageiro[] passageiros2 = {maria};
	
		Aeronave boing = new Aeronave(robson, passageiros1);
		Aeronave boing2 = new Aeronave(anna, passageiros2);
		
		Aeronave[] aeronaves1 = {boing};
		Aeronave[] aeronaves2 = {boing2};
		
		Aeroporto Guarulhos = new Aeroporto(aeronaves1);
		Aeroporto Congonhas = new Aeroporto(aeronaves2);


	}
}