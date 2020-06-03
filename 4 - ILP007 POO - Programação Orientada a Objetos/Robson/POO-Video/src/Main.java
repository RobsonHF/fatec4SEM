import java.util.Arrays;

public class Main {

	public static void main(String[] args) {
		int[] vetor = { 3, 5, 6, 2, 4, 8, 1, 7 };
		int[] auxiliar = new int[vetor.length];

		mergeSort(vetor, auxiliar, 0, vetor.length - 1); // zero do indice e length do indice

		System.out.println(Arrays.toString(vetor));

	}

	private static void mergeSort(int[] vetor, int[] auxiliar, int inicio, int fim) {

		if (inicio < fim) {
			int meio = (inicio + fim) / 2;
			mergeSort(vetor, auxiliar, inicio, meio);
			mergeSort(vetor, auxiliar, meio + 1, fim);
			intercalar(vetor, auxiliar, inicio, meio, fim);
		}

	}

	private static void intercalar(int[] vetor, int[] auxiliar, int inicio, int meio, int fim) {
		for (int i = inicio; i <= fim; i++) {
			auxiliar[i] = vetor[i];
		}

		int e = inicio; // que vai varrer primeira metade do vetor
		int d = meio + 1; // para varrer a segunda metade do vetor

		for (int i = inicio; i <= fim; i++) {
			if (e > meio)
				vetor[i] = auxiliar[d++];
			else if (d > fim)
				vetor[i] = auxiliar[e++];
			else if (auxiliar[e] < auxiliar[d])
				vetor[i] = auxiliar[e++];
			else
				vetor[i] = auxiliar[d++];
		}
	}

}
