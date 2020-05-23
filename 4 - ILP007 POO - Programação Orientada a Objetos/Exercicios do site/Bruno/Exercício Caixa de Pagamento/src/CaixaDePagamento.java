import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class CaixaDePagamento extends Application {

	public static void main(String[] args) {
		Application.launch(CaixaDePagamento.class, args);
	}

	@Override
	public void start(Stage stage) throws Exception {
		
		Label lblPagamento = new Label("Pagamento:");
		TextField txtPagamento = new TextField();
		
		
		
		VBox vBox = new VBox();
		
		
		
		
		
		Group grupo = new Group(vBox);
		Scene cena = new Scene(grupo);
		
		
		stage.setScene(cena);
		stage.setTitle("Caixa de Pagamento");
		stage.show();
	}

}
