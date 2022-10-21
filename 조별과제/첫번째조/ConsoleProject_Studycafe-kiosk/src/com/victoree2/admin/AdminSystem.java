package com.victoree2.admin;




import java.util.Scanner;

import com.victoree2.common.actionInterface;
import com.victoree2.common.readingroomFactory;
import com.victoree2.common.returnmessage;
import com.victoree2.main.readingroomEx;
import com.victoree2.user.signupSystem;


public class adminSystem extends returnmessage implements actionInterface{
	Scanner scan = new Scanner(System.in);
	readingroomEx room = new readingroomEx();
	readingroomFactory factory;
	
	
	public adminSystem() {
		this.factory = new readingroomFactory();
	}
	@Override
	public void run() {
		System.out.println("관리자 페이지에 접속하였습니다.");
		
		int key=0;
		while ((key = selectMenu()) != 0) {
			switch (key) {
			case 1:
				
				break;
			case 2:
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
	public void selectAccount(signupSystem id) {
		//특정회원 조회
	}
	
	@Override
	public void selectAccount() {
		//회원 전부 조회
		
	}

	@Override
	public void paymentCancel() {
		//관리자는 회원 결제내역을 삭제할 수 있다.
		
	}

	@Override
	public void checkSeat() {
		//전체좌석을 확인할 수 있다.
		
	}
	@Override
	public int selectMenu() {
		System.out.println(message(room.language, "0002"));
		return Integer.parseInt(scan.nextLine());
	}
	
	
}
