package com.victoree2.common;

import com.victoree2.admin.adminSystem;
import com.victoree2.user.signupSystem;
import com.victoree2.user.userSystem;

// 클래스 집합

public class readingroomFactory extends returnmessage{
	
	
	public signupSystem getUser() {//초기화면 계정정보생성
		return new signupSystem();
	}
	public userSystem getUserSystem() {//사용자페이지
		return new userSystem();
	}
	public adminSystem getAdminSystem() {//관리자페이지
		return new adminSystem();
	}
	public void createRoom(String type) {
		
	}
}
