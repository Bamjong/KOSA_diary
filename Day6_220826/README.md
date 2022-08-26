# 2022년 8월 26일 금요일
<br>


### 1. getter / setter (*03_Car.java)
---

#### 실무코드의 특징

 1. 캡슐화 (member field)
 2.	캡슐화 (간접적으로 처리 : setter/getter)
 3. 이런 데이터를 담을 수 있는 클래스 (VO, DTO, DOMAIN)

    필요에 따라서 (setter 만)			>> write
    필요에 따라서 (getter 만)			>> read
    필요에 따라서 (setter, getter 만)	>> write, read
	
    일단은 굳이 따로 하지말고 그냥 둘다 쓰세요!


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