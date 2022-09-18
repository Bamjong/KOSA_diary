package kr.or.kosa;

public class NoteBook {
	/*
	 노트북은 마우스를 가지고 있다
	 마우스 >> 휠, 버튼 2개, 좌표값 ....
	 부품정보 ... (엔진, 타이어)
	 마우스 설계도 (class)
	 */
	

	
	
	
	
	
	public String color;
	
	/*
	 객체지향언어 (캡슐화, 은닉화 : 직접적으로 값을 변경하고 쓰는 것 방지)
	 ex) year 마이너스 값을 넣지마!! ...
	 	 but 졸고있던 개발자 말을 안듣고 넣으면 프로그램 터짐
	 	 
	 그러므로 
	 	설계자 >> 다 막아버릴거야 >> 사용불가 >> 간접적으로 사용가능 >> 누군가 통해서 read,write(setter / getter)
	 
	 */
	
	private int year;
	
	//약속 캡슐화 (read, write 함수) >> 표준화 >> getYear... , setYear >> setter // getter
	
	//year write 함수
	public void writeYear(int data) { // 음수가 들어오면 새로 세팅해서 줌 (간접할당의 장점)
		if(data < 0) {
			year = 1999;
		} else {
			year = data;
		}
	}
	
	//year read 함수
	public int readYear() { //간접적으로 year라고 하는 member field 값을 return 하는 함수
		return year;
	}
	
	
	public Mouse mouse = new Mouse();
	
	public int number;
	
	//노트북 필요에 따라서 마우스를 가질 수 있다
	//가진다 의미 : 생성ㅇ된 객체의 주소를 가진다
	public void handle(Mouse m) {
		//
		m.x = 100;
		m.y = 200;
	}
}
