package com.victoree2.system;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;
import java.util.regex.Pattern;

import com.victoree2.common.AccountData;
import com.victoree2.common.ReturnMessage;
import com.victoree2.main.ReadingRoom;

public class AccountSystem extends ReturnMessage{
	
	Scanner scan = new Scanner(System.in);
	ReadingRoom room = new ReadingRoom();
	
	//key 값으로 id 값을 줄것이며 id값은 중복이 불가능하다.
	private HashMap<String, AccountData> account = new HashMap<String, AccountData>();
	
	boolean adminCheck = true;
	private String id;
	private String name;
	private String password;
	private String birthday;
	private String phonenumber;
	
	

	
	//파일 직렬화
	FileOutputStream fos = null;
	BufferedOutputStream bos = null;
	ObjectOutputStream out = null;
	
	//파일 역 직렬화
	FileInputStream fis = null;
	BufferedInputStream bis = null;
	ObjectInputStream in = null;
	
	
	Set<String> set;
	
	String filename = "C:\\KOSA_IT\\login\\UserDB.txt";	
	File file = new File(filename);
	
	
	public HashMap<String, AccountData> getAccount() {
		return account;
	}

	public void signUP(){ //회원가입
		String idReg = "^[A-za-z0-9]{5,15}";  // [영문 대문자 또는 소문자 또는 숫자로 시작하는 아이디, 길이는 5~15자, 끝날때 제한 없음]
		String pwReg = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"; // [최소 8 자, 최소 하나의 문자 및 하나의 숫자]
		String birthReg = "^([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))"; // [970219 이런 형식으로]
		String phoneReg = "^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$"; // [하이픈 제외]
		

		
		boolean regexCheck;
		if(!adminCheck) {
			System.out.println(message(room.language, "0007")+" "+message(room.language, "0005")+message(room.language, "0006"));
			System.out.println(message(room.language, "0008")+" " + message(room.language, "0009") + " : ");
			String id = scan.nextLine();
			
			System.out.println(message(room.language, "0010") + " " + message(room.language, "0009") + " : ");
			String password = scan.nextLine();
			AccountData ac = new AccountData(id, "관리자", password, "00000000", 9);
			account.put(id, ac); 
			
			System.out.println(message(room.language, "0007")+" " +message(room.language, "0011"));
			adminCheck = true;
		}
		else {
			System.out.println(message(room.language, "0022"));
			
			
			while(true) {
				System.out.println(message(room.language, "0008")+" " + message(room.language, "0009") + " : [길이 5~15자]");
				this.id = scan.nextLine();
				if(account.containsKey(id)) {
					System.out.println("이미 존재하는 아이디입니다.");
					return;
				}
				if(Pattern.matches(idReg,this.id)) {
					break;
				} else {            
				    System.out.println("올바른 아이디 형식이 아닙니다. ");
				}
			}
			
			System.out.println(message(room.language, "0023") + " " + message(room.language, "0009") + " : ");
			this.name = scan.nextLine();
			
			while(true) {
				System.out.println(message(room.language, "0010") + " " + message(room.language, "0009") + " : [최소 8자 + 문자 숫자조합]");
				this.password = scan.nextLine();
				if(Pattern.matches(pwReg,this.password)) {
					break;
				} else {            
				    System.out.println("올바른 비밀번호 형식이 아닙니다. ");
				}
			}
			
			while(true) {
				System.out.println(message(room.language, "0024") + " " + message(room.language, "0009") + " : [970219 이런 형식으로]");
				this.birthday = scan.nextLine();
				if(Pattern.matches(birthReg,this.birthday)) {
					break;
				} else {            
				    System.out.println("올바른 생일 형식이 아닙니다. ");
				}
			}
			
			while(true) {
				System.out.println(message(room.language, "0025") + " " + message(room.language, "0009") + " : [하이픈 제외]");
				this.phonenumber = scan.nextLine();
				if(Pattern.matches(phoneReg,this.phonenumber)) {
					break;
				} else {            
				    System.out.println("올바른 번호 형식이 아닙니다. ");
				}
			}
			
			AccountData ac = new AccountData(id, name, password, birthday, phonenumber);
			account.put(id, ac);
		}
		System.out.println(message(room.language, "0011"));
		save();
	}
	//업데이트
	public void update(AccountData ac){
		load();// 수정.
		this.account.remove(ac.getId());
		account.put(ac.getId(), ac);
		save();
	}
	public AccountData login() { //로그인
		System.out.println(message(room.language, "0012"));
		System.out.println(message(room.language, "0008")+" " + message(room.language, "0009") + " : ");
		String id = scan.nextLine();
		System.out.println(message(room.language, "0010") + " " + message(room.language, "0009") + " : ");
		String password = scan.nextLine();
		AccountData returnValue=null;
		
		if((!account.containsKey(id))||(!account.get(id).getPassword().equals(password)))
		{
			//해킹시도시, 아이디가 틀렸는지 패스워드가 틀렸는지 확인방지.
			System.out.println(message(room.language, "0013"));
			returnValue = null;
		}
		else if (account.get(id).getPassword().equals(password)) {
			returnValue = account.get(id);
		}

		return returnValue;
	}

	public void delete(HashMap<String, AccountData> account) {//계정삭제
		this.account = account;
	}

	public void resetPassword() {//패스워드초기화
		// TODO Auto-generated method stub
		
	}
	
	public void save(){
		try {
			fos = new FileOutputStream(file);
			bos = new BufferedOutputStream(fos);
			out = new ObjectOutputStream(bos);
			
			out.writeObject(account);
//			System.out.println("save success");/////
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			try {
				out.close();
				bos.close();
				fos.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
	}
	
	public void load() {
		//역질렬화로 계정을 정보를 읽음.

		try {
			// 파일이 없을경우 생성.
			if (!file.exists())
				file.createNewFile();
				fis = new FileInputStream(file);
//				if (fis.read() == -1) {
				if (fis.getChannel().size() == 0) {
					adminCheck = false;
					signUP();
					// 관리자 계정이 없을경우 생성을 해주며 아래 fis를 계정이 있는 상태의 파일로 읽으므로서 예외발생 x
					fis = new FileInputStream(file);
				}
				bis = new BufferedInputStream(fis);
				in = new ObjectInputStream(bis);
				
				account = (HashMap)in.readObject();
//				System.out.println(account);
//				Set<String> test = account.keySet();
				
//				for(String value : test) {
//					String test1 = account.get(value).toString(); 
//				}
				
			
		} catch (FileNotFoundException e) {
			//User 클래스 생성자때 파일 자체를 만들지만 폴더 접근 권한이나 다른 이상현상으로 파일 생성이 안될경우 메세지 출력
		//	System.out.println(message(room.language, "0014"));
		} catch (EOFException e) {
		//	System.out.println(message(room.language, "0015") + e.getMessage());
		} catch (IOException e) {
		//	System.out.println(message(room.language, "0016")+ e.getMessage());	
		}  catch (Exception e) {
		//	System.out.println(message(room.language, "0017") + e.getMessage());
		}finally {
			try {
				in.close();
				bis.close();
				fis.close();
			}catch (Exception e) {
			}
		}
		/*
		 * 내꺼에서 안써지는데?
		 * catch (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */	
	}
}
