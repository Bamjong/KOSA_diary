# ๐ Day38_221017

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 10์ 17์ผ ์ค์  8:56
Status: ๐จ Published
Updated Time: 2022๋ 10์ 17์ผ ์คํ 9:37

# 1. JavaScript

## 1.1 ๋ถ๋ชจ, ์์ ์ฐธ์กฐ

(Ex24_Script_Dom.html)

### ๋ถ๋ชจ์ฐธ์กฐ

```
//DOM ๊ฐ์ฒด ์์ ....
            //๋ชจ๋  ์์์ ๋ํ ์ฌ์ฉ์ด ๊ฐ๋ฅ ....

            //๊ณ์ธต ํธ๋ฆฌ (nocd ๊ฐ๋ ์ ๊ทผ : ๋ถ๋ชจ, ์์, ํ์  ๊ฐ๋)
            let menode;
            menode = document.getElementById("me"); //div
            menode.style.backgroundColor="gold";

            let parentnode = menode.parentNode; //body
            parentnode.style.backgroundColor="green";

            let grandnode = parentnode.parentNode; //html;
            grandnode.style.backgroundColor="blue";
```

- div์ ๋ถ๋ชจ๋ body
- body์ ๋ถ๋ชจ๋ html
- ์ธ๊ฒ์ ํ์ธํ  ์ ์์๋ค.

### ์์์ฐธ์กฐ

```jsx
let my = document.getElementById("mychild");
            console.log(my)
            console.log(my.firstChild.nodeName); //LI
            console.log(my.firstChild.innerText); // LI > AA
            //innerHTML, innerText >> value์๋ ์น๊ตฌ >> p, div, li, span

            console.log(my.firstChild.nextSibling.innerText);

            console.log(my.childNodes);
            //์ง๋ฌธ: my.childNodes return type >> Array ^^
            //
            console.log(my.childNodes[0]);
            console.log(my.childNodes.length);
```

- ๊ฐ๊ฐ ์์์ ์ด๋ป๊ฒ ์ฐธ์กฐํด์ผํ๋์ง ์ ์ ์์๋ค.
- ์ฃผ๋ก childNodes๋ฅผ ์ด์ฉํ  ๊ฒ ๊ฐ๋ค.

## 1.2 addEventListener

- ํ๋์ ์์๋ ์ฌ๋ฌ๊ฐ์ event๋ฅผ ๊ฐ์ง ์ ์๋ค.
- ์ด๋ฒคํธ๊ฐ ๋ ์ด์ ํ์ํ์ง ์๋ค๋ฉด removeEventListner() ์ ๊ฑฐ ๊ฐ๋ฅ (๋จ addEvent ์ถ๊ฐ)

```jsx
document.getElementById("mybtn").addEventListener("click",displayText);

        function  displayText(){
                document.getElementById("demo").innerHTML = "hello world";
        }
```

```jsx
<body>
    <button id="mybtn">ํด๋ฆญ</button>
</body>
<script>
    let x = document.getElementById("mybtn");

    x.addEventListener("mouseover",myFunc);
    x.addEventListener("mouseout",myFunc2);
    x.addEventListener("click",myFunc3);

    function myFunc(){
        document.getElementById("mybtn").innerHTML += "Mouse Over<br>";
    }
    function myFunc2(){
        document.getElementById("mybtn").innerHTML += "Mouse Out<br>";
    }
    function myFunc3(){
        document.getElementById("mybtn").innerHTML += "Click<br>";
    }
</script>
```

```

### ๋ฌธ์ )

- a click ์ด๋ฒคํธ ์ฒ๋ฆฌํ์๊ณ 
- [0][1][2][3]
- ๋ค์ ๋งํฌ๋ฅผ ํด๋ฆญํ๋ฉด ๋ค์ image ๋ฅผ ๋ณด์ฌ์ฃผ์ธ์
- ์ด์  ๋งํฌ๋ฅผ ํด๋ฆญํ๋ฉด ์ด์  image ๋ฅผ ๋ณด์ฌ์ฃผ์ธ์

```jsx
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        onload = () => {
        let myphotos = ["images/1.jpg","images/2.jpg","images/3.jpg","images/4.jpg",]
        let index=0;
        console.log("index: " + index);

        document.getElementById("prv").addEventListener("click", () => {
            if(index == 0){
                index = myphotos.length;
            }
            document.getElementById("imgs").src = myphotos[--index];

            console.log(index);
        });

        document.getElementById("next").addEventListener("click", () => {
            if(++index == myphotos.length){
                index = 0;
            }
            document.getElementById("imgs").src = myphotos[index];

            console.log(index);
        });
            

        
        }
        
       
        

    </script>
</head>
<body>
    <h3>DOM ์ฌ๋ผ์ด๋</h3>
    <img src="images/1.jpg" alt="์ด๋ฏธ์ง" id="imgs" width="200" height="200">
    <hr>
    <a href="#" id="prv">์ด์ </a> || <a href="#" id="next">๋ค์</a>
</body>
</html>
```

## 1.3 ์บก์ณ๋ง / ๋ฒ๋ธ๋ง

### ์บก์ณ๋ง)

![https://camo.githubusercontent.com/4feef0e96827fee701a6091e66d9271aa6b5e11c30f9907ee2b7e9e2221a7496/68747470733a2f2f6a6f73687561313938382e6769746875622e696f2f696d616765732f706f7374732f7765622f6a6176617363726970742f6576656e742f6576656e742d636170747572652e706e67](https://camo.githubusercontent.com/4feef0e96827fee701a6091e66d9271aa6b5e11c30f9907ee2b7e9e2221a7496/68747470733a2f2f6a6f73687561313938382e6769746875622e696f2f696d616765732f706f7374732f7765622f6a6176617363726970742f6576656e742f6576656e742d636170747572652e706e67)

### ๋ฒ๋ธ๋ง)

![https://camo.githubusercontent.com/3327ddb5368c44f4a0c18948b597c8ab9606bc25c5d748a690ecd6a5eb90fb7f/68747470733a2f2f6a6f73687561313938382e6769746875622e696f2f696d616765732f706f7374732f7765622f6a6176617363726970742f6576656e742f6576656e742d627562626c652e706e67](https://camo.githubusercontent.com/3327ddb5368c44f4a0c18948b597c8ab9606bc25c5d748a690ecd6a5eb90fb7f/68747470733a2f2f6a6f73687561313938382e6769746875622e696f2f696d616765732f706f7374732f7765622f6a6176617363726970742f6576656e742f6576656e742d627562626c652e706e67)

## 1.4 Object

ํด๋์ค ์ ์ 3๊ฐ์ง ๋ฐฉ๋ฒ

- **ํ๋กํ ํ์ ๋ฐฉ์** : ์ผ๋ฐ์ ์ธ ํด๋์ค ์ ์ ๋ฐฉ๋ฒ
- ****ํจ์ ๋ฐฉ์ :**** ๊ฐ๋จํ ํด๋์ค ์ ์ ์ ์ฌ์ฉ
- ****๋ฆฌํฐ๋ด ๋ฐฉ์ :**** ์์ฃผ ์ด์ฉ ๋ฐฉ์

### ํ๋กํ ํ์ ๋ฐฉ์

โข ์ธ์คํด์ค๋ง๋ค ๊ณตํต๋ ๋ฉ์๋๋ฅผ ๊ณต์ ํด์ ์ฌ์ฉํ๋ ์ฅ์ 

```jsx
function ํด๋์ค์ด๋ฆ() {
    this.ํ๋กํผํฐ1 = ์ด๊ธฐ๊ฐ;
    this.ํ๋กํผํฐ2 = ์ด๊ธฐ๊ฐ;
}

ํด๋์ค์ด๋ฆ.prototype.๋ฉ์๋1 = function() {

}

ํด๋์ค์ด๋ฆ.prototype.๋ฉ์๋2 = function() {

}

var ์ธ์คํด์ค = new ํด๋์ค์ด๋ฆ(); 
var carObj = new Car();
var carObj2 = new Car();
var carObj3 = new Car();
```

### ํจ์ ๋ฐฉ์

- ์ธ์คํด์ค๋ง๋ค ๋ฉ์๋๊ฐ ๋๋ฆฝ์ ์ผ๋ก ๋ง๋ค์ด์ง๋ ๋จ์ 
- ํด๋์ค : function Car(){ this.name = , this.age=}
- ํจ์ : function car(){}

```jsx
function ํด๋์ค์ด๋ฆ() {
    this.ํ๋กํผํฐ1 = ์ด๊ธฐ๊ฐ;
    this.ํ๋กํผํฐ2 = ์ด๊ธฐ๊ฐ;
        this.๋ฉ์๋1 = function() {
        }

    this.๋ฉ์๋2 = function() {

    }

}

var ์ธ์คํด์ค = new ํด๋์ค์ด๋ฆ(); 
var carObj = new Car();
var carObj2 = new Car();
var carObj3 = new Car();
```

### ****๋ฆฌํฐ๋ด ๋ฐฉ์****

- ํด๋์ค ๋ง๋๋ ์ฉ๋๋ ์๋๋ฉฐ ์ฃผ๋ก ์ฌ๋ฌ๊ฐ์ ๋งค๊ฐ๋ณ์๋ฅผ ๊ทธ๋ฃน์ผ๋ก ๋ฌถ์ด ํจ์์ ๋งค๊ฐ๋ณ์๋ก ๋ณด๋ผ๋ ์ ์์ ํจ๊ป ์ธ์คํด์ค๊ฐ ๋ง๋ค์ด์ง๋ ์ฅ์ ์ด ์์
- ๋จ ์ธ์คํด์ค๋ ์ค์ง ํ๋

```jsx
let product = { ์ ํ๋ช:'์ฌ๊ณผ', ๋๋:'2000' , ์์ฐ์ง:'๋๊ตฌ' };
```

## ****๐ย <javascript ๊ฐ์ฒด ์์ฑ>****

- ์ค๋ธ์ ํธ ๋ฆฌํฐ๋ด ๋ฐฉ์ (๊ฐ์ฒด๋ฅผ ๋ง๋๋ ๋ฐฉ๋ฒ): ํด๋์ค ์์ฑ๊ณผ ๋์์ ๊ฐ์ฒด๊ฐ ๋ง๋ค์ด์ง๋ค
- > ๋ฆฌํฐ๋ด ๋ฐฉ์ >> ์ ์ผ ๊ฐ๋จํ ๋ฐฉ๋ฒ > var obj = {}; //var objarr = [] ๋ฐฐ์ด
- > JSON ํ๊ธฐ : {} >> JSON: JavaScript Object Notation

```jsx
ex) var myObj = { "name":"John", "age":31, "city":"New York" };
```

```jsx

```