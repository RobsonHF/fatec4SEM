package view;

import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class TelaCadastro extends Stage{

	private VBox vbox;
	private Scene cena;
	private TextField txtPalavra, txtDefinicao;
	private FlowPane painelBotoes;
	private Button btnCancelar, btnCadastrar;
	
	public TelaCadastro(String palavra) {
		txtPalavra = new TextField(palavra);
		txtPalavra.setPromptText("Palavra");
		txtDefinicao = new TextField();
		txtDefinicao.setPromptText("Definição");
		
		btnCancelar = new Button("Cancelar");
		btnCadastrar = new Button("Cadastrar");
		painelBotoes = new FlowPane(btnCancelar, btnCadastrar);
		painelBotoes.setHgap(10);
		
		vbox = new VBox(txtPalavra, txtDefinicao, painelBotoes);
		vbox.setPadding(new Insets(20));
		
		cena = new Scene(vbox);
		this.setScene(cena);
		this.show();
	}
}