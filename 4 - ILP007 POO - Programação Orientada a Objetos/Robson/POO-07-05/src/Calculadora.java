import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

// Author: Robson Henrique Ferreira


public class Calculadora extends Application{

	public static void main(String[] args)  {
		Application.launch(Calculadora.class, args);

	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		
		VBox vBox = new VBox();
		vBox.setPadding(new Insets(10));
		
		
		FlowPane flowPane = new FlowPane();
		flowPane.setVgap(1);
//		flowPane.setAlignment(Pos.CENTER);
		
		GridPane gridPane = new GridPane();
		gridPane.setVgap(1);
		gridPane.setHgap(1);
		
		
		TextField txtVisor = new TextField("0");
		txtVisor.setPrefWidth(70);
		Button btnCE = new Button("CE");
		Button btn1 = new Button("1");
		Button btn2 = new Button("2");
		Button btn3 = new Button("3");
		Button btn4 = new Button("4");
		Button btn5 = new Button("5");
		Button btn6 = new Button("6");
		Button btn7 = new Button("7");
		Button btn8 = new Button("8");
		Button btn9 = new Button("9");
		Button btn0 = new Button("0");
		Button btnMais = new Button("+");
		Button btnMenos = new Button("-");
		Button btnMultiplica = new Button("*");
		Button btnDivide = new Button("/");
		Button btnVirgula = new Button(",");
		Button btnIgual = new Button("=");
		Label txtAuthor = new Label("By: Robson H. F.");
		
		
		vBox.getChildren().add(flowPane);
		flowPane.getChildren().add(txtVisor);
		flowPane.getChildren().add(btnCE);
		vBox.getChildren().add(gridPane);
		gridPane.add(btn1, 0, 0);
		gridPane.add(btn2, 1, 0);
		gridPane.add(btn3, 2, 0);
		gridPane.add(btn4, 0, 1);
		gridPane.add(btn5, 1, 1);
		gridPane.add(btn6, 2, 1);
		gridPane.add(btn7, 0, 2);
		gridPane.add(btn8, 1, 2);
		gridPane.add(btn9, 2, 2);
		gridPane.add(btn0, 1, 3);
		gridPane.add(btnMais, 3, 0);
		gridPane.add(btnMenos, 3, 1);
		gridPane.add(btnMultiplica, 3, 2);
		gridPane.add(btnDivide, 3, 3);
		gridPane.add(btnVirgula, 0, 3);
		gridPane.add(btnIgual, 2, 3);
		vBox.getChildren().add(txtAuthor);
				
		
		Scene cena = new Scene(vBox, 120, 160);
		
		primaryStage.setScene(cena);
		primaryStage.setTitle("Calculadora");
		primaryStage.show();
		primaryStage.setTitle("Calculadora");
		
		
	}

}
