import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.FlowPane;
import javafx.stage.Stage;

//Author: Robson Henrique Ferreira

public class HelloWorld extends Application {

	public static void main(String[] args) {
		Application.launch(HelloWorld.class, args);


	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		
		FlowPane flowPane = new FlowPane();
		Label txtHelloWorld = new Label("Hello World");

		flowPane.getChildren().add(txtHelloWorld);

		
		Scene cena = new Scene(flowPane, 100, 100);
		
		primaryStage.setScene(cena);
		primaryStage.setTitle("Hello World");
		primaryStage.show();
		
		

		
	}

}
