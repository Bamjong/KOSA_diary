# π Day39_221018

Author: κ³ λ²μ’
Created Time: 2022λ 10μ 18μΌ μ€μ  9:11
Status: π¨ Published
Tags: JavaScript, λ°μ΄ν° λͺ¨λΈλ§
Updated Time: 2022λ 10μ 21μΌ μ€μ  11:19

# 1. λ°μ΄ν° λͺ¨λΈλ§

## μ κ·ν

μ κ·ν μ’λ₯)

| μ κ·ν μ’λ₯ | λ΄μ© | ν¨μμ’μμ± |
| --- | --- | --- |
| 1μ°¨ μ κ·ν |  μμ±μ μμκ°μ κ°μ§
λ³΅μμ μμ± κ°μ κ°λ μμ±μ λΆλ¦¬ |  |
| 2μ°¨ μ κ·ν |  μ£Ό μλ³μμ μ’μμ μ΄μ§ μμ μμ±μ λΆλ¦¬ λΆλΆ μ’μ μμ±μ λΆλ¦¬ | λΆλΆν¨μμ’μμ± |
| 3μ°¨ μ κ·ν | μμ±μ μ’μμ μΈ μμ±μ λΆλ¦¬
μ΄μ  μ’μ μμ±μ λΆλ¦¬ | μ΄νν¨μμ’μμ± |
| λ³΄μ΄μ€-μ½λ μ κ·ν | λ€μμ μ£Ό μλ³μ λΆλ¦¬ |  |
| 4μ°¨ μ κ·ν |  μμ±κ°μ λ€μ€μ’μμ± μ κ±° | λ€μ€μ’μμ± |

### 1μ°¨ μ κ·ν

- λ°λ³΅λλ μμ±μ΄λ κ·Έλ£Ήμ μμ±μ μ κ±°νκ³ , μλ‘μ΄ μν°ν°λ₯Ό μΆκ°ν νμ κΈ°μ‘΄μ μν°ν°μ μΌλλ€μ κ΄κ³λ₯Ό νμ±

### 2μ°¨ μ κ·ν

- λ³΅ν©μλ³μ μΌλΆμ μμ‘΄μ μΈ μμ±μ΄ μ‘΄μ¬νλ€λ©΄ μ΄λ₯Ό μ κ±°**[λΆλΆμ’μμμ± μ κ±°]**

# 2. JSON

β’ μλ°μ€ν¬λ¦½νΈλ‘ κ°μ²΄λ₯Ό νκΈ°νλ λ°©λ²

```jsx
let product = {μ νλͺ: 'μ¬κ³Ό', λλ : '2000', μμ°μ§ : 'λκ΅¬'};
    console.log(product);
    console.log(product.μ νλͺ);
    console.log(product.μμ°μ§);
    console.log(product.toString());

    //κ°μ²΄ {} >> λ¦¬ν°λ΄ >>JSON
    let Person = {
        name:"νκΈΈλ",
        addr:"μμΈμ κ°λ¨κ΅¬ μ­μΌλ",
        eat: function(){
            document.write(this.name + "/" + this.addr + "/" + food + "λ λ ")
        }
    };

    document.write("<hr>");
    Person.eat("μ¬κ³Ό"); //eatν¨μ νΈμΆ

    //1. μμ± μ κ±° κΈ°λ₯
    delete(product.λλ);
    console.log(product);

    for (let key in product) { //λ³μλͺ key
        console.log("key : " + key);
        console.log(product[key]);
    }

    for(let key in person){
        console.log("key : " + key + "=" + Person[key]);
    }
```

```jsx
<script type="text/javascript">
    //1. λ°°μ΄ >> [] >> let arr=[]; >> push(), pop()
    //2. JSON >> {} >> let obj = {}; >>obj.μμ±λͺ, obj.ν¨μλͺ

    //μ°λ¦¬κ° μνλ λ°μ΄ν°λ λ¨μνμ§ μμμ
    //λ μ¨, μν μ λ³΄, μ§νμ²  μ λ³΄ λ°μ΄ν°, μνλ μ λ³΄λ₯Ό μΆμΆ(OPEN API) >> xml, json
    //μ΄λ° λ°μ΄ν° κ°νμ κ°μ²΄, κ°μ²΄μμ λ°°μ΄, λ°°μ΄μμ κ°μ²΄κ° νΌμ¬ ... μνλ κ°λ§ μΆμΆ

    let students = [];
    students.push({μ΄λ¦:"νκΈΈλ", κ΅­μ΄:80, μμ΄: 60}); //λ°°μ΄μ 0λ²μ§Έ λ°©μ κ°μ²΄ (JSON)
    students.push({μ΄λ¦:"μλ¬΄κ°", κ΅­μ΄:100, μμ΄: 50}); //λ°°μ΄μ 0λ²μ§Έ λ°©μ κ°μ²΄ (JSON)
    students.push({μ΄λ¦:"μ΄μμ ", κ΅­μ΄:10, μμ΄: 100}); //λ°°μ΄μ 0λ²μ§Έ λ°©μ κ°μ²΄ (JSON)

    //[{}{}{}]
    //κΈ°μ‘΄μ λ§λ€μ΄μ§ κ°μ²΄μ ν¨μ μΆκ°
    for(let index in students) {
        //students[index] >> {μ΄λ¦:"νκΈΈλ", κ΅­μ΄:80, μμ΄: 60}
        students[index].getSum = function() {return this.κ΅­μ΄ + this.μμ΄}
        students[index].getAvg = function() {return this.getSum()/2}
    }

    //{μ΄λ¦:"νκΈΈλ", κ΅­μ΄:80, μμ΄: 60, getSum:function ... , getAvg:function}
    console.log(students);

    for(let index in students) {
        console.log(students[index].μ΄λ¦);
        console.log(students[index].getSum());
        console.log(students[index].getAvg());
    }

</script>
```

### ****πΒ [κ°μ²΄ λ°μ΄ν°]λ₯Ό [λ¬Έμμ΄ λ°μ΄ν°]λ‘****

```jsx
//login.jsp?name = json&age = 30 & city = seoul
let stringobj = JSON.stringify(MyObj); //POINT
console.log(stringobj); //'name:"john", age:30, city:"seoul"'
console.log(typeof(stringobj));
```

### ****πΒ [λ¬Έμμ΄ λ°μ΄ν°λ₯Ό] [κ°μ²΄ λ°μ΄ν°λ‘]λ‘****

```jsx
let stringstr = 'name:"john", age:30, city:"seoul"';
console.log(stringstr);
console.log(typeof(stringstr));

let Myjson = JSON.parse(stringstr);
console.log(Myjson);
```

### ****πΒ POINT****

```jsx
console.log(Myjson.name); //μ κ·Ό: κ°μ²΄ μμ±λͺ
console.log(Myjson["name"]); //μ κ·Ό : κ°μ²΄["μμ±λͺ"] μκΈ°
```

### ****Q) JSONμΌλ‘ μ΄λ―Έμ§ μ¬λΌμ΄λ λ§λ€κΈ°****

[λ¬Έμ ]

```jsx
"m" κ°μ κ°μ§κ³  μμ https:\/\/live.staticflickr.com\/65535\/52421936483_165a532d02_m.jpg
λ°°μ΄μ λ£μΌμΈμ
let images = [];
μ¬λΌμ΄λ λ§λ€κΈ°
```

```jsx
<script>
window.onload=function(){
    let images= [];

    for(let index in data.items) {
        images.push(data.items[index].media.m);
    }

    
    let index = 1;

    document.getElementById("prv").addEventListener("click", function(){
        if(index == 1) {
            index = images.length;
        }

        document.getElementById("imgs").src = images[--index];
    });

    document.getElementById("next").addEventListener("click", function(){
        if(++index == images.length){ 
            index = 0;
        }

        document.getElementById("imgs").src = images[index];
    });
}
</script>
```