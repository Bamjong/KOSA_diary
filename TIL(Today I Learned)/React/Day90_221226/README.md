# ๐ **Day90_221226**

# 1. React

๊ฐ๋ฐํ๊ฒฝ ๊ตฌ์ฑ

- ์น๋ธ๋ผ์ฐ์ : Chrome
- ์์ํด: Visual Studio Code
- Node.js LTS Version
- React

## ์ค์นํ๊ธฐ

### Node.js

```java
1. https://nodejs.org/en/
2. ##.##.# LTS ๋ฒ์  ๋ค์ด (๋ฒ์ ์ ์ต์ ๋ฒ์ )
```

- LTS: ์์ฒด์ธก์์ ๊ณ์ ์ง์์ ํด์ฃผ๋ ๋ฒ์ 
- Node๋ฅผ ์ค์นํ๋ฉด ์๋์ผ๋ก NPM๊น์ง ์ค์น์๋ฃ

### Visual Studio Code

```java
1. https://code.visualstudio.com/
2. OS์ ๋ง๋ ๋ฒ์  ๋ค์ด
```

### React ํ๋ก์ ํธ ๋ง๋ค๊ธฐ

```bash
npx create-react-app [์์ฉํ๋ก๊ทธ๋จ์ด๋ฆ(ํด๋๋ช์ง์ )]
npx create-react-app .
npx create-react-app daily-blog
```

### ํ๊ฒฝ๋ณ์ ์ค์ ํ๊ธฐ

์์คํ ๋ณ์์ ํ๊ฒฝ๋ณ์ ์ค์ ํ๊ธฐ

![https://user-images.githubusercontent.com/92353613/209490823-7d8626f4-cb20-4c85-8076-3e527091dc17.png](https://user-images.githubusercontent.com/92353613/209490823-7d8626f4-cb20-4c85-8076-3e527091dc17.png)

```bash
C:\Program Files\nodejs
```

## ํด๋ ์ค๋ช

![https://user-images.githubusercontent.com/92353613/209490476-49dfcb04-f536-4453-9a6d-4a2dd8d7e1f0.png](https://user-images.githubusercontent.com/92353613/209490476-49dfcb04-f536-4453-9a6d-4a2dd8d7e1f0.png)

- package.json / package-lock.json
    - Spring Maven pom.xml ์ด๋ ๋น์ทํ๊ฒ์ด๋ค. ์ด๊ณณ์์ ํ์ํ๊ฑธ ์ ์ผ๋ฉด node_modules์ ํ์ํ ํ์ผ๋ค์ด ์ ์ฅ๋๋ค.
    
    ### ์คํํ๊ธฐ
    
    ```bash
    npm start
    ```
    

# 2. **SPA๋?**

SPA๋ Single Page Application์ ์ฝ์์ด๋ค.

---

๋จ์ผ ํ์ด์ง ์ดํ๋ฆฌ์ผ์ด์(SPA)๋ ํ์ฌ ์น๊ฐ๋ฐ์ ํธ๋๋์ด๋ค.

๊ธฐ์กด ์น ์๋น์ค๋ ์์ฒญ์๋ง๋ค ์๋ฒ๋ก๋ถํฐ ๋ฆฌ์์ค๋ค๊ณผ ๋ฐ์ดํฐ๋ฅผ ํด์ํ๊ณ  ํ๋ฉด์ ๋ ๋๋งํ๋ ๋ฐฉ์์ด๋ค. SPAํํ๋ ๋ธ๋ผ์ฐ์ ์ ์ต์ด์ ํ๋ฒ ํ์ด์ง ์ ์ฒด๋ฅผ ๋ก๋ํ๊ณ , ์ดํ๋ถํฐ๋ ํน์  ๋ถ๋ถ๋ง Ajax๋ฅผ ํตํด ๋ฐ์ดํฐ๋ฅผ ๋ฐ์ธ๋ฉํ๋ ๋ฐฉ์์ด๋ค.

# 3. Hook?

Hook์ React ๋ฒ์  16.8๋ถํฐ React ์์๋ก ์๋ก ์ถ๊ฐ๋์์ต๋๋ค.

---

**React ์์ ๊ธฐ์กด์ ์ฌ์ฉํ๋ Class๋ฅผ ์ด์ฉํ ์ฝ๋๋ฅผ ์์ฑํ  ํ์ ์์ด,**

**state์, ์ฌ๋ฌ React ๊ธฐ๋ฅ์ ์ฌ์ฉํ  ์ ์๋๋ก ๋ง๋  ๋ผ์ด๋ธ๋ฌ๋ฆฌ**

### useState์ฌ์ฉ๋ฒ

```jsx
import React, { useState } from 'react';
```

- ์๋จ์ import๋ฅผ ํด์ค๋ค

```jsx
function Example() {
  // "count"๋ผ๋ ์๋ก์ด ์ํ ๊ฐ์ ์ ์ํฉ๋๋ค.
  const [count, setCount] = useState(0);
```

- ์ดํ ์์๊ฐ์ด useState๋ฅผ ์ ์ด์ค๋ค

```jsx
return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
```

- ์ด๋ฐ์์ผ๋ก ํด๋ฆญํ์์๋ setCount(count + 1) ํด์ฃผ๋ ๋ฐฉ์์ผ๋ก Hook์ ์ค์ ํ๋ค

# 4. React ์ฝ๋ ์์ฑ๋ฒ

```jsx
<React.Fragment> </React.Fragment>

<div> </div>
```

- return ์์ ๋ค์ด๊ฐ ์ ์๋ ํ๊ทธ๋ ํ๋
- // React.Fragment ํน์ ๋น Fragํ๊ทธ <></>, <div> ํ๊ทธ ์์๋ ๋ง์๊ป ๊ฐ๋ฅ

์ํ๋ณํ๋ฅผ ์ํ๋ค๋ฉด

```jsx
Class = .state   //class๋ .state๋ก ๋ถ๋ฌ์จ๋ค

import {useState} from "react"; //function์ผ๋ก ํ  ๊ฒฝ์ฐ import ํ๊ณ  usestate ์ฌ์ฉ
Hook = useState(0);
```

class์ ๋ณ์ ์ ์ธ ์์ฑ๋ฒ

```jsx
// ์ํ๋ณ์ ์ ์ธ
    state = { //state๋ฅผ ์ ์์ผ๋ก์ ๊ทธ๋ฅ ์ผ๋ฐ ๋ณ์ ์ ์ธ์ด๋ค
        number : 0,
        message : 'th1-703',
        validate : false,
        messages : ['AngularJS', 'React', 'Vue', 'Ember'] 
    }

    render(){

        const {name, str} = this.props;
        const {message,number,validate,messages} = this.state;
        let irum = 'yuna'
        let x,y,z =3;
```

- ๋งจ ์ ์ฝ๋๋ this๋ฅผ ์ ์์ผ๋ก์ MyComponents ์์ฑ์์๊ฒ ์ ์ธํ๋ค๋ ๋ป์ด๋ค
- ์ state์์ ์ ์ธํ๊ฒ๋ค์ render์์ ์ ์ธ ํด์ฃผ์ด์ผ ์ฌ์ฉ์ด ๊ฐ๋ฅํ๋ค

### TIP!)

react์์๋ class๋ผ๊ณ  ์์ฐ๊ณ  className์ด๋ผ ์ด๋ค

```jsx
<button type="button" className="btn btn-primary">Primary</button>
```

### React์ foreach

```jsx
function logArrayElements(1) { } // ๋ฐฐ์ด์์ ์๋ ๊ฐ๊ฐ์ ๋ฐ์ดํฐ ์ฒ๋ฆฌ
function logArrayElements(1,2) { }  // 1- ๋ฐ์ดํฐ, 2- ์ธ๋ฑ์ค๋ฒํธ
function logArrayElements(1,2,3) { }  // 3- ๋ฐฐ์ด์ ์ ์ฒด ๋ฐ์ดํฐ 
 
function logArrayElements(element,index, array) {
    console.log('a[' + index + '] =    ' + element);
}
//[2,5,9].forEach(logArrayElements);
```

- ์ด๋ ๊ฒ ๋ณด๋ฉด ์ดํด๊ฐ ์๋๊ฒ ์ง๋ง ์๋ 6. ์ข์์ ๊ตฌ์ฑํ๊ธฐ์์ ์์๊ฐ ์์ผ๋ฏ๋ก ๊ทธ๊ฑธ ๋ณด๋ฉด ์ดํดํ๊ธฐ ํธํ๋ค.

# ****5. props ๋ฅผ ํตํด ์ปดํฌ๋ํธ์๊ฒ ๊ฐ ์ ๋ฌํ๊ธฐ****

๋จผ์  App.js์ธ ๋ถ๋ชจ๊ฐ์ฒด์์ ๋ณ์ ์ค์ ์ ํฉ๋๋ค

```jsx
function App() {
  const str = "React!!!";
  const name = "ํจ์ํ ์ปดํฌ๋ํธ"; 

  return (
    <div className="App">
      <h1> Hello world</h1>
      ๊ณ ๋ฒ์ข
      <MyComponents name={name} str={str}/>
      <Hello name={name} />
      <Hello str={str} />

    </div>
  );
}
```

- ์ดํ ์ปดํฌ๋ํธ์๊ฒ ๋ณด๋ผ ๊ฐ์ 
<MyComponents name={name} str={str}/>
<Hello name={name} />
์์๊ฐ์ด ๋ณด๋ธ๋ค

Class๋ฐฉ์

```jsx
render(){
        const {name, str} = this.props;

        return(
            <>
                <h1>{name}</h1>
                <h1>{str}</h1>
            </>
        )
    }
```

- class๋ฐฉ์์์  ์์๊ฐ์ด render์์ return ์ ์ ๊ฐ์ ๋ฐ์์จ ํ ๋ณ์์ ๋ฃ์ด์ฃผ๊ณ  ์ฌ์ฉํ๋ค

Hook๋ฐฉ์

```jsx
function Hello(props){
    return(
        <div>
            <p>------------------------asdas-------------</p>
            <h1>{props.str}</h1>
            <h1> hello component</h1>
            <span>๋ฆฌ์กํธ ์ฌ๋ฏธ์์ด์!!</span>
            <div>{props.name}</div>

        </div>
    )
}
```

- ํ๋ผ๋ฏธํฐ๊ฐ์ props๋ฅผ ์ค์ ํด ์ค ํ props.(์ค์ ํprops์ด๋ฆ) ์ ์ ์ด์ฃผ๋ฉด ๋๋ค

# 6. React ์ข์์ ๊ตฌ์ฑํ๊ธฐ(๊ณผ์ )

[[React] ์ข์์ ๋ฒํผ ๊ธฐ๋ฅ ์์ฑํ๊ธฐ (onCilck ๋ฒํผ ๋๋ฅด๋ฉด +1 ์ฆ๊ฐ,๊ฐ๋ณ์ฆ๊ฐ)](https://velog.io/@estell/React-%EC%A2%8B%EC%95%84%EC%9A%94-%EB%B2%84%ED%8A%BC-%EA%B8%B0%EB%8A%A5-%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0-omCilck-%EB%B2%84%ED%8A%BC-%EB%88%84%EB%A5%B4%EB%A9%B4-1-%EC%A6%9D%EA%B0%80)

```jsx
import './App.css';
import {useState} from "react";

// function alert(){
//   swal("Good job!", "You clicked the button!", "success");
// }

function App() {
let nickName="๋๋"
let [title, setTitle] = useState(["ํํ ์์ปค์ค", "๊ฐ๋จ ์์ปค์ค", "ํ๋ ์์ปค์ค", "์ข๋ก ์์ปค์ค"]);
let [like, setLike] = useState([0,0,0,0]);
let [count, setCount] = useState(0);

  return (
    <div className="App">
      <div onClick={()=>{setCount(count + 1); console.log(count);}}>์๋</div>
      <header className = "">
      <div className="nav"> ๋ฒ์ฏ ์์ปค์ค๋จ</div>
      <p>{nickName} ๋ ๋ฒ์ฏ ์์ปค์ค์ ์ค์  ๊ฒ์ ํ์ํฉ๋๋ค</p>
      <a href="https://www.naver.com/" rel="nooper noreferrer" target="blank">๋ค์ด๋ฒ</a>
      </header>
      <br></br>
      
      {title.map((el, i) => {
        return (
          <div className="list" key={i}>
            <h3>
              {el}
              <span
                onClick={() => {
                  let likeCnt = [...like];
                  likeCnt[i]++;
                  setLike(likeCnt);
                }}
              >
                ๐
              </span>
              {like[i]}
            </h3>
            <p>3์ 02์ผ ๋ฐํ</p>
            <hr />
          </div>
        );
      })}
    </div>
  );
}

export default App;
```

- ์ด ์์ ๋ฅผ ๋ณด๋ค๋ณด๋ ๋ค ์ดํดํ์ง๋ง ์ค๊ฐ์ [โฆlike]๋ฅผ ์ดํด ๋ชปํ์๋ค.
์  [โฆlike]๋ฅผ ํ๊ธฐ์ ์ ๊ฐ๋จํ ํ๋๋ฅผ ์์๋ณด์๋ฉด
    
    ## ****์คํ๋ ๋ ์ฐ์ฐ์(spread operator)****
    
    ```jsx
    const fruitOne = ['apple', 'banana'];
    const fruitTwo = ['grape', 'peach'];
    
    // ๊ธฐ์กด ๋ฐฉ๋ฒ
    var fruitAll = fruitOne.concat(fruitTwo);
    
    console.log(fruitAll); // ['apple', 'banana', 'grape', 'peach']
    
    // ES6 spread ์ฐ์ฐ์ฌ ํ์ฉ ๋ฐฉ๋ฒ
    const fruitAll = [...fruitOne, ...fruitTwo];
    
    console.log(fruitAll); // ['apple', 'banana', 'grape', 'peach']
    ```
    
    - ์ ์์๋ฅผ ๋ณด๋ฉด ์ ์ดํดํ  ์ ์์๊ฒ์ด๋ค.
    
    > โฆfruitOne์ ํ๊ฒ ๋  ๊ฒฝ์ฐ ์ ์์ ๋๊ดํธ๊ฐ ๋ฒ๊ฒจ์ง๋ค๊ณ  ์๊ฐํ๋ฉด ํธํ๋ค
    >