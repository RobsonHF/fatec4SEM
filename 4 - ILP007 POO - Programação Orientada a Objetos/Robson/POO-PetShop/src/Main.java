// Robson Henrique Ferreira

public class Main {
	public static void main(String[] args) {

		Doenca catapora = new Doenca("catapora", "bolinhas vemelhas", "Brasil", "pitbull", "leve");
		Doenca dengue = new Doenca("dengue", "febre", "México", "siamês", "grave");

		Animal max = new Animal(catapora, "Max", 2, "pitbull", "cachorro");
		Animal mihau = new Animal(dengue, "Mihau", 3, "siamês", "gato");

		Dono robson = new Dono(max, "Robson", 25, 'm', "981344537");
		Dono anna = new Dono(mihau, "Anna", 24, 'f', "981452208");

		Veterinario casaDoPet = new Veterinario("Rua caçamboca, 40", true, true, "24843760");
		casaDoPet.clientes.add(robson);

		Veterinario cachorrinhoFeliz = new Veterinario("Rua das laranjas, 100", true, false, "24843761");
		cachorrinhoFeliz.clientes.add(anna);
		
		System.out.println(robson.pet);
	}
}
