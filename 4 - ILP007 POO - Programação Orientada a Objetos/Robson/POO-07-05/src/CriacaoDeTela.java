import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;
import javafx.scene.text.Font;
import javafx.stage.Stage;

public class CriacaoDeTela extends Application {

	@Override
	public void start(Stage primaryStage) throws Exception {
		Pane painel = new Pane();
		Scene cena = new Scene(painel, 330, 200);
		
		Label titulo = new Label("Criação de Tela");
		painel.getChildren().add(titulo);
		titulo.relocate(20, 20);
		titulo.setStyle("-fx-font-size: 30");
		// dá pra usar CSS pra fazer a mudança da fonte com esse .setStyle
		Font fnt = new Font(30);
		titulo.setFont(fnt);
		//dá também pra mudar a partir de outras variáveis.
		
		Label lblTelefone = new Label("Coloque seu telefone:");
		painel.getChildren().add(lblTelefone);
		lblTelefone.relocate(20, 80);
		
		TextField tfTelefone = new TextField("(00)00000-0000");
		painel.getChildren().add(tfTelefone);
		tfTelefone.relocate(150, 80);

		Label lblUsername = new Label("Coloque seu nome:");
		painel.getChildren().add(lblUsername);
		lblUsername.relocate(20, 120);
		
		TextField tfUsername = new TextField("Joãozinho de Nazaré");
		painel.getChildren().add(tfUsername);
		tfUsername.relocate(150, 120);

		
		Button btnOk = new Button("OK");
		painel.getChildren().add(btnOk);
		btnOk.relocate(100, 160);
		
		Button btnCancel = new Button("Cancelar");
		painel.getChildren().add(btnCancel);
		btnCancel.relocate(200, 160);
		
		primaryStage.setScene(cena);
		primaryStage.show();
		primaryStage.setTitle("Robson Henrique Ferreira");
		
	}
	
	public static void main(String[] args) {
		Application.launch(CriacaoDeTela.class, args);
		
	}
}
