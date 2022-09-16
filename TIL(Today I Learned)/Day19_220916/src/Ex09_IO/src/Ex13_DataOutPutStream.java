import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.FileOutputStream;

/*
보조 스트림
DataOutPutStream
DataInputStream

java 8가지 기본타입(타입별로 write, read)
단 조건 (DataOutPutStream, DataInputStream) 두놈씩 같이

만약)
성적.txt
100,20,60,88 >> 문자열 -> split > 배열 > 연산하려면 숫자 > ...
 */



public class Ex13_DataOutPutStream {
	public static void main(String[] args) {
		int[]  score = {100,60,55,95,50};
		FileOutputStream fos = null;
		DataOutputStream dos = null;
		
		try {
			fos = new FileOutputStream("score.txt");
			dos = new DataOutputStream(fos);
			
			for (int i = 0; i < score.length; i++) {
				dos.writeInt(score[i]); //정수값으로 그대로 write
				//조건 read 반드시 DataInputStream
				//dos.writeUTF(null); //채팅 입력 출력
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
}
// dataoutput으로 썼으면 datainput으로 읽어야한다
// ex13에서는 다르걸 씀으로써 글씨가 전부 깨져버렸다.