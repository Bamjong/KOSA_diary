# ๐ Day35_221012

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 10์ 12์ผ ์ค์  9:25
Status: ๐จ Published
Tags: JavaScript
Updated Time: 2022๋ 10์ 12์ผ ์คํ 10:00

# 1. Javascript

## javascript ์ฌ์ฉ

1. html ์ content , attribute ๋ณ๊ฒฝ , ์ญ์  , ์ถ๊ฐ [๋์ ]์ผ๋ก
2. css ์์ฑ ๋ณ๊ฒฝ , ์ญ์  , ์ถ๊ฐ [๋์ ]์ผ๋ก
3. ์ ํจ์ฑ ๊ฒ์ฆ (id ์๋ ฅ, ์ฃผ๋ฏผ๋ฒํธ ๋ง๋์ง , ๋ฐ์ดํฐ ์ซ์ ...๊ฒ์ฆ)
4. ๋์ ์ธ ์น ํ๋ฉด ๊ตฌ์ฑ (ํ๋ฉด๊ตฌ์ฑ)
5. ์  ์ธ๊ณ์ ์ผ๋ก 1์ ์ธ์ด
    - ๋ชจ๋  ๊ฐ๋ฐ ํ์ฌ , ๊ฐ๋ฐ์ ๊ด์ฌ ....

- javascript > ํจ์จ์ ์ผ๋ก > ์ฝ๋๋ ์ค์ด๊ณ  > ๋ง์ด ์ฐ๋ ์ฌ์ฌ์ฉ > lib or FrameWork
- 50์ค์ ์ฝ๋ ๊ตฌํ .. ๋ด๊ฐ ๋ง๋  ๊ฒ์ ๋น์ ์ด ... 5์ค๋ก ํ  ์ ์์ด
- jquery.js (๋ด๋ถ์ ์ธ ์ฝ๋ : javascript) >> ์์ ์๋ ์์์ ํ์ฉ > ์์ฐ์ฑ ๊ทน๋ํ
- angular.js(MVC) , vue.js , react.js ...... 100์ฌ๊ฐ์ง๊ฐ ๋๋ ....
- ์ฐ๋ฆฌ๋๋ผ ๊ฐ๋ฐ ํ์ฌ (javascript : FrameWork)
- ์ ๊ท : vue.js , react.js (Front) ๋จ์ : ๋ฒ์ ๋ณ๊ฒฝ .... ์ฌ๋ผ์ง ์ ๋ ์๋ค
- Front ์ต์ : vue.js ๋๋ react.js

- javascript ์ธ์ด ์น ๋ธ๋ผ์ฐ์ ธ ์์ด ๋ก์ปฌ ์๋ฒ์์ ๋์ (๋ง์น java ์ฒ๋ผ)
- Node.jsยฎ๋ Chrome V8 JavaScript ์์ง์ผ๋ก ๋น๋๋ JavaScript ๋ฐํ์์๋๋ค.
- back ๋จ์ ์ฝ๋ javascript ๋์ฒด >> ์๋ธ (์ฑํ ์๋ฒ, ๋ณด์กฐ ์๋ฒ) >> npm ํ์ต

1. ๋ฌธ๋ฒ (java ํก์ฌ ...)
    
    6.1 ๋์๋ฌธ์๋ฅผ ์๊ฒฉํ๊ฒ ๊ตฌ๋ถ
    
    6.2 ์ข๊ฒฐ์ ;
    
    6.3 ํ์(var , const , let) : let i="A"; let s = "aaa"; const NUM=100;
    
    ์ ์ฐํ ์ธ์ด : var v; v=10 ์ด๋ ๋ด๋ถ์ ์ผ๋ก (๊ฐ์ ๋ฐ๋ ์์ ์) >> number
    
    ex) int i =10; double d = 3.14;
    
    ์ฐ์ฐ์ , ์ ์ด๋ฌธ(java ๋์ผ) , ๊ฐ์ฒด
    
    6.4 ์ฌ์ฉ๋ฒ (css ์ฌ์ฉ๋ฒ๊ณผ ๋์ผ)
    
    - in-line (ํ๊ทธ ์์ชฝ์ : <p onclick="<script>...")
    - internal(page ์์์ ์ผ๋ฐ์ ์ผ๋ก <head><script> ...์ฝ๋</head>)
    - external(์ธ๋ถ ํ์ผ :common.js >> link ๋ฐฉ์) ์ ํธ (์ ์ง๋ณด์ , ์ฌ์ฌ์ฉ)
    
    ## ํจ์ ์ฌ์ฉ ๋ฐฉ๋ฒ
    
    inline ๋ฐฉ์
    
    ```html
    <input type="button" value="inline" onclick="alert('hello')">
    ```
    
    internal ๋ฐฉ์
    
    ```html
    function call() {
    		alert('internal');
    	}
    
    <input type="button" value="internal" onclick="call()">
    ```
    
    external ๋ฐฉ์
    
    ```html
    <script type="text/javascript" src="script/common.js"></script>
    //script ํด๋ ์์ common.js ํ์ผ ๋ง๋ค์ด์ฃผ๊ธฐ
    <input type="button" value="external" onclick="excall()">
    ```
    
    ## ๋ณ์ ํ์
    
    ## var, let , const
    
    ```jsx
    var num; //ํ์์ด ์ ํด์ง์ง ์์์ (์ ์, ๋ฌธ์, ๋ ์ง ์ฌ ์ ์์ด์)
            console.log(num); //undefined ์ ์ ์ถ๋ ฅ ... ์ ์ ์์ง ์๋จ...
            num = 10; //๊ฐ์ ๊ฐ์ง๋ ์๊ฐ ๋ด๋ถ์ ์ผ๋ก ํ์ ๊ฒฐ์ 
            console.log("num:" + num);
    
            let num2=100;
            console.log(num2);
            console.log(typeof(num)); //number
    ```
    
    - ์์ฆ์ ์ผ๋ฐ์ ์ผ๋ก var์ ์์ฐ์ด๋ฏ๋ก let๊ณผ const๋ฅผ ์ฐ๋ฉด๋๋ค.
    
    ```html
    1. ๋ณ์์์ฑ > ๊ฐ์๋ ฅ > ํ์์ค์  (number, string)
        var a; ์ ์๋์ง ์์๋ค
        var b; ์ ์๋์ง ์์๋ค
        a=10; ํ์์ค์  number
        b="A"; ํ์์ค์  string
        ES5 ์ด์  ๋ฌธ๋ฒ (var) >> 2015 ES6(ECMA) >> let, const
    
    				var, let, const
            ๊ถ์ฅ: let, const
    ```
    
    ## DOM script
    
    ```html
    ๋ฌธ์๊ฐ ์คํ๋๋ฉด.... ์น ๋ธ๋ผ์ฐ์  ๋ฉ๋ชจ๋ฆฌ์ body ์์ ์์๊ฐ ๋ก๋ฉ ..
            ๋ฉ๋ชจ๋ฆฌ์ DOM tree ํํ๋ก ... ํ์์ ๋ฐ๋ผ์ ์ ๊ทผ .. ๋๋ฉด ๋ผ์
            DOM
            html
             |
            head - body
    
            DOM script (๊ฐ๋ฐ์ ...): getElementById
    ```
    
    ์์ )
    
    ```jsx
    <script>
            /*
            ๋ฌธ์๊ฐ ์คํ๋๋ฉด.... ์น ๋ธ๋ผ์ฐ์  ๋ฉ๋ชจ๋ฆฌ์ body ์์ ์์๊ฐ ๋ก๋ฉ ..
            ๋ฉ๋ชจ๋ฆฌ์ DOM tree ํํ๋ก ... ํ์์ ๋ฐ๋ผ์ ์ ๊ทผ .. ๋๋ฉด ๋ผ์
            DOM
            html
             |
            head - body
    
            DOM script (๊ฐ๋ฐ์ ...): getElementById
            */
           function print(){
                let ele = document.getElementById("demo");
                console.log(ele);
                ele.innerHTML="์ ๋ฐฐ๊ณ ํ๋ค";
           }
    
        </script>
    
    </head>
    <body>
            <button onclick="print()">ํด๋ฆญํ์ธ์</button>
            <p id="demo">demo๋ผ๋ id๋ pํ๊ทธ์ ์ฃผ์(์๋ณ์)</p>
    </body>
    ```
    
    ## ์ด๊ธฐํ
    
    ์ฒ์ ๊ฐ์ ๊ฐ์ง๋ ๊ฒ.
    
    - javascript (์ ์, ์ค์, boolean, ๋ฌธ์)
    - JAVA: int i=100; float f=3.14f;
    - ๋ด๋ถ์ ์ผ๋ก ๊ฐ์ง๊ณ  ์๋ ํ์: number, boolean, Array, Object ...ํ์
    
    ## ๋ณ์ (scope)
    
    - ํ์ฌ page >> Ex04_Script_html >> ์ ํจ
    1. let name="kglim"; ํ์ด์ง ์ ์ฒด (global: ์ ์ญ๋ณ์)
    2. ํจ์์์ ์๋ let age=20; ํจ์์์ ์ ํจ * (local: ์ง์ญ๋ณ์)
    
    ```jsx
    let n; //์ด๊ธฐํ๊ฐ ๋์ด ์์ง ์์์ (ํ์์ด ์์ด์)
            console.log(n);
            n=100;
            //**** javascript ์ ์ญ, ์ง์ญ ๋ณ์๋ ์ด๊ธฐํํ๊ณ  ์ฌ์ฉํ์ ****
    ```
    
    ์์ )
    
    ```jsx
    let intnum = 100; //์ ์
    let dnum= 12.345; //์ค์
    let flag = true; //boolean
    let str = null; //๊ฐ์ด ์๋ค
    let str2 = "ABC"; //๋ฌธ์์ด
    
    console.log(typeof(intnum)); //number
    console.log(typeof(dnum)); //number
    console.log(typeof(flag)); //boolean
    console.log(typeof(str)); //object
    console.log(typeof(str2)); //string
    ```
    
    ์ถ๋ ฅ)
    
    ![https://user-images.githubusercontent.com/92353613/195254301-b4e50b78-3642-4450-82f7-f88f518cedc0.png](https://user-images.githubusercontent.com/92353613/195254301-b4e50b78-3642-4450-82f7-f88f518cedc0.png)
    
    ## ์ฐ์ฐ์
    
    - ์ฐ์ ( +, -, /, %)
    
    ์์)
    
    ```jsx
    let num1 = 10;
            let num2 = 3;
            document.write(num1/num2 + "<br>"); //์ค์
            document.write(num1%num2 + "<br>"); //๋๋จธ์ง
    ```
    
    ์ถ๋ ฅ)
    
    ```jsx
    3.3333333333333335
    1
    ```
    
    ## ๊ด๊ณ
    
    - ( === (๊ฐ๊ณผ ํ์๋ ๋น๊ต) ), !=, >= โฆ
    
    ์์)
    
    ```jsx
    let a = 3;
            let b = 5;
            console.log((a==b)+"<br>");
            console.log((a!=b)+"<br>");
            console.log((a>b)+"<br>");
    ```
    
    ์ถ๋ ฅ)
    
    ```jsx
    false
    true
    false
    ```
    
    ## ๋ผ๋ฆฌ
    
    - (&&, ||)
    
    ์์)
    
    ```jsx
    console.log((10>5) && (1 !=3)); //true
    console.log((10<5) || (1 !=3)); //true
    ```
    
    ์ถ๋ ฅ)
    
    ```jsx
    true
    true
    ```
    
    ## ์ผํญ ์ฐ์ฐ์
    
    ์์)
    
    ```jsx
    let result2 = (4%2 == 0) ? "์ง์":"ํ์";
            console.log(result2);
            document.write(result2);
    ```
    
    ์ถ๋ ฅ)
    
    ```jsx
    ์ง์
    ```
    
    ## ๋์ ์ฐ์ฐ์
    
    - (+=, -=, *=, /=)
    
    ์์)
    
    ```jsx
    let p = 10;
    let k = 5;
    p+=k; // p = p + k;
    console.log(p);
    
    let x =5+5;
    let y = "5" + 5 + 5 + "2"; // (์ฐ์ , ๊ฒฐํฉ) >> ๊ฒฐํฉ ^^
    console.log(x);
    console.log(y);
    
    let v = "5";
    let v2 = 5;
    let v3 = 5;
    console.log(v == v2); // ==๊ฐ์ ๋น๊ตํ๋ ์ฐ์ฐ์
    console.log(v === v2); //POINT: ๊ฐ๋ง ๊ฐ์ ๊ฒ์ด ์๋๋ผ ํ์๋ ๋์ผ
    ```
    
    ## ๋ฌธ์ )
    
    - for 1~100๊น์ง
    - int sum = 0;
    for (int i = 0; i <= 100; i++) {sum += i;}
    
    ์์)
    
    ```
    let sum = 0;
            for (let i = 0; i <= 100; i++) {
                sum += i;
            }
            document.write(sum + "<br>");
    ```
    
    ์ถ๋ ฅ)
    
    ```idris
    5050
    ```
    
    ์์)
    
    - ๊ตฌ๊ตฌ๋จ ์ถ๋ ฅ
    
    ```idris
    for (let i = 1; i < 10; i++) {
                for (let j = 1; j < 10; j++) {
                    document.write(i + "x" + j  + "=" + i*j + "&nbsp;&nbsp;&nbsp;");
                }  
                document.write("<br>");
            }
    ```
    
    ์ถ๋ ฅ)
    
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