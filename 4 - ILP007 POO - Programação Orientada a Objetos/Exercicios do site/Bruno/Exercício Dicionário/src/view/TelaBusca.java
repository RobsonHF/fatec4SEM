package view;

import controller.TelaBuscaController;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import model.Palavra;


public class TelaBusca extends Group {
	
	private FlowPane painelBusca;
	private TextField txtBusca;
	private Button btnBusca;

	private FlowPane painelResultado;
	private Label lblResultadoPalavra;
	private Label lblResultadoDefinicao;
	
	private TelaBuscaController tbc;
	
	public TelaBusca() {
		
		this.painelBusca = new FlowPane();
		this.painelBusca.setMinSize(400, 200);
		this.painelBusca.setHgap(10);
		this.painelBusca.setPadding(new Insets(20));
		
		this.txtBusca = new TextField();
		this.txtBusca.setPromptText("Digite aqui para pesquisar...");
		this.btnBusca = new Button("Buscar");
		
		this.painelResultado = new FlowPane();
		this.painelResultado.setMinSize(400, 400);
		this.painelResultado.setHgap(10);
		this.painelResultado.setPadding(new Insets(0, 20, 20, 20));
		
		this.lblResultadoPalavra = new Label();
		this.lblResultadoDefinicao = new Label();
		
		this.painelBusca.getChildren().addAll(txtBusca, btnBusca);
		this.painelResultado.getChildren().addAll(lblResultadoPalavra, lblResultadoDefinicao);
		this.getChildren().addAll(painelBusca);
		
		btnBusca.setOnAction((e) -> {
			
			tbc = new TelaBuscaController();
			Palavra pBusca = tbc.submeteBusca(txtBusca.getText());
						
			if (pBusca != null) {
				lblResultadoPalavra.setText(pBusca.getPalavra());
				lblResultadoDefinicao.setText(pBusca.getDefinicao());
				this.getChildren().removeAll(this.painelBusca, this.painelResultado);
				this.getChildren().addAll(this.painelBusca, this.painelResultado);
			}else {
				new TelaCadastro(txtBusca.getText());
			}
			e.consume();
		});
	}
}
