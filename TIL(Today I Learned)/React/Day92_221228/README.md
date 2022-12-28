# 📚 **Day92_221228**

# 1. 컴포넌트 만들기

```jsx
function Card() {
  return(
    <>
    </>
  )
}
export default Card;
```

- Card() 라는 함수를 만들고
- <></> 를 통해 복수태그 넣도록 설정해주고
- export default Card; 를 통해 Card함수를 뱉어내 다른곳에서 받을 수 있도록 설정

# 2. Props

[[React] 컴포넌트에 Props 전달하기](https://jinyisland.kr/post/react-props/)

부모가 자식 컴포넌트에게 값을 줄때 쓰는것.

### 단일 값 전달하기

컴포넌트 작성 시 해당 컴포넌트 태그에 `변수이름={}`으로 사용한다.

```jsx
//App.js (최상위 컴포너트)
const today = function () {
    return new Date().toISOString();
};

function App() {
    return (
        <div className="App">
            <AppHeader />
            <header className="App-header">
                <h2>{myName}</h2>
                <Time init={today} />
            </header>
            <AppFooter />
        </div>
    );
}
```

전달받는 컴포넌트 (자식 컴포넌트)에서는 매개변수로 받아올 수 있는데 `객체` 타입으로 전달 받는다.

```jsx
function Time(props) {
    return (
        <div>
            <h2>What Time?</h2>
            <p>{props.today}</p>
        </div>
    );
}
```

[구조 분해 할당](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)을 통해 더욱 쉽게 받을 수 있다.

객체나 배열 구문에서 속성을 바로 해체해서 변수처럼 사용할 수 있는 표현식이다.

```jsx
//Time.js (자식 컴포넌트)
import React from 'react';

function Time({ today }) {
    return (
        <div>
            <h2>What Time?</h2>
            <p>{today}</p>
        </div>
    );
}

export default Time;
```

# 3. Route

## 중첩라우터

![https://user-images.githubusercontent.com/92353613/209748811-7477a888-bc87-48e4-a694-e00303726819.png](https://user-images.githubusercontent.com/92353613/209748811-7477a888-bc87-48e4-a694-e00303726819.png)

- 위 사진에서 <Route>안에 또 <Route> 작성한걸 중첩라우터라고 부른다

```jsx
function About(){

  return(
      <>
      <h1>About Page</h1>
      <p>회사 정보</p>
      <Outlet></Outlet>  
      {/* 이 위치에 중첩 라우터 한 거 보여준다 */}
      </>
  )
} // end About.js
```

- 중첩라우터를 보여줄 곳에 <Outlet></Outlet>을 작성하면 지정한 곳에 보이게된다

# 4. 예외처리 페이지

```jsx
<Route path='*' element={<h3>404 없는페이지입니다</h3>}>
```

# 5. useNavigate()

### 사용법)

변수선언

```jsx
let navigete = useNavigate();
```

- navigate 자체가 함수로 선언됨

경로 설정

```jsx
<button onClick={()=>{
              navigete('/detail')
          }} className='btn btn-primary'>주문하기</button>
```

- navigete('/detail')를 사용하면 <Route path='/detail' element={<Detail shrits={shrits[0]}/>}/>
Route 지정한곳으로 이동하도록 됨.

# 6. useParams()

기존 url뒤에 파라미터 값을 가져오는 함수이다. (Hook 사용)

### 사용법)

변수선언

```jsx
let {id} = useParams(); // HOOK
```

return설정

```jsx
function Detail({shrits}){

    let {id} = useParams(); // HOOK
    let findId = shrits.find((item) => item.id == id)

    return(
        <div className='col-md-4'>
            <h3>Detail Page</h3>
          {/* <img src={"https://raw.githubusercontent.com/ai-edu-pro/busan/main/t" + (props.i) + ".jpg"} width='100%'/> */}
          <a href='/event/one'><img src={shrits[id].img} width='100%'/></a>
          <h4>{shrits[id].title}</h4>
          <p>{shrits[id].content}</p>
          <p>{shrits[id].price}</p>
        </div>
    )
}
```

- let findId = shrits.find((item) => [item.id](http://item.id/) == id)
.find함수를 통해 검증을 해주고 돌림

# 7. useEffect()