import java.util.Date;

public class Conta {
	
	private double saldo;
	private String numero;
	private String senha;
	private Transacao[] historico = new Transacao[0];
	
	public boolean efetuarSaque(double valor) {
		
		return false;
		
	}
	
	public boolean efetuarDeposito(double valor) {
		return false;
	}
	
	public boolean efetuarPagamento (String boleto, double valor) {
		return false;
	}
	
	public Transacao[] extrato (Date dataInicio, Date dataFinal) {
		return historico;
	}

}
