# 입력한 점수에 따라 수/우/미/양/가 판정하는 프로그램 작성(점수 기준 판정은 각자 알아서 정하기

```java
import java.util.Scanner;

public class Main{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int User = 0;
        String name = "";
        
        User = Integer.parseInt(sc.nextLine());  //유저 점수 기입

        //삼항연산자 이용
        name =  90 <= User ? "수" :
                80 <= User ? "우" :
                70 <= User ? "미" :
                60 <= User ? "양" : "가"; 

        System.out.println(name);
        
                    
        sc.close();
    }
}
```
출력
---
    60
    양
    97
    수