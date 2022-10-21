# 📚 Day40_221019

Author: 고범종
Created Time: 2022년 10월 19일 오후 7:36
Status: 🖨 Published
Updated Time: 2022년 10월 19일 오후 7:40

# 1. 오전조별과제

• 영화진흥원에서 일일 영화 박스오피스 api를 가져와서 테이블에 넣어보기

```jsx
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <!— JavaScript Bundle with Popper —> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    <!-- <!— CSS only —>    -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <input type="date" value="" max="2022-10-19" id="client_date"><br><br>

<table class="table caption-primary">
  <caption id="movie_date"></caption>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">영화제목</th>
      <th scope="col">개봉날짜</th>
      <th scope="col">해당 매출액</th>
    </tr>
  </thead>
  <tbody id="tbody">
    <tr>
        <th scope="row">1</th>
        <td id="1_movieNm"></td>
        <td id="1_openDt"></td>
        <td id="1_salesAmt"></td>
    </tr>
    <tr>
        <th scope="row">2</th>
        <td id="2_movieNm"></td>
        <td id="2_openDt"></td>
        <td id="2_salesAmt"></td>
    </tr>
    <tr>
        <th scope="row">3</th>
        <td id="3_movieNm"></td>
        <td id="3_openDt"></td>
        <td id="3_salesAmt"></td>
    </tr>
    <tr>
        <th scope="row">4</th>
        <td id="4_movieNm"></td>
        <td id="4_openDt"></td>
        <td id="4_salesAmt"></td>
    </tr>
    <tr>
        <th scope="row">5</th>
        <td id="5_movieNm"></td>
        <td id="5_openDt"></td>
        <td id="5_salesAmt"></td>
    </tr>
    <tr>
        <th scope="row">6</th>
        <td id="6_movieNm"></td>
        <td id="6_openDt"></td>
        <td id="6_salesAmt"></td>
    </tr>
    <tr>
        <th scope="row">7</th>
        <td id="7_movieNm"></td>
        <td id="7_openDt"></td>
        <td id="7_salesAmt"></td>
    </tr>
    <tr>
        <th scope="row">8</th>
        <td id="8_movieNm"></td>
        <td id="8_openDt"></td>
        <td id="8_salesAmt"></td>
    </tr>
    <tr>
        <th scope="row">9</th>
        <td id="9_movieNm"></td>
        <td id="9_openDt"></td>
        <td id="9_salesAmt"></td>
    </tr>
    <tr>
        <th scope="row">10</th>
        <td id="10_movieNm"></td>
        <td id="10_openDt"></td>
        <td id="10_salesAmt"></td>
    </tr>
  </tbody>
</table>

</body>

<script>

    document.getElementById("client_date").addEventListener("change", () =>{

        //날짜 구하기
        let client_date = document.getElementById("client_date").value
        let client_date_year = client_date.substring(0,4);
        let client_date_month = client_date.substring(5,7);
        let client_date_day = client_date.substring(8);

        client_date = client_date_year+client_date_month+client_date_day;

        //영화 정보 가져오기
        function readTextFile(file, callback) {
            var rawFile = new XMLHttpRequest();
            rawFile.overrideMimeType("http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="+client_date);
            rawFile.open("GET", file, true);
            rawFile.onreadystatechange = function() {
                if (rawFile.readyState === 4 && rawFile.status == "200") {
                    callback(rawFile.responseText);
                }
            }
            rawFile.send(null);
        }

        //출력하기
        readTextFile("http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="+client_date, function(text){
            var data = JSON.parse(text);
            console.log(data);
            console.log(data.boxOfficeResult.dailyBoxOfficeList[0].movieNm);
            console.log(data.boxOfficeResult.dailyBoxOfficeList.length);

            

            for(let index=0; index<10; index++){
            
            //매출액 반점 넣기
            let money = data.boxOfficeResult.dailyBoxOfficeList[index].salesAmt;
            let result = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

            // 영화제목 개봉날짜 매출액 기입
            document.getElementById(index+1+"_movieNm").innerHTML = data.boxOfficeResult.dailyBoxOfficeList[index].movieNm;
            document.getElementById(index+1+"_openDt").innerHTML = data.boxOfficeResult.dailyBoxOfficeList[index].openDt;
            document.getElementById(index+1+"_salesAmt").innerHTML = result;
            }
            //document.getElementById("1_movieNm").innerHTML = data.boxOfficeResult.dailyBoxOfficeList[4].movieNm;
            
            document.getElementById("movie_date").innerHTML = data.boxOfficeResult.showRange;
        });

    });

</script>
</html>
```

- json 값을 file I/O 느낌으로 불러와서 작성하였다.

출력)

![https://cafeptthumb-phinf.pstatic.net/MjAyMjEwMTlfMTY4/MDAxNjY2MTY5NTA0Mzc3.imRQeBuPd8v6wD6Sfmx1lKlFU8F_mAyJ7fRCZVtrerIg.NME7GQZD49RsKKWTEML6wrDuUwycv_Jutu9qXz_KZ5gg.PNG/image.png?type=w1600](https://cafeptthumb-phinf.pstatic.net/MjAyMjEwMTlfMTY4/MDAxNjY2MTY5NTA0Mzc3.imRQeBuPd8v6wD6Sfmx1lKlFU8F_mAyJ7fRCZVtrerIg.NME7GQZD49RsKKWTEML6wrDuUwycv_Jutu9qXz_KZ5gg.PNG/image.png?type=w1600)

# 2. ****ETC Try****

```jsx
<body>
	<!-- <p id="demo"></p> -->
	<input type="text" id="demo">
	<button onclick="myFunc()">TEST INPUT</button>
	<p id="p01"></p>
</body>
<script type="text/javascript">
		/*
		try{
			add("welcome!!");
		}catch(err){
			document.getElementById("demo").innerHTML = err.message;
		}
		*/
		function myFunc(){
			let message , x;
			message = document.getElementById("p01");
			message.innerHTML="";
			
			x = document.getElementById("demo").value;
			
			try{
				if(x == "") throw "empty";	
				if(isNaN(x)) throw "not a number";
				X = Number(x);
				if(x < 5) throw "too low";
				if(x > 10) throw "too high";
			}catch(err){ //내부적으로 생성된 예외 객체의 주소를 받는다 
				message.innerHTML = "input is " + err;
			}finally{
				document.getElementById("demo").value="";
			}
		}
	</script>
</html>
```

# ****3. Arrow Function ✔****

• [https://www.w3schools.com/js/js_arrow_function.asp](https://www.w3schools.com/js/js_arrow_function.asp)

### **매개변수가 없는 함수 구현**

```jsx
let bar = () => console.log("bar....");
bar();
```

### **🔔 매개변수 1개 return 함수**

```jsx
//let foo2 = function(x) { return x}
let foo2 = x => x;
let data = foo2(100);
console.log(data);

let hello;
//hello = function(val){return "hello" + val}
//hello = (val)=> "hello" + val;
hello = val => "hello" + val;
let v = hello("aaaa");
console.log(v);
document.getElementById("demo").innerHTML = hello("방가방가");
```

### **🔔 매개변수가 2개 이상인 경우**

```jsx
//function call(a,b){}
//let foo3 = (a,b) => {return a + b};
let foo3 = (a,b) => a + b;
let v2 = foo3(10,20);
console.log(v2)
```

### **🔔 함수에 여러개의 논리가 포함된다면 { 구현 }**

```jsx
let foo4 = (a,b) => {let c = 100; return a+b+c};
let v3 = foo4(100,100);
console.log(v3)
```

### **🔔 즉시 실행 함수**

```jsx
(
    function(){
        console.log("즉시 실행 함수 ....");
        //함수는 호출에 의해서 실행
    }()		
);
//위 코드를
//화살표 표현식으로 바꾸어 보세요
(
    ()=>{console.log("즉시 실행 함수 ....")}
        //함수는 호출에 의해서 실행
    )();
```

### **🔔 1.번에서 한 과제를 forEach를 사용해 바꿔보기**

```jsx
let list = data.boxOfficeResult.dailyBoxOfficeList;

list.forEach(element => {
console.log(element);

let tr = document.createElement("tr");
let td = [document.createElement('td'), document.createElement('td'), document.createElement('td'), document.createElement('td'), document.createElement('td')];

td[0].appendChild(document.createTextNode(element.rank));
td[1].appendChild(document.createTextNode(element.movieNm));
td[2].appendChild(document.createTextNode(element.openDt));
td[3].appendChild(document.createTextNode(element.audiChange));
td[4].appendChild(document.createTextNode(element.audiInten));

tr.appendChild(td[0]);
tr.appendChild(td[1]);
tr.appendChild(td[2]);
tr.appendChild(td[3]);
tr.appendChild(td[4]);

console.log(tr);
console.log(table);
table.appendChild(tr);
    })
```