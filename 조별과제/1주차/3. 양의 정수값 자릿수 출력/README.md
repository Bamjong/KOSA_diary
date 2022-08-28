#### 양의정수값을 읽어서 그 자릿수를 출력하는 프로그램 작성.


```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("숫자를 입력하세요: ");
        int inputNum = Integer.parseInt(sc.nextLine());

        int number = 0;

        while (true){
            inputNum /= 10;
            number++;
            if(inputNum == 0){
                break;
            }
        }
        System.out.println(number);
    }
}
```
출력
---
    숫자를 입력하세요: 30000
    5