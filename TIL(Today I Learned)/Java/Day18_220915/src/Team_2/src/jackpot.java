import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Set;
import java.util.TreeSet;

class Lotto{
	FileReader fr = null;
	FileWriter fw = null;
	BufferedReader br = null;
	BufferedWriter bw = null;
	Set<Integer> lotto = new TreeSet<>();
	String time;
	
	
	Lotto(){
		this.Time();
		this.number();
	}
	
	void Write() {
		try {
			fw = new FileWriter("Lotto.txt", true);
			bw = new BufferedWriter(fw);
			bw.write("로또번호: " + lotto.toString() + " " + time);
			bw.newLine();
			bw.flush();
		
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				fw.close();
				bw.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	void Read() {
		
		try {
			fr = new FileReader("Lotto.txt");	
			br = new BufferedReader(fr);
			
			String line = "";

//			for (int i = 0; (line=br.readLine())!=null; i++) {
//				System.out.println(line);
//			}
//			
			while ((line=br.readLine())!=null) {
				System.out.println(line);
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
		
	
	void Time() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년mm월dd일 hh:mm");
		time = dateFormat.format(cal.getTime());
	}
	
	
	void number() {
		
		for (int i = 0; lotto.size() < 6; i++) {
			lotto.add((int)(Math.random()*45+1));
		}
		
	}
}


public class jackpot {
	public static void main(String[] args) {
		Lotto lotto = new Lotto();
	
		lotto.Write();
		lotto.Read();
	}
	
}
