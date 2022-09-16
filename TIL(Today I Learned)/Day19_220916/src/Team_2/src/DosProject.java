import java.io.File;

public class DosProject {
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
			
	///////////////////////////////////////////////////////////////// mkdir
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
			
	///////////////////////////////////////////////////////////////// rename

			if(args[1].equals("rename")) {
				String path = "";
				String changePath = "";
				
				path = f + "\\" + args[2];
				changePath =  f + "\\" + args[3];
				File newfile = new File(path);
				File changefile = new File(changePath);
				
				
				if(!newfile.exists()) {
					System.out.println("존재하지 않는 디렉토리입니다");
				} else {
					newfile.renameTo(changefile);
				}
			}
	///////////////////////////////////////////////////////////////// delete
			
			if(args[1].equals("delete")) {
				String path = "";
				path = f + "\\" + args[2];
				File newfile = new File(path);
			
				if(!newfile.exists()) {
					System.out.println("존재하지 않는 디렉토리입니다");
				} else {
					newfile.delete();
				}

			}
			
			
			
	}
}