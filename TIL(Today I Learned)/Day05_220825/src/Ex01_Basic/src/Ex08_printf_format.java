import java.util.Scanner;

public class Ex08_printf_format {

   public static void main(String[] args) {
      System.out.println(); //출력하고 줄바꿈(엔터)
      System.out.print("A");
      System.out.print("B");
      System.out.print("C");
      System.out.println();
      System.out.println("C");
      System.out.println();
      
      int num = 100;
      System.out.println(num);
      System.out.println("num값은" + num + " 입니다.");
      
      //형식 format
      System.out.printf("num 값은 %d입니다.", num);
      System.out.printf("num 값은 [%d] 입니다. 또 [%d]도 있습니다. \n" , num, 12345);
      
      //format 형식문자
      /*
       * %d (10진수 형식의 정수)
       * %f (실수)
       * &s (문자열)
       * %c (문자)
       * \t tabl, \n enter
       */

      float f = 3.14f;
      System.out.println(f);
      System.out.printf("f변수값 %f 입니다 \n",f);
      
      
      ////////////////////////////////////////////////////////////////////////////////////////
      // 					8/24일부터 한거
      
      /*
	  입력받기 (cmd) 사용자가 입력한 값을 ...
	  Scanner sc = new Scanner(System.in);
	  String value = sc.nextLine();
	  입력하고 엔터를 칠때까지 대기 (프로그램 종료 되지않고 계속 대기)
	  입력한 값을 문자열 전달해주어요 ^^
	  System.out.println(value);
	  
	  int number = sc.nextInt();
	  System.out.println("number : " + number);
	  
	  권장사항 : Int로 받기보단 nextLine() read 타입을 바꾸자
	  
	  Today's Point
	  
	  [문자를] => 숫자를 (정수, 실수)
	  Integer.parseInt("11111") ->> 정수 ->> 11111
	  Float.parseFloat("3.14") ->> 실수 ->> 3.14
	  
	  문자열의 비교는 == 를 쓰지 않아요
	  그래서 일단
	  String str = "+"; 이런 값이 있다면
	  if(str == "+") 하지 마시고
	  if(str.equals("+")) 하시면 됩니다
	  
      */
      Scanner sc = new Scanner(System.in);
      
      System.out.println("숫자를 입력하세요");
      int number = Integer.parseInt(sc.nextLine());
      System.out.println("정수값 : " + number);
      
      
      
      
   }

}