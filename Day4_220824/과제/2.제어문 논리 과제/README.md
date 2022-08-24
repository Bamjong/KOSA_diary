# 문제
---
    가위 , 바위 ,보 게임 또 제어문을 통해서 작성하세요 (IF만 써서)

    예를 들면)

    컴퓨터가 자동으로 나온 가위 , 바위 , 보 에 대해서 사용자가 값을 입력 해서 처리 하세요

    ( 예를 들면 : 가위=> 1 , 바위 => 2 , 보 => 3)

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int user_Select_int = 0;
        String user_Select_String = "";
        int computer_int = 0;
        String computer_String = "";
        
        int result = user_Select_int - computer_int;

        computer_int = random();

            System.out.println("가위, 바위, 보 게임을 시작합니다!");
            System.out.println("1. 가위 | 2. 바위 | 3. 보 ");
            System.out.print("숫자를 입력하세요: ");

        
            user_Select_int = Integer.parseInt(sc.nextLine()); 

            if (user_Select_int == 1) {
            user_Select_String = "가위";
                } else if (user_Select_int == 2) {
            user_Select_String = "바위";
                } else if (user_Select_int == 3) {
            user_Select_String = "보";
                } 

            if (computer_int == 1) {
            computer_String = "가위";
                } else if (computer_int == 2) {
            computer_String = "바위";
                } else if (computer_int == 3) {
            computer_String = "보";
                } 

            System.out.printf("유저: %s | %s :컴퓨터\n",user_Select_String,computer_String);
 

            if(result == -2 || result == 1) {
                System.out.println("유저 승리!");
             } else if(result == -1 || result == 2) {
                System.out.println("컴퓨터 승리!");
             } else if(result == 0){
                 System.out.println("무승부");
             } else {
                 System.out.println("올바른 값을 입력해주세요!");
             }

           sc.close();
    }

     //랜덤 1,2,3
     public static int random(){
        double random = Math.random();
		random = (3*random+1); //1 <= random < 4;
		
        return (int)random;
        
    }
}
```