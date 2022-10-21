package com.victoree2.user;

import java.util.Scanner;

import com.victoree2.common.actionInterface;
import com.victoree2.common.returnmessage;
import com.victoree2.main.readingroomEx;

public class userSystem extends returnmessage implements actionInterface{
	readingroomEx room = new readingroomEx();
	Scanner scan = new Scanner(System.in);
	
	@Override
	public void run() {
		System.out.println("사용자 로그인 하였습니다.");

		int key = 0;

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
	
	@Override
	public void selectAccount() {
		//내 남은 시간조회
	}

	public void payment() { //결제하다
		//결제방법 1.카드 2.현금
	}

	@Override
	public void paymentCancel() {
		//결제 취소 
	}

	@Override
	public void checkSeat() {
		//내 좌석 조회
	}



	@Override
	public int selectMenu() {
		System.out.println(message(room.language, "0002"));
		return Integer.parseInt(scan.nextLine());
	}
	
	


}
