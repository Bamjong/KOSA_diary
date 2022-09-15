import java.io.FileReader;
import java.io.FileWriter;

/*
문자기반의 데이터 처리 (char[])
String 클래스 : String str = "ABC" : 내부적으로 char[] >> [A][B][C]
 */


public class Ex05_Reader_Writer {
	public static void main(String[] args) {
		FileReader fr = null;
		FileWriter fw = null;
		
		try {
			fr = new FileReader("Ex01_Stream.java");	//read
			fw = new FileWriter("copy_Ex01.txt");		//write 파일생성후  stream 내용 복사 하겠다.
			
			int data=0;
			while((data = fr.read()) != -1){
				//System.out.println(data);
				if(data != '\n' && data != '\r' && data != '\t' && data != ' ') {
					fw.write(data);
					//엔터, 탭, 빈문자는 파일 쓰지 않겠다
					//압축파일 버전
				}
					
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				fr.close();
				fw.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
