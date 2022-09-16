import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Ex06_FileReader_FileWriter_Buffer {
	public static void main(String[] args) throws IOException {
//		FileWriter fw = new FileWriter("Lotto.txt", true);
//		BufferedWriter bw = new BufferedWriter(fw);
//		bw.write("로또");
//		bw.newLine();
//		bw.write("1,3,5,7,9");
//		bw.newLine();
//		bw.flush();
		
		FileReader fr = null;
		BufferedReader br = null;
		try {
			
			fr = new FileReader("Ex01_Stream.java");
			br = new BufferedReader(fr);
			// Line 단위 단위의 처리
			String line = "";
			for (int i = 0; (line = br.readLine()) != null ; i++) {
					if(line.indexOf(";") != -1) {
						System.out.println(line);
					}
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				fr.close();
				br.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
				
	}
}
