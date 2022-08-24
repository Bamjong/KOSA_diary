import java.util.Scanner;

public class Main{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        //변수는 위에 선언 후 초기화 하여 사용하도록
        int first = 0;
        int second = 0;
        String operator;

        int result = 0;
        

        System.out.print("입력값: ");
        first = Integer.parseInt(sc.nextLine());

        System.out.print("기호: ");
        operator = sc.nextLine();

        System.out.print("입력값: ");
        second = Integer.parseInt(sc.nextLine());


        if (operator.equals("+")) {
            result = first + second;
        } else if (operator.equals("-")) {
            result = first - second;
        } else if (operator.equals("*")) {
            result = first * second;
        } else if (operator.equals("/")) {
            result = first / second;
        } else if (operator.equals("%")) {
            result = first % second;
        } else {
            System.exit(1);
        }

        System.out.println("연산결과: " + result);
        
        sc.close();
        
    }
}

/*

간단한 사칙 연산기 (+ , - , * , /)

입력값 3개 (입력값은 nextLine() 받아서 필요하다면 숫자 변환)

목적 : Integer.parseInt() ,  **equals() 활용**

화면

>입력값:숫자

>입력값(기호): +

>입력값:숫자 

>연산결과 :200

​

-------------

>입력값:100

>입력값(기호): -

>입력값:100

>연산결과 :0

​

​

*/