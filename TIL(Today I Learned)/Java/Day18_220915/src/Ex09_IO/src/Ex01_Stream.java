import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Arrays;

/*
IO (Input / Output)

Stream(통로)
데이터 종류: 이미지, 파일 (바이너리) <> 문자

Java API
[Byte] 단위의 데이터 IO

추상클래스
InputStream, OutputStream (재정의 ...원하는 추상함수)

당신이 Byte 데이터 작업을 할때
[입력 InputStream] 상속받는 클래스를 사용하세요 : 대상

대상
1. Memory	: ByteArrayInputStream...
2. File		: FileInputStream ^^		<- 주로 사용하는것

당신이 Byte 데이터 작업을 할때
[출력 OutputStream] 상속받는 클래스를 사용하세요 : 대상

대상
1. Memory	: ByteArrayInputStream...
2. File		: FileInputStream ^^		<- 주로 사용하는것
 */



public class Ex01_Stream {
	public static void main(String[] args) {
		//byte (-128 ~ 127) 정수 저장 타입
		byte[] inSrc = {0,1,2,3,4,5,6,7,8,9};
		byte[] outSrc = null;	//현재 메모리를 가지고 있지 않다
		
		//데이터 read, write 하는 대상 memory
		ByteArrayInputStream input = null;		//빨대 (통로) - 입력전용통로
		ByteArrayOutputStream output = null;	//빨대 (통로) - 출력전용통로
		
		input = new ByteArrayInputStream(inSrc);//inSrc 대상으로부터 date -> read
		output = new ByteArrayOutputStream();	//write ...
		
		System.out.println("outSrc before: " + Arrays.toString(outSrc));
		
		//공식같은 로직 (암기 하시면 좋아요)
		int data = 0;
		while((data = input.read()) != -1) {
			//System.out.println("data: " + data);
			output.write(data);		//출력통로안에 (빨대) 안에 데이터를 가지고 있는 것
			//write 대상이 data가 아니고 ByteArrayOutputStream 자신의 통로에 data 가지고 ...
		}
		
		outSrc = output.toByteArray();	//Byte[] 로 값을 전환 .. (주소값)
		System.out.println("outSrc after: " + Arrays.toString(outSrc));
	}
}
