# 2022년 8월 23일 화요일
<br>

## [1번 문제]

### 알파벳(A~Z) 까지 출력하는 프로그램을 작성하세요(for 문을 사용하세요)

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

## [2번 문제]

### 1~100까지 10행 10열로 출력하는 프로그램을 작성하세요 (for문을 사용하세요)

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

## [3번 문제] 

### 두개의 주사위를 던졌을 때 눈의 합이 6이 되는 모든 경우의 수를 출력하는 프로그램을 작성하세요

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

## [4번 문제] 
===
   우리는 백화점 경품 시스템을 만들려고 한다

   경품 시스템은 나오는 점수에 따라 경품을 지급하는 시스템이다

   경품 추첨시 1000 점수가 나오면

   경품으로 TV , NoteBook , 냉장고 , 한우세트 , 휴지

   경품 추첨시 900 점수가 나오면

   경품으로  NoteBook , 냉장고 , 한우세트 , 휴지

   경품 추첨시 800 점수가 나오면

   경품으로  냉장고 , 한우세트 , 휴지

   경품 추첨시 700 점수가 나오면

   경품으로  한우세트 , 휴지

   경품 추첨시 600 점수가 나오면

   경품으로  휴지

   그외 점수는 100 ~ 500 까지는 칫솔 

   경품시스템의 점수 범위는 100 ~ 1000 점까지 한정되어 있다

   사용자가 경품 시스템을 사용시 랜덤하게 100 ~ 1000까지의 값이 나오게 

   되어 있습니다.

좀 더 깔끔한 정답으로 적어놓음

```java

public class giveway_answer {
	public static void main(String[] args) {
		int jumsu = ((int)(Math.random()* 10) + 1)*100;
		  System.out.println("추첨번호 : " + jumsu);
		  String msg="";//초기화
		  
		  msg+= "고객님의 점수는 :" + jumsu + " 이고 상품은 : ";  
		  switch(jumsu) {
		  	case 1000:msg+="Tv";
		  	case 900:msg+="NoteBook ";
		  	case 800:msg+="냉장고 ";
		  	case 700:msg+="한우 ";
		  	case 600:msg+="휴지 ";
		  	     break;
		  	default:msg+="칫솔";     
		  }
		  System.out.println(msg);
	}

}
```