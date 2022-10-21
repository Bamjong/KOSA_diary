# 📚 Day38_221017

Author: 고범종
Created Time: 2022년 10월 17일 오전 8:56
Status: 🖨 Published
Updated Time: 2022년 10월 17일 오후 9:37

# 1. JavaScript

## 1.1 부모, 자식 참조

(Ex24_Script_Dom.html)

### 부모참조

```
//DOM 객체 자원 ....
            //모든 자원에 대한 사용이 가능 ....

            //계층 트리 (nocd 개념 접근 : 부모, 자식, 형제 개념)
            let menode;
            menode = document.getElementById("me"); //div
            menode.style.backgroundColor="gold";

            let parentnode = menode.parentNode; //body
            parentnode.style.backgroundColor="green";

            let grandnode = parentnode.parentNode; //html;
            grandnode.style.backgroundColor="blue";
```

- div의 부모는 body
- body의 부모는 html
- 인것을 확인할 수 있었다.

### 자식참조

```jsx
let my = document.getElementById("mychild");
            console.log(my)
            console.log(my.firstChild.nodeName); //LI
            console.log(my.firstChild.innerText); // LI > AA
            //innerHTML, innerText >> value없는 친구 >> p, div, li, span

            console.log(my.firstChild.nextSibling.innerText);

            console.log(my.childNodes);
            //질문: my.childNodes return type >> Array ^^
            //
            console.log(my.childNodes[0]);
            console.log(my.childNodes.length);
```

- 각각 자식을 어떻게 참조해야하는지 알 수 있었다.
- 주로 childNodes를 이용할 것 같다.

## 1.2 addEventListener

- 하나의 요소는 여러개의 event를 가질 수 있다.
- 이벤트가 더 이상 필요하지 않다면 removeEventListner() 제거 가능 (단 addEvent 추가)

```jsx
document.getElementById("mybtn").addEventListener("click",displayText);

        function  displayText(){
                document.getElementById("demo").innerHTML = "hello world";
        }
```

```jsx
<body>
    <button id="mybtn">클릭</button>
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

### 문제)

- a click 이벤트 처리하시고
- [0][1][2][3]
- 다음 링크를 클릭하면 다음 image 를 보여주세요
- 이전 링크를 클릭하면 이전 image 를 보여주세요

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
    <h3>DOM 슬라이드</h3>
    <img src="images/1.jpg" alt="이미지" id="imgs" width="200" height="200">
    <hr>
    <a href="#" id="prv">이전</a> || <a href="#" id="next">다음</a>
</body>
</html>
```

## 1.3 캡쳐링 / 버블링

### 캡쳐링)

![https://camo.githubusercontent.com/4feef0e96827fee701a6091e66d9271aa6b5e11c30f9907ee2b7e9e2221a7496/68747470733a2f2f6a6f73687561313938382e6769746875622e696f2f696d616765732f706f7374732f7765622f6a6176617363726970742f6576656e742f6576656e742d636170747572652e706e67](https://camo.githubusercontent.com/4feef0e96827fee701a6091e66d9271aa6b5e11c30f9907ee2b7e9e2221a7496/68747470733a2f2f6a6f73687561313938382e6769746875622e696f2f696d616765732f706f7374732f7765622f6a6176617363726970742f6576656e742f6576656e742d636170747572652e706e67)

### 버블링)

![https://camo.githubusercontent.com/3327ddb5368c44f4a0c18948b597c8ab9606bc25c5d748a690ecd6a5eb90fb7f/68747470733a2f2f6a6f73687561313938382e6769746875622e696f2f696d616765732f706f7374732f7765622f6a6176617363726970742f6576656e742f6576656e742d627562626c652e706e67](https://camo.githubusercontent.com/3327ddb5368c44f4a0c18948b597c8ab9606bc25c5d748a690ecd6a5eb90fb7f/68747470733a2f2f6a6f73687561313938382e6769746875622e696f2f696d616765732f706f7374732f7765622f6a6176617363726970742f6576656e742f6576656e742d627562626c652e706e67)

## 1.4 Object

클래스 정의 3가지 방법

- **프로토타입 방식** : 일반적인 클래스 제작 방법
- ****함수 방식 :**** 간단한 클래스 제작 시 사용
- ****리터럴 방식 :**** 자주 이용 방식

### 프로토타입 방식

• 인스턴스마다 공통된 메서드를 공유해서 사용하는 장점

```jsx
function 클래스이름() {
    this.프로퍼티1 = 초기값;
    this.프로퍼티2 = 초기값;
}

클래스이름.prototype.메서드1 = function() {

}

클래스이름.prototype.메서드2 = function() {

}

var 인스턴스 = new 클래스이름(); 
var carObj = new Car();
var carObj2 = new Car();
var carObj3 = new Car();
```

### 함수 방식

- 인스턴스마다 메서드가 독립적으로 만들어지는 단점
- 클래스 : function Car(){ this.name = , this.age=}
- 함수 : function car(){}

```jsx
function 클래스이름() {
    this.프로퍼티1 = 초기값;
    this.프로퍼티2 = 초기값;
        this.메서드1 = function() {
        }

    this.메서드2 = function() {

    }

}

var 인스턴스 = new 클래스이름(); 
var carObj = new Car();
var carObj2 = new Car();
var carObj3 = new Car();
```

### ****리터럴 방식****

- 클래스 만드는 용도는 아니며 주로 여러개의 매개변수를 그룹으로 묶어 함수의 매개변수로 보낼때 정의와 함께 인스턴스가 만들어지는 장점이 있음
- 단 인스턴스는 오직 하나

```jsx
let product = { 제품명:'사과', 년도:'2000' , 원산지:'대구' };
```

## ****🔔 <javascript 객체 생성>****

- 오브젝트 리터럴 방식 (객체를 만드는 방법): 클래스 생성과 동시에 객체가 만들어진다
- > 리터럴 방식 >> 제일 간단한 방법 > var obj = {}; //var objarr = [] 배열
- > JSON 표기 : {} >> JSON: JavaScript Object Notation

```jsx
ex) var myObj = { "name":"John", "age":31, "city":"New York" };
```

```jsx

```