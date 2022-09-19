package kr.or.kosa;

import java.util.Scanner;

/*
 Tv 설계도 요구사항정의
 
 Tv는 채널 정보를 가지고 있다 (예를들면 1~200 값을 가질 수 있다)   //public
 Tv는 브랜드 이름을 가지고 있다 (예를들면 엘지, 삼성 --- 등등등)    //public
 Tv는 채널 전환기능을 가지고 있다 (채널은 한 채널씩 이동이 가능하다
 ->채널을 증가 감소 시키는 기능을 가지고 있다.
 
 Tv의 채널정보와 브랜드이름을 볼 수있는 기능을 가지고 있다
 
 */

public class Tv {
	
	public int ch = 1;
	public String brandname;
	
	public void ch_Up() {
		ch++;
	}
	
	public void ch_Down(){
		ch--;
	}
	
	public void tvInfo() {
		System.out.printf("[%s] , [%d] \n",brandname,ch);
	}
	
}