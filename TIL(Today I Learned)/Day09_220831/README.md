# 2022년 8월 31일 수요일
<br>

## 프로젝트
    나는 2조이다.
### 로또
    1. 1~45까지의 난수를 발생시켜 6개의 배열에 담으세요

    (int)(Math.random()*45 + 1)

    lotto[0] = 44 , lotto[1] = 1 .... lotto[5] = 33

    2. 배열에 담긴 6개의 배열값은 중복값이 나오면 안되요  (중복값 검증 :별찍기 비슷)

    3. 배열에 있는 6개의 값은 낮은 순으로 정렬 시키세요  (정렬 : 자리바꿈)

    4. 위 결과를 담고 있는 배열을 출력하세요 (화면 출력)

    
    추가)

    로또 6개의 평균이 15에서 35 사이면 추출하고 그렇지 재추출 ....

    내가 입력한 2개 번호는 추출하지 않는다

    짝수는 번호는 추출하지 않는다

    등등 

    
    //로또 시스템 class 설계 하세요 ^^

    //목적  : 클래스의 구성 요소를 이해하고 활용 할 수 있다

    //member field , constructor , method  활용

    //접근자 한정자의 사용 , static 활용 등 .....

    //기능을 함수 단위로 분리 할 수 있다 ^^

    //함수의 return type 과  parameter 를 활용할 수 있다
    

<br>
<br>


### 영화예매
    아래와 같은 영화관 좌석예매 프로그램을 만드세요

    아래와 같지 않아도 됩니다.

    예매 , 조회 , 취소 가능하면 됩니다 ^^

![이미지](https://cafeptthumb-phinf.pstatic.net/MjAyMDAzMTRfMjI5/MDAxNTg0MTgxNzYxOTgz.Mn8XB87cbubNobUCtSyQ-Y_jQMKPZKIt5hsTeYTdkNYg.WCJwPhKAT0ayFM1jznJWCb4qVc-ngZ0VHSZB8gb3K4Qg.PNG/cinema2_3%EC%A1%B0.png?type=w800)

---


    이번에 하면서 문제가 하나 있었는데 그것은 바로 
```java
Scanner sc = new Scanner(System.in);
Integer.parseInt(sc.nextLine());
```
    를 작성하면 엔터 값까지 출력이 되는 것이었다...

    이거를 찾지 못해 끙끙 앓다 제출하였다.

    하나씩 해석하며 뭐가 잘못되었는지 알아보다
    아~~ 하고 알게 된 오류이다.

    앞으로는 이런 실수를 발견하면 바로 고칠 수 있는 계기가 될 것이라 믿는다.

![이미지](https://jandi-box.com/files-thumb/28106203/16619389316600921c760cc80d7c28242ecd48070514f?size=640)

    nextInt() 메소드 다음에 nextLine() 메소드를 실행하려고 할때 nextLine()메소드가 그냥 넘어가버리는 오류가 생겨난다.
    이 이유는 nextInt()메소드를 실행 할 때 20을 콘솔에 입력하고 엔터를 누를때 20을 리턴시켰지만 Enter값은 그대로 남아있다.
    nextLine() 메소드는 Enter값을 기준으로 메소드를 종료시키기 때문에 nextLine()메소드가 실행될 때 남아있는 Enter값을 그대로 읽어 바로 종료된 것이다.
    그래서 첫번째 문자열입력: 이 넘어가고 두번째 정수입력: 이 출력된 것이다.만약 정수를  입력하고 그다음 문자를 입력하려고 할 때 next() 메소드를 사용하여야 한다.
    아니면 위에 nextLine()메소드를 한번더 써줘서 enter값을 없애줘야한다.
출처: https://deftkang.tistory.com/55 [deftkang의 IT 블로그:티스토리]