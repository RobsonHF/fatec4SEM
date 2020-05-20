import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collection;

public interface DicionarioManipulacaoArquivoI {
	
	public Collection<DicionarioPalavra> lerArquivo()  throws FileNotFoundException, IOException;
	public void escreverNoArquivo(DicionarioPalavra palavra)  throws FileNotFoundException, IOException;
		
	
	

}
