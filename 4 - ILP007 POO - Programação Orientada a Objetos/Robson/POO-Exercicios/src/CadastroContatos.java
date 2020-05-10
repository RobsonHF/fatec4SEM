import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

// Author: Robson Henrique Ferreira

public class CadastroContatos extends Application {
	
	public static void main(String[] args) {
		Application.launch(CadastroContatos.class, args);

	}


	@Override
	public void start(Stage primaryStage) throws Exception {
		GridPane gridPane = new GridPane();
		gridPane.setPrefSize(2, 4);
		gridPane.setHgap(2);
		gridPane.setVgap(5);
		gridPane.setPadding(new Insets(20));
		
		FlowPane flowPane = new FlowPane();
		flowPane.setHgap(10);
				
		Label lblId = new Label("Id: ");
		TextField txtId = new TextField();
		txtId.setPromptText("666666");
		
		Label lblNome = new Label("Nome: ");
		TextField txtNome = new TextField();
		txtNome.setPromptText("Robson Henrique Ferreira");
		
		Label lblTelefone = new Label("Telefone: ");
		TextField txtTelefone = new TextField();
		txtTelefone.setPromptText("(11) 98134-4537");
		
		Button btnSalvar = new Button("Salvar");
		Button btnPesquisar = new Button("Pesquisar");
		
		Label lblAutor = new Label("Author: Robson Henrique Ferreira");
		
		gridPane.add(lblId, 0, 0);
		gridPane.add(txtId, 1, 0);
		gridPane.add(lblNome,  0, 1);
		gridPane.add(txtNome, 1, 1);
		gridPane.add(lblTelefone,  0, 2);
		gridPane.add(txtTelefone, 1, 2);
		gridPane.add(flowPane, 1, 3);
		flowPane.getChildren().add(btnPesquisar);
		flowPane.getChildren().add(btnSalvar);
		flowPane.getChildren().add(lblAutor);
				
		Scene cena = new Scene(gridPane, 500, 160);
		
		primaryStage.setScene(cena);
		primaryStage.setTitle("Cadastro de Contatos");
		primaryStage.show();
		


		
	}

	

}
