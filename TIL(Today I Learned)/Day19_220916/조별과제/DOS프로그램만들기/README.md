DOS 프로그램 만들기
    DOS 창에서

    >help
    >rename /?


    java Ex10_Dos C:\\Temp dir
    >폴더 파일 리스트 출력

    >java Ex10_Dos C:\\Temp mkdir aaa
    > Temp 폴더안에 aaa 폴더 생성

    명령어 3개 (어려운 명령어)
    명령어 5개 (쉬운 명령어)


    파일 생성 , 삭제 , 복사 , 목록 , .......

    //java ExDos C:\Temp mkdir newDir
    //java ExDos C:\Temp rename file.txt file2.txt
    //java ExDos C:\Temp delete new.txt

    if(args.length != 3 && args.length != 4) {
    System.out.println("사용법 : [java파일명] [디렉토리경로] mkdir [생성디렉토리명]");
    System.out.println("사용법 : [java파일명] [디렉토리경로] rename [파일명] [새로운 파일명]");
    System.out.println("사용법 : [java파일명] [디렉토리경로] delete [파일명]");
    System.exit(0);
    }

    if(args[1].equals("mkdir")) {
    }

=========================================================================================

샘플 1)

    static String defaultPath = "C:" + File.separator;
    static String path = defaultPath;
    public static void main(String[] args) {
    // 이클립스에서 그냥 실행 해볼 수 있는 간단한 DOS 커맨드
    // 사용할 수 있는 명령어
    // CD 현재 디렉터리 이름을 보여주거나 바꿉니다.
    // DIR 디렉터리에 있는 파일과 하위 디렉터리 목록을 보여줍니다.
    // MD 디렉터리를 만듭니다.
    // MKDIR 디렉터리를 만듭니다.
    // RD 디렉터리를 지웁니다.
    // RMDIR 디렉터리를 지웁니다.
    // REN 파일 이름을 바꿉니다.
    // RENAME파일 이름을 바꿉니다.
    // TYPE 텍스트 파일의 내용을 보여줍니다.
    // EXIT 프로그램을 종료합니다.

==============================================================================

샘플 2

    public static void main(String[] args) throws Exception {
    //java ExDos C:\Temp mkdir newDir
    //java ExDos C:\Temp rename file.txt file2.txt
    //java ExDos C:\Temp delete new.txt
    if(args.length != 3 && args.length != 4) {
    System.out.println("사용법 : [java파일명] [디렉토리경로] mkdir [생성디렉토리명]");
    System.out.println("사용법 : [java파일명] [디렉토리경로] rename [파일명] [새로운 파일명]");
    System.out.println("사용법 : [java파일명] [디렉토리경로] delete [파일명]");
    System.exit(0);
    }

    File f = new File(args[0]);
    if(!f.exists() || !f.isDirectory()) { //존재하지 않거나 디렉토리 아니라면
    System.out.println("유효하지 않은 디렉토리입니다");
    System.exit(0);
    }

    if(args[1].equals("mkdir")) {
    String path = "";
    path = f + "\\" + args[2];
    File newfile = new File(path);
    if(newfile.exists()) {
    System.out.println("이미 존재하는 디렉토리입니다");
    } else {
    newfile.mkdir();
    }
    }


<br><br><br>

구현한것들

    mkdir : 폴더 만들기
    rename: 파일명 바꾸기
    delete: 파일 삭제 (하위폴더가 있어도 지울수 있도록)
    hidden: 파일 숨기기
    dir   : 하위폴더 파일 목록


<br><br><br>

[소스]

```java
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;

public class DosProject {
	static boolean delete(File newfile) {
			File[] files = newfile.listFiles();
			if(files != null) {
				for(File file : files) {
					delete(file);
					System.out.println(newfile);
				}
			}
		return newfile.delete();
	}
	public static void main(String[] args) throws Exception {

		//java ExDos C:\Temp mkdir newDir
		//java ExDos C:\Temp rename file.txt file2.txt
		//java ExDos C:\Temp delete new.txt

		if(args.length != 3 && args.length != 4 && args.length != 2) {

		System.out.println("사용법 : [java파일명] [디렉토리경로] mkdir [생성디렉토리명]");

		System.out.println("사용법 : [java파일명] [디렉토리경로] rename [파일명] [새로운 파일명]");

		System.out.println("사용법 : [java파일명] [디렉토리경로] delete [파일명]");
		
		System.out.println("사용법 : [java파일명] [디렉토리경로] hidden [파일명]");
		
		System.out.println("사용법 : [java파일명] [디렉토리경로] dir");

		System.exit(0);

		}

		File f = new File(args[0]);

		if(!f.exists() || !f.isDirectory()) { //존재하지 않거나 디렉토리 아니라면

		System.out.println("유효하지 않은 디렉토리입니다");

		System.exit(0);

		}

		if(args[1].equals("mkdir")) 

		{

		String path = "";

		path = f + "\\" + args[2];

		File newfile = new File(path);

		if(newfile.exists()) {

		System.out.println("이미 존재하는 디렉토리입니다");

		}

		else {

		newfile.mkdir();
	
		}

		}
		
		else if(args[1].equals("hidden")) {
			String path = "";
			
			path = f + "\\" + args[2];
			System.out.println(path);
			File newfile = new File(path);
			System.out.println(newfile);
			
			if(!newfile.exists()) {
				Runtime rt = Runtime.getRuntime();
				newfile.createNewFile();
				Process ps = rt.exec("attrib +h " + path);
				BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
			}
			else {
				System.out.println("이미 파일이 존재합니다.");	
			}

		}
		else if(args[1].equals("rename")) {
			try {
				File originFileName = new File(f + "\\" + args[2]);
				File newFileName = new File(f + "\\" + args[3]);
				
				if(!originFileName.exists()) {
					System.out.println("존재하지 않습니다.");
					System.exit(0);
				}
				if(newFileName.exists()) {
					System.out.println("이미 존재하는 이름입니다");
					System.exit(0);
				}
				
				boolean scc = originFileName.renameTo(newFileName);
				if(scc) {
					System.out.println("수정 완료");
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("rename 중 예외 발생 : " + e.getMessage());
			}

		}
		else if (args[1].equals("delete")) { //args[1] 번째 값이 delete면? (equals: boolean)
			String path = "";
			path = f + "\\" + args[2];
			File newfile = new File(path);
			delete(newfile);
			
			
			
		
		}
		else if (args[1].equals("dir")) { //목록 조회
			File[] file = f.listFiles();
			for (int i=0; i<file.length; i++) {
				System.out.println(file[i]);
			}			
		}

	}

}
```