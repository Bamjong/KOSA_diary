package com.victoree2.main;
import java.util.Scanner;

import com.victoree2.admin.adminSystem;
import com.victoree2.common.readingroomFactory;
import com.victoree2.common.returnmessage;
import com.victoree2.user.signupSystem;
import com.victoree2.user.userSystem;

public class systemEx extends returnmessage{
	Scanner scan = new Scanner(System.in);


	readingroomFactory factory = new readingroomFactory();
	readingroomEx room = new readingroomEx();
	
	
	public void run() {
		System.out.println("안녕하세요. 독서실 입니다.");
		
		int key=0;

		while((key = selectMenu()) != 0){
			signupSystem user = factory.getUser();
			user.load(); //로그인 체크를 위해 로그인 정보가 저장된 파일을 불러올것이다
			switch (key) {
			case 1:
				int userStatus = user.login();
				if(userStatus==1) {//관리자일 경우
					userSystem us = factory.getUserSystem();
					us.run();
				}
				else if(userStatus==9) {//사용자일 경우.
					adminSystem as = factory.getAdminSystem();
					as.run();
				}
				else if(userStatus==0) {
					System.out.println(message(room.language, "0000"));
					//System.out.println("해당계정은 정지되었습니다.");
				}
				break;
			case 2:
				user.signUP();
				break;
			case 3:
//				(language == "kor") ? language="en" : language="kor";
				room.language = "kor";
				break;
			case 4:
				room.language = "en";
				break;
			case 0:
				System.out.println("종료");
				System.exit(0);
				break;
			default:
				System.out.println("잘못 선택하였습니다.");
				break;
			}
		}
	}
	
	int selectMenu() {
		System.out.println(message(room.language, "0001"));
		
		return Integer.parseInt(scan.nextLine());
	}
}
