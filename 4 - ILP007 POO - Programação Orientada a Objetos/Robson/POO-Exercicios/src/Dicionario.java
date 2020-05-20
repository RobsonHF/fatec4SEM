import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Dicionario extends Application {
	
	public DicionarioBusca dicionarioBusca;
	public DicionarioManipulacaoArquivo m;
	
	public static void main(String[] args) {
		Application.launch(Dicionario.class, args);

	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		
		
	
		dicionarioBusca = new DicionarioBusca();
		
		Scene cena = new Scene(dicionarioBusca);
		primaryStage.setScene(cena);
				
		
		primaryStage.setTitle("Dicionario");
		primaryStage.show();
		
	}

}
