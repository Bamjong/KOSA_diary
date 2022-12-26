# 📚 **Day90_221226**

# 1. React

개발환경 구성

- 웹브라우저: Chrome
- 작업툴: Visual Studio Code
- Node.js LTS Version
- React

## 설치하기

### Node.js

```java
1. https://nodejs.org/en/
2. ##.##.# LTS 버전 다운 (버전은 최신버전)
```

- LTS: 업체측에서 계속 지원을 해주는 버전
- Node를 설치하면 자동으로 NPM까지 설치완료

### Visual Studio Code

```java
1. https://code.visualstudio.com/
2. OS에 맞는 버전 다운
```

### React 프로젝트 만들기

```bash
npx create-react-app [응용프로그램이름(폴더명지정)]
npx create-react-app .
npx create-react-app daily-blog
```

### 환경변수 설정하기

시스템 변수에 환경변수 설정하기

![https://user-images.githubusercontent.com/92353613/209490823-7d8626f4-cb20-4c85-8076-3e527091dc17.png](https://user-images.githubusercontent.com/92353613/209490823-7d8626f4-cb20-4c85-8076-3e527091dc17.png)

```bash
C:\Program Files\nodejs
```

## 폴더 설명

![https://user-images.githubusercontent.com/92353613/209490476-49dfcb04-f536-4453-9a6d-4a2dd8d7e1f0.png](https://user-images.githubusercontent.com/92353613/209490476-49dfcb04-f536-4453-9a6d-4a2dd8d7e1f0.png)

- package.json / package-lock.json
    - Spring Maven pom.xml 이랑 비슷한것이다. 이곳에서 필요한걸 적으면 node_modules에 필요한 파일들이 저장된다.
    
    ### 실행하기
    
    ```bash
    npm start
    ```
    

# 2. **SPA란?**

SPA란 Single Page Application의 약자이다.

---

단일 페이지 어플리케이션(SPA)는 현재 웹개발의 트랜드이다.

기존 웹 서비스는 요청시마다 서버로부터 리소스들과 데이터를 해석하고 화면에 렌더링하는 방식이다. SPA형태는 브라우저에 최초에 한번 페이지 전체를 로드하고, 이후부터는 특정 부분만 Ajax를 통해 데이터를 바인딩하는 방식이다.

# 3. Hook?

Hook은 React 버전 16.8부터 React 요소로 새로 추가되었습니다.

---

**React 에서 기존에 사용하던 Class를 이용한 코드를 작성할 필요 없이,**

**state와, 여러 React 기능을 사용할 수 있도록 만든 라이브러리**

### useState사용법

```jsx
import React, { useState } from 'react';
```

- 상단에 import를 해준다

```jsx
function Example() {
  // "count"라는 새로운 상태 값을 정의합니다.
  const [count, setCount] = useState(0);
```

- 이후 위와같이 useState를 적어준다

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

- 이런식으로 클릭하였을때 setCount(count + 1) 해주는 방식으로 Hook을 설정한다

# 4. React 코드 작성법

```jsx
<React.Fragment> </React.Fragment>

<div> </div>
```

- return 안에 들어갈 수 있는 태그는 하나
- // React.Fragment 혹은 빈 Frag태그 <></>, <div> 태그 안에는 마음껏 가능

상태변화를 원한다면

```jsx
Class = .state   //class는 .state로 불러온다

import {useState} from "react"; //function으로 할 경우 import 하고 usestate 사용
Hook = useState(0);
```

class식 변수 선언 작성법

```jsx
// 상태변수 선언
    state = { //state를 적음으로서 그냥 일반 변수 선언이다
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

- 맨 위 코드는 this를 적음으로서 MyComponents 생성자에게 선언한다란 뜻이다
- 위 state에서 선언한것들을 render에서 선언 해주어야 사용이 가능하다

### TIP!)

react에서는 class라고 안쓰고 className이라 쓴다

```jsx
<button type="button" className="btn btn-primary">Primary</button>
```

### React식 foreach

```jsx
function logArrayElements(1) { } // 배열안에 있는 각각의 데이터 처리
function logArrayElements(1,2) { }  // 1- 데이터, 2- 인덱스번호
function logArrayElements(1,2,3) { }  // 3- 배열의 전체 데이터 
 
function logArrayElements(element,index, array) {
    console.log('a[' + index + '] =    ' + element);
}
//[2,5,9].forEach(logArrayElements);
```

- 이렇게 보면 이해가 안되겠지만 아래 6. 좋아요 구성하기에서 예시가 있으므로 그걸 보면 이해하기 편하다.

# ****5. props 를 통해 컴포넌트에게 값 전달하기****

먼저 App.js인 부모객체에서 변수 설정을 합니다

```jsx
function App() {
  const str = "React!!!";
  const name = "함수형 컴포넌트"; 

  return (
    <div className="App">
      <h1> Hello world</h1>
      고범종
      <MyComponents name={name} str={str}/>
      <Hello name={name} />
      <Hello str={str} />

    </div>
  );
}
```

- 이후 컴포넌트에게 보낼 값을 
<MyComponents name={name} str={str}/>
<Hello name={name} />
위와같이 보낸다

Class방식

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

- class방식에선 위와같이 render에서 return 전에 값을 받아온 후 변수에 넣어주고 사용한다

Hook방식

```jsx
function Hello(props){
    return(
        <div>
            <p>------------------------asdas-------------</p>
            <h1>{props.str}</h1>
            <h1> hello component</h1>
            <span>리액트 재미있어요!!</span>
            <div>{props.name}</div>

        </div>
    )
}
```

- 파라미터값에 props를 설정해 준 후 props.(설정한props이름) 을 적어주면 된다

# 6. React 좋아요 구성하기(과제)

[[React] 좋아요 버튼 기능 생성하기 (onCilck 버튼 누르면 +1 증가,개별증가)](https://velog.io/@estell/React-%EC%A2%8B%EC%95%84%EC%9A%94-%EB%B2%84%ED%8A%BC-%EA%B8%B0%EB%8A%A5-%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0-omCilck-%EB%B2%84%ED%8A%BC-%EB%88%84%EB%A5%B4%EB%A9%B4-1-%EC%A6%9D%EA%B0%80)

```jsx
import './App.css';
import {useState} from "react";

// function alert(){
//   swal("Good job!", "You clicked the button!", "success");
// }

function App() {
let nickName="뚜뚜"
let [title, setTitle] = useState(["혜화 서커스", "강남 서커스", "홍대 서커스", "종로 서커스"]);
let [like, setLike] = useState([0,0,0,0]);
let [count, setCount] = useState(0);

  return (
    <div className="App">
      <div onClick={()=>{setCount(count + 1); console.log(count);}}>안녕</div>
      <header className = "">
      <div className="nav"> 버섯 서커스단</div>
      <p>{nickName} 님 버섯 서커스에 오신 것을 환영합니다</p>
      <a href="https://www.naver.com/" rel="nooper noreferrer" target="blank">네이버</a>
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
                👍
              </span>
              {like[i]}
            </h3>
            <p>3월 02일 발행</p>
            <hr />
          </div>
        );
      })}
    </div>
  );
}

export default App;
```

- 이 예제를 보다보니 다 이해했지만 중간에 […like]를 이해 못했었다.
저 […like]를 하기전에 간단히 하나를 알아보자면
    
    ## ****스프레드 연산자(spread operator)****
    
    ```jsx
    const fruitOne = ['apple', 'banana'];
    const fruitTwo = ['grape', 'peach'];
    
    // 기존 방법
    var fruitAll = fruitOne.concat(fruitTwo);
    
    console.log(fruitAll); // ['apple', 'banana', 'grape', 'peach']
    
    // ES6 spread 연산사 활용 방법
    const fruitAll = [...fruitOne, ...fruitTwo];
    
    console.log(fruitAll); // ['apple', 'banana', 'grape', 'peach']
    ```
    
    - 위 예시를 보면 잘 이해할 수 있을것이다.
    
    > …fruitOne을 하게 될 경우 양 옆에 대괄호가 벗겨진다고 생각하면 편하다
    >