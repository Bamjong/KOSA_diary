# 📚 Day36_221013

Author: 고범종
Created Time: 2022년 10월 13일 오전 9:20
Status: 🖨 Published
Updated Time: 2022년 10월 13일 오후 3:47

# 1. JavaScript

## 1-1. Scope(범위)

예시)

```jsx
<body>
    <p>Scope</p>
    <p id="demo1"></p>
    <p id="demo2"></p>
    <p id="demo3"></p>
    <p id="demo4"></p>

</body>

<script>
    let gname = "world";

    myFunction();
    function myFunction(){
        aaa="아무개"; //변수 인정: global  >> x 하지마세요
        console.log("aaa: " + aaa);

        var carname="Volvo"; //local...
        document.getElementById("demo1").innerHTML = typeof(carname) + " " + carname + "<hr>";
        document.getElementById("demo2").innerHTML = typeof(gname) + " " + carname + "<hr>";
    }
    console.log("aaa: " + aaa);
</script>
</html>
```

위와같이 myFuntion() 안에 아무런 변수를 안적고 단순하게 aaa=”아무개”; 만 작성하여도 global로 인정이 되어 함수 바깥에서도 실행이 된다.

그러므로 혼자 장난할때만 쓰지 웬만하면 쓰지 말아야 한다.

## 1-2 eval(문자형 계산)

<aside>
💡 문자형 수식 > 계산식으로 >> "10+20+30" >> eval() >> 10+20+30 >> 계산

</aside>

예시)

```jsx
<script>
        let str = "10+20+30";
        document.write(str + "<br>");

        /*
        1. eval()
        문자형 수식 > 계산식으로 >> "10+20+30" >> eval() >> 10+20+30 >> 계산
        "10+20A+30" >> Error
        문자형 숫자 -> 숫자
        */
       
        document.write("eval() " + eval(str) + "<br>");
    </script>
```

출력)

```jsx
10+20+30
eval() 60
```

## 1-3 Number(숫자함수)

예시)

```jsx
let i = "100";
        let j = "200";
        document.write("결합: " + (i+j)); // +산술 , 결합
        document.write("<br>연산 : " + (Number(i) + Number(j)));
```

출력

```jsx
결합: 100200
연산 : 300
```

- 숫자로 형변환 되서 계산이 가능!

## 1-4 focus, blur, this

```jsx
function bodyload(){
                console.log("load"); 
                //보장을 받는다
                //****body 안에 있는 모든 요소를 가지고 놀 수 있다...
                let data = document.myform.money.value;
                console.log(isNaN(data));
            }

            function focusFunc(){
                document.getElementById("myinput").style.background="gold";
            }
            function blurFunc(){
                document.getElementById("myinput").style.background="white";
            }
            function selectTag(){
                let value = document.myform.sel.value;
                alert(value);
            }
            function changeColr(obj){
                //JAVA: this (객체 자신)
                //JavaScript: this (POINT) (자신:요소자신)
                console.log(obj); //<input type="text" onmouseover="changeColr(this)"
                obj.style.backgroundColor="gold";    
            }
            function changeColr2(obj){
                console.log(obj); //<input type="text" onmouseover="changeColr(this)"
                obj.style.backgroundColor="white";    
            }
    </script>

</head>
<body onload="">
    <form action="#" name="myform">
        <input type="text" id="myinput" name="myinput" onfocus="focusFunc()" onblur="blurFunc()">
        <br>
        <select name="sel" onchange="selectTag()">
            <option value="A">AA</option>
            <option value="B">BB</option>
            <option value="C">CC</option>
            <option value="D">DD</option>
        </select>
        <br>
        <input type="text" onmouseover="changeColr(this)" onmouseout="changeColr2(this)">
        <br>
        <input type="text" onkeypress="alert('안돼안돼')">
        <br>
        <input type="text" value="1000" name="money">
        <br>
    </form>
</body>
</html>
```

## 1-5 Date()

```jsx
let today = new Date();
       console.log(today);
       console.log(today.getFullYear());
       console.log(today.getMonth()+1);
       console.log(today.getDate());
       console.log(today.getHours());
       console.log(today.getMilliseconds());
```

## 1-6 Math

```jsx
//JAVA : Math.Random() >> static 함수
       console.log(Math.random()); //0<= 범위 <1
       console.log(parseInt(Math.random()*45)+1); //0<= 범위 <1
       //javascript 로또 프로그램
       console.log(Math.round(Math.PI)); //반올림
       console.log(Math.max(3,7,36,7,2,88));
```

## 1-7 with()

```jsx
with(document){  //원래같은경우 document.write 해야하는데 with를 적어주어 안적어줘도됨
        write(str + "<br>");
}
```

## 1-8 문자열 관리 (substring)

```jsx
//POINT 문자열 관련함수
       let str = "ABCDEF";
//document.write()
       with(document){  //원래같은경우 document.write 해야하는데 with를 적어주어 안적어줘도됨
        write(str + "<br>");
        write(str.length + "<br>"); //6
        write(str.charAt(2)+ "<br>");  //C
        write(str.indexOf("D") + "<br>"); //3
        write(str.concat("홍길동") + "<br>"); //ABCDEF홍길동

        //slice(start,end)
        //substring(start,end)
        //substr(start,length)

        let str2 = str.replace("E","zzzzzzzzz");
        write(str2 + "<br>");
        //str = "ABCDEF"
        write(str.substring(2,4) + "<br>"); //cd
        write(str.substring(1,1) + "<br>"); //
        write(str.substring(1,2) + "<br>"); //B
        write(str.substring(1) + "<br><br>"); //BCDEF

				let strarr = "A B C D";
        let arr = strarr.split(" ");
        write(arr); //toString() 재정의 -> javascript Array가
```

## 1-9 개선된 for문

```jsx
//TODAY's POINT
        //JAVA: 개선된 for문
        //for(String s : arr) {s값 출력}

        //MS(c#), javascript >> in
        //javascript : for(let s in arr){}
        write("<br>");
        for(let index in arr){ //약속 개선된 for문 변수명 : index
            // write(index + " "); //0 1 2 3
            write(arr[index] + " "); //A B C D
```

- 그냥 쓰면 인덱스 값이 나옴.
- 그러므로 [] 대괄호를 작성하고 넣어줘야 값이 출력됨

## 예제)

<aside>
💡

함수를 생성하시고 onclick="" 함수 호출시
value="200-300 서울시 강남구 역삼동" 값을 가지고 와서
우편번호와 주소 분리
200-300
서울시 강남구 역삼동
부모창에 : window.opener 통해서 zipcode, addr에 값을 전달하세요
그리고 현재 창을 닫으세요.

</aside>

Ex12_popup.html

```jsx
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 
        함수를 생성하시고 onclick="" 함수 호출시
        value="200-300 서울시 강남구 역삼동" 값을 가지고 와서
        우편번호와 주소 분리
        200-300
        서울시 강남구 역삼동
        부모창에 : window.opener 통해서 zipcode, addr에 값을 전달하세요
        그리고 현재 창을 닫으세요.
     -->
    
    <script>
        function onclick_address(obj){
            console.log(obj);

            let zipcode = obj.substring(0,7);
            let address = obj.substring(8);
            console.log(zipcode);
            console.log(address);

            opener.document.mainform.zipcode.value = zipcode;
            opener.document.mainform.addr.value = address;

            close();
        }
    </script>
</head>
<body>
    <h3>DB연결 검색한 결과 출력된 화면(선택)</h3>
	<form action="" name="zipform">
		<input type="button" value="200-300 서울시 강남구 역삼동" name="btn" onclick="onclick_address(this.value)"><br>
		<input type="button" value="200-400 경기도 성남시 삼평동" name="btn" onclick="onclick_address(this.value)"><br>
		<input type="button" value="300-500 제주시 서귀포동"     name="btn" onclick="onclick_address(this.value)"><br>	
	</form>

    
</body>
</html>
```

Ex12_Script_Zipcode.html

```jsx
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우편번호 검색</title>
	<style type="text/css">
		table,tr,th,td{
			border: 1px solid blue;
			border-collapse: collapse;
		}
	</style>
</head>
<body>
	<form action="#" name="mainform">
		<table style="width: 500px">
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text" name="zipcode" readonly>
					<input type="button" value="우편번호검색" 
					       onclick="window.open('Ex12_popup.html','zip','width=500,height=500')">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" size="50px" name="addr">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
```