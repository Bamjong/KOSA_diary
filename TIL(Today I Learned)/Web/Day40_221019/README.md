# π Day40_221019

Author: κ³ λ²μ’
Created Time: 2022λ 10μ 19μΌ μ€ν 7:36
Status: π¨ Published
Updated Time: 2022λ 10μ 19μΌ μ€ν 7:40

# 1. μ€μ μ‘°λ³κ³Όμ 

β’ μνμ§ν₯μμμ μΌμΌ μν λ°μ€μ€νΌμ€ apiλ₯Ό κ°μ Έμμ νμ΄λΈμ λ£μ΄λ³΄κΈ°

```jsx
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <!β JavaScript Bundle with Popper β> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    <!-- <!β CSS only β>    -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <input type="date" value="" max="2022-10-19" id="client_date"><br><br>

<table class="table caption-primary">
  <caption id="movie_date"></caption>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">μνμ λͺ©</th>
      <th scope="col">κ°λ΄λ μ§</th>
      <th scope="col">ν΄λΉ λ§€μΆμ‘</th>
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

        //λ μ§ κ΅¬νκΈ°
        let client_date = document.getElementById("client_date").value
        let client_date_year = client_date.substring(0,4);
        let client_date_month = client_date.substring(5,7);
        let client_date_day = client_date.substring(8);

        client_date = client_date_year+client_date_month+client_date_day;

        //μν μ λ³΄ κ°μ Έμ€κΈ°
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

        //μΆλ ₯νκΈ°
        readTextFile("http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="+client_date, function(text){
            var data = JSON.parse(text);
            console.log(data);
            console.log(data.boxOfficeResult.dailyBoxOfficeList[0].movieNm);
            console.log(data.boxOfficeResult.dailyBoxOfficeList.length);

            

            for(let index=0; index<10; index++){
            
            //λ§€μΆμ‘ λ°μ  λ£κΈ°
            let money = data.boxOfficeResult.dailyBoxOfficeList[index].salesAmt;
            let result = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

            // μνμ λͺ© κ°λ΄λ μ§ λ§€μΆμ‘ κΈ°μ
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

- json κ°μ file I/O λλμΌλ‘ λΆλ¬μμ μμ±νμλ€.

μΆλ ₯)

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
			}catch(err){ //λ΄λΆμ μΌλ‘ μμ±λ μμΈ κ°μ²΄μ μ£Όμλ₯Ό λ°λλ€ 
				message.innerHTML = "input is " + err;
			}finally{
				document.getElementById("demo").value="";
			}
		}
	</script>
</html>
```

# ****3. Arrow FunctionΒ β****

β’ [https://www.w3schools.com/js/js_arrow_function.asp](https://www.w3schools.com/js/js_arrow_function.asp)

### **λ§€κ°λ³μκ° μλ ν¨μ κ΅¬ν**

```jsx
let bar = () => console.log("bar....");
bar();
```

### **πΒ λ§€κ°λ³μ 1κ° return ν¨μ**

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
document.getElementById("demo").innerHTML = hello("λ°©κ°λ°©κ°");
```

### **πΒ λ§€κ°λ³μκ° 2κ° μ΄μμΈ κ²½μ°**

```jsx
//function call(a,b){}
//let foo3 = (a,b) => {return a + b};
let foo3 = (a,b) => a + b;
let v2 = foo3(10,20);
console.log(v2)
```

### **πΒ ν¨μμ μ¬λ¬κ°μ λΌλ¦¬κ° ν¬ν¨λλ€λ©΄ { κ΅¬ν }**

```jsx
let foo4 = (a,b) => {let c = 100; return a+b+c};
let v3 = foo4(100,100);
console.log(v3)
```

### **πΒ μ¦μ μ€ν ν¨μ**

```jsx
(
    function(){
        console.log("μ¦μ μ€ν ν¨μ ....");
        //ν¨μλ νΈμΆμ μν΄μ μ€ν
    }()		
);
//μ μ½λλ₯Ό
//νμ΄ν ννμμΌλ‘ λ°κΎΈμ΄ λ³΄μΈμ
(
    ()=>{console.log("μ¦μ μ€ν ν¨μ ....")}
        //ν¨μλ νΈμΆμ μν΄μ μ€ν
    )();
```

### **πΒ 1.λ²μμ ν κ³Όμ λ₯Ό forEachλ₯Ό μ¬μ©ν΄ λ°κΏλ³΄κΈ°**

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