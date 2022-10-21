#### "안녕하세요"라고 표시하는 hello 메서드 작성. 7-5 (270p) !!!main 함수에서 scanner와 반복문을 사용하여, hello 메소드를 10번 이상 호출하여 출력하기)!!!!





```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Hello hello = new Hello();

        System.out.print("몇번 입력하시겠습니까? ");
        int count = Integer.parseInt(sc.nextLine());

        for (int i = 0; i < count ; i++) {
            hello.hi();
        }


    }
}

class Hello{

    public void hi(){
        System.out.println("안녕하세요");
    }
}
```

출력
---
    몇번 입력하시겠습니까? 6
    안녕하세요
    안녕하세요
    안녕하세요
    안녕하세요
    안녕하세요
    안녕하세요