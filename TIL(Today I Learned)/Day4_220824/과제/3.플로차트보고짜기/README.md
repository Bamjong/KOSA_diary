# 문제
---
    아래 플로차트를 보고 프로그램을 짜 보세요

    UNIT : 화폐단위

    NUM : 화폐매수

    SW : 스위칭 변수 , 화폐의 다음 단위를 위해

    MONEY : 입력받는 금액

    ​

    아래 코드는 금액을 입력받아 

    예)

    12345

    10000 1개

    5000 0개

    1000 2개

    500 0개

    100 3개 

    50 0개

    10 4개

    5 1개

    1 0개

    를 계산하는 프로그램 입니다 

![이미지](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fpostfiles14.naver.net%2F20130420_13%2Fjavaking75_1366386553628N8kWb_PNG%2F2013-04-20_004909.png%3Ftype%3Dw2%22&type=cafe_wa740)

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int unit = 10000;  //화폐단위
        int num = 0;  //화폐매수
        boolean sw = false; //

        int money = Integer.parseInt(sc.nextLine());  //Money입력
        
        while(true){

            num = (money/unit);

            System.out.printf("unit값: %d \t num값: %d\n",unit,num);

            if (unit > 1) {
                    money = money - (unit * num);
            } else {break;}

            if (sw == false) {
                unit = unit / 2;
                sw = true;
            } else {
                unit = unit / 5;
                sw = false;
            }
        }
    }
}
```