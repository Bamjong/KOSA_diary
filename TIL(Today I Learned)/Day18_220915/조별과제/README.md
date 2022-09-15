## [문제]

![이미지](https://cafeptthumb-phinf.pstatic.net/MjAyMDA4MjhfNDkg/MDAxNTk4NTk0MzkyMTA4.BQc4XgzMnzVyyLbBNyqatktUd9yDKnDCDoWK8iz8NOAg.FlCnG3ccSFe2f6OOumr0AYGyBjjFP31PzdpbAdDeqlEg.PNG/image.png?type=w1600)

    기존에 만들었던 로또 프로그램에 기능을 추가 해서 작성하세요

<br><br>

## [소스]
<details>
<summary> 소스 </summary>

```java
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

			for (int i = 0; (line=br.readLine())!=null; i++) {
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

```

</div>
</details>

<br><br>

## [출력]

    로또번호: [7, 13, 19, 22, 26, 29] 2022년24월15일 03:24
    로또번호: [1, 7, 16, 19, 25, 30] 2022년24월15일 03:24
    로또번호: [2, 18, 36, 39, 40, 45] 2022년24월15일 03:24
    로또번호: [16, 19, 35, 36, 43, 44] 2022년29월15일 03:29
    로또번호: [2, 11, 13, 36, 37, 44] 2022년29월15일 03:29