/*
Today's Point
[상속관계]에서 Override: 상속관계에서 자식이 부모의 함수를 [재정의]
[상속관계]에서 [자식 클래스]가 [부모클래스]의 메서드(함수)를 재정의(내용을 바꿈)

재정의 : 틀의 변화가 없고 (함수의 이름, 타입) 아니고 내용만 변화 {중괄호 블럭 안에 것만 수정}

문법)
1. 부모 함수 이름 동일
2. 부모 함수 parameter동일
3. 부모 함수 return type 동일
4. 결국 {안에 실행블럭안에 코드만 변경 가능}
 */

class Point2{
	int x = 4;
	int y = 5;
	
	String getPosition() {
		return this.x + "/" + this.y;
	}
}

class Point3D extends Point2{
	int z = 6;
	
	//String get3D...(){} 새로운 함수 추가
	//추가 ... 함수 ...
	
	@Override
	String getPosition() {
		return this.x + "/" + this.y + "/" + this.z;
	}
}

public class Ex04_Inherit_Override {
	public static void main(String[] args) {
		
		Point3D p = new Point3D();
		System.out.println(p.getPosition());
	}
}
