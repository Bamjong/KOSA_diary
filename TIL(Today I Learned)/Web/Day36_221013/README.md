# π Day36_221013

Author: κ³ λ²μ’
Created Time: 2022λ 10μ 13μΌ μ€μ  9:20
Status: π¨ Published
Updated Time: 2022λ 10μ 13μΌ μ€ν 3:47

# 1. JavaScript

## 1-1. Scope(λ²μ)

μμ)

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
        aaa="μλ¬΄κ°"; //λ³μ μΈμ : global  >> x νμ§λ§μΈμ
        console.log("aaa: " + aaa);

        var carname="Volvo"; //local...
        document.getElementById("demo1").innerHTML = typeof(carname) + " " + carname + "<hr>";
        document.getElementById("demo2").innerHTML = typeof(gname) + " " + carname + "<hr>";
    }
    console.log("aaa: " + aaa);
</script>
</html>
```

μμκ°μ΄ myFuntion() μμ μλ¬΄λ° λ³μλ₯Ό μμ κ³  λ¨μνκ² aaa=βμλ¬΄κ°β; λ§ μμ±νμ¬λ globalλ‘ μΈμ μ΄ λμ΄ ν¨μ λ°κΉ₯μμλ μ€νμ΄ λλ€.

κ·Έλ¬λ―λ‘ νΌμ μ₯λν λλ§ μ°μ§ μ¬λ§νλ©΄ μ°μ§ λ§μμΌ νλ€.

## 1-2 eval(λ¬Έμν κ³μ°)

<aside>
π‘ λ¬Έμν μμ > κ³μ°μμΌλ‘ >> "10+20+30" >> eval() >> 10+20+30 >> κ³μ°

</aside>

μμ)

```jsx
<script>
        let str = "10+20+30";
        document.write(str + "<br>");

        /*
        1. eval()
        λ¬Έμν μμ > κ³μ°μμΌλ‘ >> "10+20+30" >> eval() >> 10+20+30 >> κ³μ°
        "10+20A+30" >> Error
        λ¬Έμν μ«μ -> μ«μ
        */
       
        document.write("eval() " + eval(str) + "<br>");
    </script>
```

μΆλ ₯)

```jsx
10+20+30
eval() 60
```

## 1-3 Number(μ«μν¨μ)

μμ)

```jsx
let i = "100";
        let j = "200";
        document.write("κ²°ν©: " + (i+j)); // +μ°μ  , κ²°ν©
        document.write("<br>μ°μ° : " + (Number(i) + Number(j)));
```

μΆλ ₯

```jsx
κ²°ν©: 100200
μ°μ° : 300
```

- μ«μλ‘ νλ³ν λμ κ³μ°μ΄ κ°λ₯!

## 1-4 focus, blur, this

```jsx
function bodyload(){
                console.log("load"); 
                //λ³΄μ₯μ λ°λλ€
                //****body μμ μλ λͺ¨λ  μμλ₯Ό κ°μ§κ³  λ μ μλ€...
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
                //JAVA: this (κ°μ²΄ μμ )
                //JavaScript: this (POINT) (μμ :μμμμ )
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
        <input type="text" onkeypress="alert('μλΌμλΌ')">
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
//JAVA : Math.Random() >> static ν¨μ
       console.log(Math.random()); //0<= λ²μ <1
       console.log(parseInt(Math.random()*45)+1); //0<= λ²μ <1
       //javascript λ‘λ νλ‘κ·Έλ¨
       console.log(Math.round(Math.PI)); //λ°μ¬λ¦Ό
       console.log(Math.max(3,7,36,7,2,88));
```

## 1-7 with()

```jsx
with(document){  //μλκ°μκ²½μ° document.write ν΄μΌνλλ° withλ₯Ό μ μ΄μ£Όμ΄ μμ μ΄μ€λλ¨
        write(str + "<br>");
}
```

## 1-8 λ¬Έμμ΄ κ΄λ¦¬ (substring)

```jsx
//POINT λ¬Έμμ΄ κ΄λ ¨ν¨μ
       let str = "ABCDEF";
//document.write()
       with(document){  //μλκ°μκ²½μ° document.write ν΄μΌνλλ° withλ₯Ό μ μ΄μ£Όμ΄ μμ μ΄μ€λλ¨
        write(str + "<br>");
        write(str.length + "<br>"); //6
        write(str.charAt(2)+ "<br>");  //C
        write(str.indexOf("D") + "<br>"); //3
        write(str.concat("νκΈΈλ") + "<br>"); //ABCDEFνκΈΈλ

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
        write(arr); //toString() μ¬μ μ -> javascript Arrayκ°
```

## 1-9 κ°μ λ forλ¬Έ

```jsx
//TODAY's POINT
        //JAVA: κ°μ λ forλ¬Έ
        //for(String s : arr) {sκ° μΆλ ₯}

        //MS(c#), javascript >> in
        //javascript : for(let s in arr){}
        write("<br>");
        for(let index in arr){ //μ½μ κ°μ λ forλ¬Έ λ³μλͺ : index
            // write(index + " "); //0 1 2 3
            write(arr[index] + " "); //A B C D
```

- κ·Έλ₯ μ°λ©΄ μΈλ±μ€ κ°μ΄ λμ΄.
- κ·Έλ¬λ―λ‘ [] λκ΄νΈλ₯Ό μμ±νκ³  λ£μ΄μ€μΌ κ°μ΄ μΆλ ₯λ¨

## μμ )

<aside>
π‘

ν¨μλ₯Ό μμ±νμκ³  onclick="" ν¨μ νΈμΆμ
value="200-300 μμΈμ κ°λ¨κ΅¬ μ­μΌλ" κ°μ κ°μ§κ³  μμ
μ°νΈλ²νΈμ μ£Όμ λΆλ¦¬
200-300
μμΈμ κ°λ¨κ΅¬ μ­μΌλ
λΆλͺ¨μ°½μ : window.opener ν΅ν΄μ zipcode, addrμ κ°μ μ λ¬νμΈμ
κ·Έλ¦¬κ³  νμ¬ μ°½μ λ«μΌμΈμ.

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
        ν¨μλ₯Ό μμ±νμκ³  onclick="" ν¨μ νΈμΆμ
        value="200-300 μμΈμ κ°λ¨κ΅¬ μ­μΌλ" κ°μ κ°μ§κ³  μμ
        μ°νΈλ²νΈμ μ£Όμ λΆλ¦¬
        200-300
        μμΈμ κ°λ¨κ΅¬ μ­μΌλ
        λΆλͺ¨μ°½μ : window.opener ν΅ν΄μ zipcode, addrμ κ°μ μ λ¬νμΈμ
        κ·Έλ¦¬κ³  νμ¬ μ°½μ λ«μΌμΈμ.
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
    <h3>DBμ°κ²° κ²μν κ²°κ³Ό μΆλ ₯λ νλ©΄(μ ν)</h3>
	<form action="" name="zipform">
		<input type="button" value="200-300 μμΈμ κ°λ¨κ΅¬ μ­μΌλ" name="btn" onclick="onclick_address(this.value)"><br>
		<input type="button" value="200-400 κ²½κΈ°λ μ±λ¨μ μΌνλ" name="btn" onclick="onclick_address(this.value)"><br>
		<input type="button" value="300-500 μ μ£Όμ μκ·ν¬λ"     name="btn" onclick="onclick_address(this.value)"><br>	
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
	<title>μ°νΈλ²νΈ κ²μ</title>
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
				<th>μ°νΈλ²νΈ</th>
				<td>
					<input type="text" name="zipcode" readonly>
					<input type="button" value="μ°νΈλ²νΈκ²μ" 
					       onclick="window.open('Ex12_popup.html','zip','width=500,height=500')">
				</td>
			</tr>
			<tr>
				<th>μ£Όμ</th>
				<td>
					<input type="text" size="50px" name="addr">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
```