// ROBSON HENRIQUE FERREIRA

import java.awt.Graphics;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class Drawing extends JPanel {
	
	public void paint(Graphics g) {

		int xOval = 200;
		int yOval = 200;
		int widthOval = 200;
		int heightOval = 200;
				
		for(int i=0;i<100;i++) {
						
			heightOval -= 10;
			yOval = 200 - (heightOval/2);
			g.drawOval(xOval, yOval, widthOval, heightOval);
			
		}
		
		xOval = 300;
		yOval = 100;
		widthOval = 200;
		heightOval = 200;

		for(int i=0;i<100;i++) {
						
			xOval = 300 - (widthOval/2);
			widthOval -= 10;
			g.drawOval(xOval, yOval, widthOval, heightOval);
		}
		
		
		g.drawRect(20, 150, 100, 100);
		int x[] = {70, 20, 120};
		int y[] = {100, 150, 150};
		g.drawPolygon(x, y, 3);
	}

	public static void main(String[] args) {
		
		JFrame janela = new JFrame ("Desenhos");
		
		Drawing pintura = new Drawing();
		
		janela.setContentPane(pintura);
		
		janela.setSize(600, 600);
		janela.setVisible(true);

	}

}
