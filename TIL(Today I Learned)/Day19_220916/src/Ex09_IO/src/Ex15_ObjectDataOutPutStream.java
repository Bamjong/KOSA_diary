import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;

import kr.or.kosa.UserInfo;

public class Ex15_ObjectDataOutPutStream {
	public static void main(String[] args) {
		String filename="UserData.txt";
		
		FileOutputStream fos = null;	//적을라고 넣음
		BufferedOutputStream bos = null; //성늫좋게 넘길려고
		ObjectOutputStream out = null;	//객체 통신을 위해 넣음
		
		try {
			
			fos = new FileOutputStream(filename,true);
			bos = new BufferedOutputStream(fos);
			
			//직렬화
			out = new ObjectOutputStream(bos); 
			
		
			UserInfo u1 = new UserInfo("홍길동", "super", 500);	//완제품
			UserInfo u2 = new UserInfo("scott", "tiger", 50);	//완제품
			
			
			//직렬화 과정
			out.writeObject(u1); //UserInfo 분해해서 한줄로 세운 후 파일 기록  //직렬화 과정..
			out.writeObject(u2);
			
			//파일에 UserInfo 객체 2개 직렬화 write
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				out.close();
				bos.close();
				fos.close();
				System.out.println("파일 생성 -> buffer -> 직렬화 -> 파일 write 까지 완성");
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
}
