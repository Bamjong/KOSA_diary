# 2022년 8월 26일 금요일
<br>


### 1. getter / setter (*03_Ex05_Modifier, 03_Car.java)
---

#### 실무코드의 특징

 1. 캡슐화 (member field)
 2.	캡슐화 (간접적으로 처리 : setter/getter)
 3. 이런 데이터를 담을 수 있는 클래스 (VO, DTO, DOMAIN)

    필요에 따라서 (setter 만)			>> write
    필요에 따라서 (getter 만)			>> read
    필요에 따라서 (setter, getter 만)	>> write, read
	
    일단은 굳이 따로 하지말고 그냥 둘다 쓰세요!

    필요하다면 별도의 함수를 생성
	
	일반적으로 아래처럼 별도의 함수를 만들기 보다는 read, write 만 한다면
	getter , setter 통해서 제어하는 것이 일반적이다


#### Lombok(롬복)
---
 Lombok 이란 Java 라이브러리로 반복되는 getter, setter toString .. 등의
 반복 메서드 작성 코드를 줄여주는 코드 다이어트 라이브러리 이다.
 @Getter

 @Setter

 컴파일러에게 자동으로 setter , getter 만들어 주세요...

 [출처](https://cheershennah.tistory.com/183)

```java
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class BoardCategoryLombok {

    private String category_id;

    private String category_name;

    private Date regdate;

    private int board_cnt;

    private int seq;

}

```

### 2. 자바의 변수 (*03_Ex05_Modifier, 03_Car.java)
---

1. instance variable >> class Car {private String color;}
    >>생성되는 객체마다 다른 색상을 가질 수 있다.

2. local variable >> class Car {public void move() {int speed = 0; 반드시 초기화}}
    main 함수 >> local variable

3. block variable >> class Car {public void move() {for(int i; i<10 ...} 제어 생성...

4. static variable >> 공유자원 (객체간), 객체 생성 이전에 memory 올라가는 자원 (영역: class area, me

    객체를 만드는 유일한 방법 : new 메모리에 ...
    static new 없이도 메모리에 올라가요!

    Ex06_Variable_Scope 클래스 >> 구체화(메모리) >> Ex06_Variable_Scope >> new 한적이 없어요
