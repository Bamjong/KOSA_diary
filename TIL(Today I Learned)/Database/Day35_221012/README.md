# 📚 Day35_221012

Author: 고범종
Created Time: 2022년 10월 12일 오전 9:25
Status: 🖨 Published
Tags: JavaScript
Updated Time: 2022년 10월 12일 오후 10:00

# 1. Javascript

## javascript 사용

1. html 의 content , attribute 변경 , 삭제 , 추가 [동적]으로
2. css 속성 변경 , 삭제 , 추가 [동적]으로
3. 유효성 검증 (id 입력, 주민번호 맞는지 , 데이터 숫자 ...검증)
4. 동적인 웹 화면 구성 (화면구성)
5. 전 세계적으로 1위 언어
    - 모든 개발 회사 , 개발자 관심 ....

- javascript > 효율적으로 > 코드량 줄이고 > 많이 쓰는 재사용 > lib or FrameWork
- 50줄의 코드 구현 .. 내가 만든 것을 당신이 ... 5줄로 할 수 있어
- jquery.js (내부적인 코드 : javascript) >> 안에 있는 자원을 활용 > 생산성 극대화
- angular.js(MVC) , vue.js , react.js ...... 100여가지가 넘는 ....
- 우리나라 개발 회사 (javascript : FrameWork)
- 신규 : vue.js , react.js (Front) 단점: 버전변경 .... 사라질 수 도 있다
- Front 최소 : vue.js 또는 react.js

- javascript 언어 웹 브라우져 없이 로컬 서버에서 동작 (마치 java 처럼)
- Node.js®는 Chrome V8 JavaScript 엔진으로 빌드된 JavaScript 런타임입니다.
- back 단의 코드 javascript 대체 >> 서브 (채팅 서버, 보조 서버) >> npm 학습

1. 문법 (java 흡사 ...)
    
    6.1 대소문자를 엄격하게 구분
    
    6.2 종결자 ;
    
    6.3 타입(var , const , let) : let i="A"; let s = "aaa"; const NUM=100;
    
    유연한 언어 : var v; v=10 이때 내부적으로 (값을 받는 시점에) >> number
    
    ex) int i =10; double d = 3.14;
    
    연산자 , 제어문(java 동일) , 객체
    
    6.4 사용법 (css 사용법과 동일)
    
    - in-line (태그 안쪽에 : <p onclick="<script>...")
    - internal(page 안에서 일반적으로 <head><script> ...코드</head>)
    - external(외부 파일 :common.js >> link 방식) 선호 (유지보수 , 재사용)
    
    ## 함수 사용 방법
    
    inline 방식
    
    ```html
    <input type="button" value="inline" onclick="alert('hello')">
    ```
    
    internal 방식
    
    ```html
    function call() {
    		alert('internal');
    	}
    
    <input type="button" value="internal" onclick="call()">
    ```
    
    external 방식
    
    ```html
    <script type="text/javascript" src="script/common.js"></script>
    //script 폴더 안에 common.js 파일 만들어주기
    <input type="button" value="external" onclick="excall()">
    ```
    
    ## 변수 타입
    
    ## var, let , const
    
    ```jsx
    var num; //타입이 정해지지 않아요 (정수, 문자, 날짜 올 수 있어요)
            console.log(num); //undefined 정상 출력 ... 정의 아직 안됨...
            num = 10; //값을 가지는 순간 내부적으로 타입 결정
            console.log("num:" + num);
    
            let num2=100;
            console.log(num2);
            console.log(typeof(num)); //number
    ```
    
    - 요즘은 일반적으로 var은 안쓰이므로 let과 const를 쓰면된다.
    
    ```html
    1. 변수생성 > 값입력 > 타입설정 (number, string)
        var a; 정의되지 않았다
        var b; 정의되지 않았다
        a=10; 타입설정 number
        b="A"; 타입설정 string
        ES5 이전 문법 (var) >> 2015 ES6(ECMA) >> let, const
    
    				var, let, const
            권장: let, const
    ```
    
    ## DOM script
    
    ```html
    문서가 실행되면.... 웹 브라우저 메모리에 body 안에 요소가 로딩 ..
            메모리에 DOM tree 형태로 ... 필요에 따라서 접근 .. 놀면 돼요
            DOM
            html
             |
            head - body
    
            DOM script (개발은 ...): getElementById
    ```
    
    예제)
    
    ```jsx
    <script>
            /*
            문서가 실행되면.... 웹 브라우저 메모리에 body 안에 요소가 로딩 ..
            메모리에 DOM tree 형태로 ... 필요에 따라서 접근 .. 놀면 돼요
            DOM
            html
             |
            head - body
    
            DOM script (개발은 ...): getElementById
            */
           function print(){
                let ele = document.getElementById("demo");
                console.log(ele);
                ele.innerHTML="아 배고프다";
           }
    
        </script>
    
    </head>
    <body>
            <button onclick="print()">클릭하세요</button>
            <p id="demo">demo라는 id는 p태그의 주소(식별자)</p>
    </body>
    ```
    
    ## 초기화
    
    처음 값을 가지는 것.
    
    - javascript (정수, 실수, boolean, 문자)
    - JAVA: int i=100; float f=3.14f;
    - 내부적으로 가지고 있는 타입: number, boolean, Array, Object ...타입
    
    ## 변수 (scope)
    
    - 현재 page >> Ex04_Script_html >> 유효
    1. let name="kglim"; 페이지 전체 (global: 전역변수)
    2. 함수안에 있는 let age=20; 함수안에 유효 * (local: 지역변수)
    
    ```jsx
    let n; //초기화가 되어 있지 않아요 (타입이 없어요)
            console.log(n);
            n=100;
            //**** javascript 전역, 지역 변수는 초기화하고 사용하자 ****
    ```
    
    예제)
    
    ```jsx
    let intnum = 100; //정수
    let dnum= 12.345; //실수
    let flag = true; //boolean
    let str = null; //값이 없다
    let str2 = "ABC"; //문자열
    
    console.log(typeof(intnum)); //number
    console.log(typeof(dnum)); //number
    console.log(typeof(flag)); //boolean
    console.log(typeof(str)); //object
    console.log(typeof(str2)); //string
    ```
    
    출력)
    
    ![https://user-images.githubusercontent.com/92353613/195254301-b4e50b78-3642-4450-82f7-f88f518cedc0.png](https://user-images.githubusercontent.com/92353613/195254301-b4e50b78-3642-4450-82f7-f88f518cedc0.png)
    
    ## 연산자
    
    - 산술( +, -, /, %)
    
    예시)
    
    ```jsx
    let num1 = 10;
            let num2 = 3;
            document.write(num1/num2 + "<br>"); //실수
            document.write(num1%num2 + "<br>"); //나머지
    ```
    
    출력)
    
    ```jsx
    3.3333333333333335
    1
    ```
    
    ## 관계
    
    - ( === (값과 타입도 비교) ), !=, >= …
    
    예시)
    
    ```jsx
    let a = 3;
            let b = 5;
            console.log((a==b)+"<br>");
            console.log((a!=b)+"<br>");
            console.log((a>b)+"<br>");
    ```
    
    출력)
    
    ```jsx
    false
    true
    false
    ```
    
    ## 논리
    
    - (&&, ||)
    
    예시)
    
    ```jsx
    console.log((10>5) && (1 !=3)); //true
    console.log((10<5) || (1 !=3)); //true
    ```
    
    출력)
    
    ```jsx
    true
    true
    ```
    
    ## 삼항 연산자
    
    예시)
    
    ```jsx
    let result2 = (4%2 == 0) ? "짝수":"홀수";
            console.log(result2);
            document.write(result2);
    ```
    
    출력)
    
    ```jsx
    짝수
    ```
    
    ## 대입 연산자
    
    - (+=, -=, *=, /=)
    
    예시)
    
    ```jsx
    let p = 10;
    let k = 5;
    p+=k; // p = p + k;
    console.log(p);
    
    let x =5+5;
    let y = "5" + 5 + 5 + "2"; // (산술, 결합) >> 결합 ^^
    console.log(x);
    console.log(y);
    
    let v = "5";
    let v2 = 5;
    let v3 = 5;
    console.log(v == v2); // ==값을 비교하는 연산자
    console.log(v === v2); //POINT: 값만 같은 것이 아니라 타입도 동일
    ```
    
    ## 문제)
    
    - for 1~100까지
    - int sum = 0;
    for (int i = 0; i <= 100; i++) {sum += i;}
    
    예시)
    
    ```
    let sum = 0;
            for (let i = 0; i <= 100; i++) {
                sum += i;
            }
            document.write(sum + "<br>");
    ```
    
    출력)
    
    ```idris
    5050
    ```
    
    예시)
    
    - 구구단 출력
    
    ```idris
    for (let i = 1; i < 10; i++) {
                for (let j = 1; j < 10; j++) {
                    document.write(i + "x" + j  + "=" + i*j + "&nbsp;&nbsp;&nbsp;");
                }  
                document.write("<br>");
            }
    ```
    
    출력)
    
    ```idris
    1x1=1   1x2=2   1x3=3   1x4=4   1x5=5   1x6=6   1x7=7   1x8=8   1x9=9   
    2x1=2   2x2=4   2x3=6   2x4=8   2x5=10   2x6=12   2x7=14   2x8=16   2x9=18   
    3x1=3   3x2=6   3x3=9   3x4=12   3x5=15   3x6=18   3x7=21   3x8=24   3x9=27   
    4x1=4   4x2=8   4x3=12   4x4=16   4x5=20   4x6=24   4x7=28   4x8=32   4x9=36   
    5x1=5   5x2=10   5x3=15   5x4=20   5x5=25   5x6=30   5x7=35   5x8=40   5x9=45   
    6x1=6   6x2=12   6x3=18   6x4=24   6x5=30   6x6=36   6x7=42   6x8=48   6x9=54   
    7x1=7   7x2=14   7x3=21   7x4=28   7x5=35   7x6=42   7x7=49   7x8=56   7x9=63   
    8x1=8   8x2=16   8x3=24   8x4=32   8x5=40   8x6=48   8x7=56   8x8=64   8x9=72   
    9x1=9   9x2=18   9x3=27   9x4=36   9x5=45   9x6=54   9x7=63   9x8=72   9x9=81
    ```