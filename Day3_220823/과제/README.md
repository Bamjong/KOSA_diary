# 2022년 8월 23일 화요일
<br>

### [1번 문제]

## 알파벳(A~Z) 까지 출력하는 프로그램을 작성하세요(for 문을 사용하세요)

```java
public class Main{
    public static void main(String[] args) {
        for (int i = 65; i <= 90; i++) {
            int Alphabet = i;
            System.out.print((char)Alphabet + " ");
        }
    }
}
```

### [2번 문제]

## 1~100까지 10행 10열로 출력하는 프로그램을 작성하세요 (for문을 사용하세요)

```java
public class Main{
    public static void main(String[] args) {
        int plus = 0;
        for (int i = 1; i <= 10; i++) {
            for (int j = 1; j <= 10; j++) {
                System.out.print(++plus + " ");
            }
            System.out.println();
        }
    }
}
```

### [3번 문제] 

## 두개의 주사위를 던졌을 때 눈의 합이 6이 되는 모든 경우의 수를 출력하는 프로그램을 작성하세요

```java
public class Main{
    public static void main(String[] args){
        for(int i=1 ; i<=6 ; i++){
         for(int j=1 ; j<=6 ; j++){
          if(i+j==6)
           System.out.println(i+" "+j);
         }
        }
       }
}
```