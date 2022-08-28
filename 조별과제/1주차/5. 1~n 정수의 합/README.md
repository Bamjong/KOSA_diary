# 1부터 n까지의 정수의 합을 구해서 반환하는 메서드 작성. 7-4 (268p) //메서드 작성시 패키지는 각자 마음대로.



```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("몇까지 더할까요?: ");
        int count = Integer.parseInt(sc.nextLine());

        int result = 0;


        for (int i = 0; i < count; i++) {
            result += i;
            System.out.println(result);
        }
        
    }
}

```
출력
---
    몇까지 더할까요?: 5
    0
    1
    3
    6
    10