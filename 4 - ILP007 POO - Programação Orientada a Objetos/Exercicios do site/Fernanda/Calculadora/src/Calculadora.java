import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.scene.layout.TilePane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class Calculadora extends Application {

	@Override
	public void start(Stage stage) throws Exception {
		String botoesNomes[] = {"7", "8", "9", "/",
								"4", "5", "6", "*",
								"1", "2", "3", "-",
								",", "0", "=", "+"};
		
		VBox root = new VBox();
		Scene scene = new Scene(root, 300, 400);
		
		TextField display = new TextField();
		TilePane botoes = new TilePane();
		botoes.setPrefColumns(4);
	}

}
