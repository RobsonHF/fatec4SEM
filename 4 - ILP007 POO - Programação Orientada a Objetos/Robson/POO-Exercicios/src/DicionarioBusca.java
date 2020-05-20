import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collection;

import javafx.geometry.Insets;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;

public class DicionarioBusca extends FlowPane {
	
	private TextField txtBusca;
	private Button btnBusca;
	private DicionarioManipulacaoArquivo m;

	
	public DicionarioBusca() {
		
		this.setWidth(400);
		this.setHeight(200);
		this.setHgap(10);
		this.setPadding(new Insets(20));

		this.txtBusca = new TextField();
		this.txtBusca.setPromptText("Digite uma palavra");
		this.btnBusca = new Button("Buscar");
		
		btnBusca.setOnAction((e) -> {
			
			m = new DicionarioManipulacaoArquivo();
			
			try {
				Collection<DicionarioPalavra> dicionario = m.lerArquivo();
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String textoBusca = txtBusca.getText();
			
		});
		
		this.getChildren().addAll(txtBusca, btnBusca);
		
	
	}

}
