import java.util.Iterator;
import java.util.Random;

public class Ex06_Operation {

	public static void main(String[] args) {
		int result = 100/100;
		System.out.println(result);
		
		result = 13/2; // 몫
		System.out.println(result);

		//나머지를 구하는 연산자 (%)
		result = 13 % 2;
		System.out.println(result);
		
		//증가, 감소 (증가감 연산자 : ++(1씩증가), --(1씩감소))
		int i = 10;
		++i; //전치증가
		System.out.println("전치 : " + i);
		i++; //후치증가
		System.out.println("후치 : " + i);
		//혼자는 전치, 후치의 의미가 없다
		
		//Today Point (증가감 연산자 다른 연산자와 결합되면 전치, 후치)
		int i2 = 5;
		int j2 = 4;
		int result2 = i2 + ++j2;
		System.out.println("result2 : " + result2 + " j2: " + j2); // result2: 10 ,  j2: 5
		
		result2 = i2 + j2++;
		System.out.println("result2 : " + result2 + " j2: " + j2); // result2: 10 ,  j2: 6
		
		
		////////////////////////////////////////////////////////////////////////////////////////////
		
		
		byte b = 100;
		byte c = 1;
		
		//byte d = b
		
		//byte d = b + c;
		
		/*
		 Today Point
		 
		 1. 정수의 모든 연산은 [int] 타입 변환 후 처리
		 ex)	byte = short => 컴파일러가 내부적으로 int + int
		 		char + char => 컴파일러가 내부적으로 int + int
		 		연산 처리시
		 		정수의 연산에서 int 보다 작은 타입은 int변환 연산 (long 제외)
		 		byte, char, short >> 연산시에는 > int방에 넣어서 계산 > int
		 		
		 		char + int >> int + int
		 		int + long >> long + long 예외적으로 .....
		 		
		 		정수 + 정수 >> 타입의 크기와 상관없이 >> 실수 승자
		 */
		
		 char c2 = '!';
		 char c3 = '!';
		 int result6 = c2 + c3;
		 System.out.println("result6 : " + result2);
		 
		 ////////////////////////////////////////////////////////////////////////////////////////////
		 
		 //제어문
		 //중소기업 시험문제 (구구단 출력) >> 삼각형 별찍기 >> 연습
		 
		 int sum = 0; //local variable
		 for (int j = 0; j <= 100; j++) {
			//sum += j; //sum = sum + j;
			if (j % 2 == 0) {  //짝수라면
				sum += j; //짝수의 합 (1~100)
			}
		}
		System.out.println("sum: " + sum); 
		
		//== 연산자 (값을 비교하는 연산자)
		   if(10 == 10.0f) { //타입을 비교하는 것이 아니고 가지고 있는 값을 비교
			   System.out.println("true");
		   }else {
			   System.out.println("false");
		   }
		   
		   // ! 부정 연산자 
		   if('A' != 65) { //같지 않니
			   System.out.println("어 같지 않아 : true");
		   }else {
			   System.out.println("어 같은 값이야 : false");
		   }
		   
		   //암기하자 (Today point)
		   //연산자중에서 제어문역할을 하는 ...녀석
		   //삼항연산자
		   int p = 10;
		   int k = -10;
		   int result8 = (p == k) ?  p : k;
		   
		   //위 코드를 if문을 사용해서 처리하세요
		   int result9=0;
		   if(p == k) {
			  result9 = p;
		   }else {
			  result9 = k;
		   }
		   
		   //진리표
		   //논리연산
		   //0 : false
		   //1 : true
		   
		   /*       OR 연산   ,  AND 연산
		     0 0      0          0
		     0 1      1          0 
		     1 0      1          0
		     1 1      1          1
		     
		    DB (Oracle) SQL언 자연어 (인간이 ...)
		    select *
		    from emp
		    where job='IT' and sal > 2000 (그리고 둘다 참인 경우)
		      
		    select *
		    from emp
		    where job='IT' or sal > 2000  (이거나 또는 둘중에 하나만 참이어도 만족)
		      
		    연산자(비트)
		    | or연산
		    & and 연산
		    
		    || 논리연산(OR)
		    && 논리연산(AND)  
		      
		    */
		
		
		System.out.println("Math.random() : " + Math.random());
        
        //0~9
        System.out.println("Math.random() * 10 : " + Math.random() * 10);
        
        //1~10
        System.out.println("((int)Math.random() : *10)) + 1 :" + ((int)Math.random() * 10 +1));
  }
	}


