import java.io.File;

class a {
	void go(b b) {
		b.run();
	}
}

interface b {
	void run();
}
public class Test {
	public static void main(String[] args) {
		a a = new a();
		a.go(new b() {

			@Override
			public void run() {
				System.out.println("간닷");
			}
			
		});
	}
}
