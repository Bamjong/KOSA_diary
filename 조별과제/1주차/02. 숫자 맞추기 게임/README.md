#### 2자리의 정수값(10~99)을 맞추는 '숫자 맞추기 게임'을 만들자. 난수생성과 if문 그리고 do 문을 사용할것.


```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); // 스캐너
        Number number = new Number();   // Number 클래스
        
        int userInput = 0; //초기화
        int Random = number.Random(); // Number 클래스에 있는 Random을 입력

        while(userInput != Random){
            System.out.print("숫자를 입력해주세요: ");
            userInput = Integer.parseInt(sc.nextLine());

            number.UpAndDown(userInput, Random);
        }

        sc.close();
    }

}


// class method
class Number{

    int Random(){
        int Random =  (int)(Math.random() * (100-10) + 10);// 랜덤 최댓값 최소값 설정
        return Random;
    }

    // 업 다운 판독기
    void UpAndDown(int User_input, int Random){
        if (User_input < Random) {
            System.out.println("Up!");
        } else if (User_input > Random) {
            System.out.println("Down!");
        } else {System.out.println("맞췄습니다!");}
    }
}

```
출력
---
    숫자를 입력해주세요: 60
    Up!
    숫자를 입력해주세요: 70
    Up!
    숫자를 입력해주세요: 80
    Down!
    숫자를 입력해주세요: 75
    Up!
    숫자를 입력해주세요: 77
    Down!
    숫자를 입력해주세요: 76
    맞췄습니다!