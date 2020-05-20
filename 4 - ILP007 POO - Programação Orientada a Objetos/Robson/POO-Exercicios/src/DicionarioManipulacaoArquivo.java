import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Collection;

public class DicionarioManipulacaoArquivo implements DicionarioManipulacaoArquivoI {

	@Override
	public Collection<DicionarioPalavra> lerArquivo() throws FileNotFoundException, IOException {
		
		File arquivo = new File("dicionario.txt");
		FileReader fr;
		

			fr = new FileReader(arquivo);
			BufferedReader br = new BufferedReader(fr);
		
			String s;
			
			while ((s = br.readLine()) != null) {
				DicionarioPalavra palavra = new DicionarioPalavra(s, null);
				s = br.readLine();
				palavra.setDefinicao(s);
			}
			br.close();
					

		return null;
	}

	@Override
	public void escreverNoArquivo(DicionarioPalavra palavra)  throws FileNotFoundException, IOException{
		
		File arquivo = new File("dicionario.txt");
		FileWriter fw;
		
		fw = new FileWriter(arquivo);
		BufferedWriter bw = new BufferedWriter(fw);
		
		bw.write(palavra.getPalavra());
		bw.newLine();
		bw.write(palavra.getPalavra());
		
		bw.close();
		

		
	}
	
	
	

}
