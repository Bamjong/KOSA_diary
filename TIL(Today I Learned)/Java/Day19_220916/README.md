# 2022년 9월 16일 금요일
<br>


## 1. I/O (Input/Output) (입출력) (*09_Ex01_Stream 10~16)

### Sublist (서브리스트)

```java
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class Ex10_File_SubList {
	static int totalfiles = 0;    //파일개수
	static int totaldirs = 0;   //폴더개수
	
	static void printFileList(File dir) {
		System.out.println("Full Path: " + dir.getAbsolutePath());
		
		//코드 .. 자유
		List<Integer> subdir = new ArrayList<Integer>();
		File[] files = dir.listFiles(); //하위 자원 정보를 다... 하나 하나를 file 객체
		//[0] > a.txt  >> 각 방의 타입은 File 타입
		//[1] > aaa 폴더
		//[2] > bbb 폴더
		//[3] > java.jpg
		for(int i = 0; i<files.length; i++) {
			String filename = files[i].getName(); // 폴더명 or 파일명
			if(files[i].isDirectory()) { //폴더
				filename = "[ DIR ]" + filename;
				//* POINT *
				subdir.add(i); //WHY  >> 폴더인 녀석의 index 값을 (i) > arrayList
				//subdir[0] > 1
				//subdir[2] > 2
				
			} else { //파일
				filename = filename + " / " + files[i].length() + "byte";
			}
		}
		//폴더 개수 확인 
		int dirnum = subdir.size(); //현재 주어진 폴더의 하위 폴더 개수
		int filenum = files.length - dirnum;  //파일 개수
		
		//누적개수 (하위 폴더 안에 자원까지 포함)
		totaldirs += dirnum; //총 누적된 폴더의 개수 (하위의 하위까지 다포함)
		totalfiles += filenum; //총 누적 파일 개수 (하위의 하위까지)
		
		System.out.println("[Current DirNum] : " + dirnum);
		System.out.println("[Current FIleNum] : " + filenum);
		System.out.println("*********************************************************");
		
		//Point (하위 폴더의 다시 하위 폴더 정보.....)
		//[0] > a.txt  >> 각 방의 타입은 File 타입
		//[1] > aaa 폴더 > a-1폴더, a-2 폴더
		//[2] > bbb 폴더 > b-1 폴더, b.txt, b-1.jpg
		//[3] > java.jpg
		for(int i = 0; i<subdir.size(); i++) { //C:\\Temp 제어 >> 안에 하위 폴더 개수
			int index = subdir.get(i);  //폴더의 방 위치값
			//한 줄의 코드
			printFileList(files[index]); //재귀호출 (내가 내 자신을 또 호출)
			//C:\\Temp\\aaa
			
		}
		
	}
	

	public static void main(String[] args) {
		if(args.length !=1) { //main 함수가 가진 배열의 길이가 1과 같지 않다면 (아무것도 안들어있다면)
			System.out.println("사용법: java [실행파일명] [경로명]");
			System.out.println("예시: java Ex10_File_Sublist C:\\Temp");
			System.exit(0);
		}
		File f = new File(args[0]); //File f = new File("C:\\Temp");
		//유효성 검증 1. 너 존재하니? 2. 너 진짜 디렉토리야?
		if(!f.exists() || !f.isDirectory()) {
			//존재하지 않거나 또는 디렉토리가 아니라면
			System.out.println("유효하지 않은 디렉토리");
			System.exit(0);
		}
		// 정상적인 경로, 그리고 폴더구나..
		printFileList(f); //호출 (반복)
		//하위 폴더 안까지의 폴더 개수, 파일 개수 누적
		System.out.println("누적된 총 파일 수: " + totalfiles);
		System.out.println("누적된 총 폴더 수: " + totaldirs);
	}

}
```

### 보조스트림
    DataOutPutStream
    DataInputStream

    java 8가지 기본타입(타입별로 write, read)
    단 조건 (DataOutPutStream, DataInputStream) 두놈씩 같이

    만약)
    성적.txt
    100,20,60,88 >> 문자열 -> split > 배열 > 연산하려면 숫자 > ...


    FileReader      파일을 받음
    BufferedReader  버퍼를 통해 더 빠르고 많이 받음
    Filewriter      char형으로 하나씩 보냄
    Bufferedwriter  버퍼를 통해 더 빠르고 많이 보냄

    FileOutputStream 
    DataOutputStream 자료형까지 넘겨줌
    FileInputStream
    DataInputStream 자료형까지 받음

### 직렬화(serialization) - ObjectOutputStream (*09_Ex15_ObjectDataOutPutStream 15~16)

클래스 뒤쪽에 ***"implements Serializable"*** 를 적어주면 직렬화 클래스로 인식

[ex]
```java
public class UserInfo implements Serializable{	// Serializable 얘가 있으면 직렬화 가능이란 뜻
	private String name;
	private String pwd;
	private int age;
	
```

[직렬화 output 예제]

```java
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
```

<br>

[직렬화 input 예제]

```java
public class Ex16_ObjectDataInputStream {
	public static void main(String[] args) {
		
		String filename = "UserData.txt";
		
		FileInputStream fis = null;	
		BufferedInputStream bis = null; 
		ObjectInputStream in = null;	
		
		try {
			
			fis = new FileInputStream(filename);
			bis = new BufferedInputStream(fis);
			in	= new ObjectInputStream(bis); //한 줄의 코드가 (역직렬화)
			
			//복원
//			UserInfo r1 = (UserInfo) in.readObject();
//			UserInfo r2 = (UserInfo) in.readObject();
//			System.out.println(r1.toString());
//			System.out.println(r2.toString());
			
			Object users = null;
			while((users = in.readObject()) != null) {
				System.out.println(((UserInfo)users).toString());
			}
			
		} catch (FileNotFoundException e) {
			System.out.println("파일이 존재하지 않아요");
		} catch (EOFException e) {
			System.out.println("끝 " + e.getMessage());
		} catch (IOException e) {
			System.out.println("파일을 읽을 수 없어요");
		} catch (ClassNotFoundException e) {
			System.out.println("해당 객체가 존재하지 않아요");
		} catch (Exception e) {
			System.out.println("나머지 예외");
		} finally {
			try {
				in.close();
				bis.close();
				in.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
}
```





