// Robson Henrique Ferreira

public class Main {
	
	public static void main(String[] args) {
		
		System.out.print(transformaCalendario(5, 8, 2016));
	}

	public static int transformaCalendario(int dia, int mes, int ano) {
		
		int dataGregoriano = dia + mes + ano;
		int baseGregoriano = 15 + 10 + 1582;
		
		if (mes < 3) {
			ano -= 1;
			mes += 12;
		}
		
		double dataJuliano = 0;
		
		if (dataGregoriano >= baseGregoriano) {
			double a = ano / 100;
			double b = a / 4;
			double c = 2 - a + b;
			double d = 365.25 * (ano + 4716);
			double e = 30.6001 * mes + 1;
			dataJuliano = (d + e + dia + 0.5 + c - 1524.5) + 30;
		}

		if (dataJuliano % 1 == 0) {
			dataJuliano -= 1;
		}

		return (int) dataJuliano;
	}
}