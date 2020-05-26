import java.util.Iterator;
import java.util.ServiceLoader;

public class Start {

	public static void main(String[] args) {
		
		ServiceLoader<HelloWorldService> loader = ServiceLoader.load(HelloWorldService.class);
		
		Iterator<HelloWorldService> iterator = loader.iterator();
		
		while(iterator.hasNext()) iterator.next().sayHello();
		
		System.out.println("Fim :-)");
	}
}
