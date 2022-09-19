package kr.or.kosa;

import java.io.Serializable;

/*

객체 통신
객체(Car, Tv, Tank) 네트워크, 파일간에(txt파일 객체를 write  //객체란 완제품을 뜻함
프로세스 간 통신

직렬화: 객체를 분해해서 줄을 세워 보내는 과정
역직렬화: 객체를 다시 조립하는 과정

실습) 파일
객체 write(파일): 직렬화
객체 read(파일): 역직렬화

모든 자원(class) 직렬화 불가능
직렬화 가능 제품 만들어서 ....
implements Serializable (레고블럭)

 */


public class UserInfo implements Serializable{	// Serializable 얘가 있으면 직렬화 가능이란 뜻
	private String name;
	private String pwd;
	private int age;
	
	public UserInfo() {
		
	}

	

	public UserInfo(String name, String pwd, int age) {
		super();
		this.name = name;
		this.pwd = pwd;
		this.age = age;
	}
	
	
	@Override
	public String toString() {
		return "UserInfo [name=" + name + ", pwd=" + pwd + ", age=" + age + "]";
	}
}
