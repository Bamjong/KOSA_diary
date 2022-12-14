# π **Day92_221228**

# 1. μ»΄ν¬λνΈ λ§λ€κΈ°

```jsx
function Card() {
  return(
    <>
    </>
  )
}
export default Card;
```

- Card() λΌλ ν¨μλ₯Ό λ§λ€κ³ 
- <></> λ₯Ό ν΅ν΄ λ³΅μνκ·Έ λ£λλ‘ μ€μ ν΄μ£Όκ³ 
- export default Card; λ₯Ό ν΅ν΄ Cardν¨μλ₯Ό λ±μ΄λ΄ λ€λ₯Έκ³³μμ λ°μ μ μλλ‘ μ€μ 

# 2. Props

[[React] μ»΄ν¬λνΈμ Props μ λ¬νκΈ°](https://jinyisland.kr/post/react-props/)

λΆλͺ¨κ° μμ μ»΄ν¬λνΈμκ² κ°μ μ€λ μ°λκ².

### λ¨μΌ κ° μ λ¬νκΈ°

μ»΄ν¬λνΈ μμ± μ ν΄λΉ μ»΄ν¬λνΈ νκ·ΈμΒ `λ³μμ΄λ¦={}`μΌλ‘ μ¬μ©νλ€.

```jsx
//App.js (μ΅μμ μ»΄ν¬λνΈ)
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

μ λ¬λ°λ μ»΄ν¬λνΈ (μμ μ»΄ν¬λνΈ)μμλ λ§€κ°λ³μλ‘ λ°μμ¬ μ μλλ°Β `κ°μ²΄`Β νμμΌλ‘ μ λ¬ λ°λλ€.

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

[κ΅¬μ‘° λΆν΄ ν λΉ](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)μ ν΅ν΄ λμ± μ½κ² λ°μ μ μλ€.

κ°μ²΄λ λ°°μ΄ κ΅¬λ¬Έμμ μμ±μ λ°λ‘ ν΄μ²΄ν΄μ λ³μμ²λΌ μ¬μ©ν  μ μλ ννμμ΄λ€.

```jsx
//Time.js (μμ μ»΄ν¬λνΈ)
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

## μ€μ²©λΌμ°ν°

![https://user-images.githubusercontent.com/92353613/209748811-7477a888-bc87-48e4-a694-e00303726819.png](https://user-images.githubusercontent.com/92353613/209748811-7477a888-bc87-48e4-a694-e00303726819.png)

- μ μ¬μ§μμ <Route>μμ λ <Route> μμ±νκ±Έ μ€μ²©λΌμ°ν°λΌκ³  λΆλ₯Έλ€

```jsx
function About(){

  return(
      <>
      <h1>About Page</h1>
      <p>νμ¬ μ λ³΄</p>
      <Outlet></Outlet>  
      {/* μ΄ μμΉμ μ€μ²© λΌμ°ν° ν κ±° λ³΄μ¬μ€λ€ */}
      </>
  )
} // end About.js
```

- μ€μ²©λΌμ°ν°λ₯Ό λ³΄μ¬μ€ κ³³μ <Outlet></Outlet>μ μμ±νλ©΄ μ§μ ν κ³³μ λ³΄μ΄κ²λλ€

# 4. μμΈμ²λ¦¬ νμ΄μ§

```jsx
<Route path='*' element={<h3>404 μλνμ΄μ§μλλ€</h3>}>
```

# 5. useNavigate()

### μ¬μ©λ²)

λ³μμ μΈ

```jsx
let navigete = useNavigate();
```

- navigate μμ²΄κ° ν¨μλ‘ μ μΈλ¨

κ²½λ‘ μ€μ 

```jsx
<button onClick={()=>{
              navigete('/detail')
          }} className='btn btn-primary'>μ£Όλ¬ΈνκΈ°</button>
```

- navigete('/detail')λ₯Ό μ¬μ©νλ©΄ <Route path='/detail' element={<Detail shrits={shrits[0]}/>}/>
Route μ§μ νκ³³μΌλ‘ μ΄λνλλ‘ λ¨.

# 6. useParams()

κΈ°μ‘΄ urlλ€μ νλΌλ―Έν° κ°μ κ°μ Έμ€λ ν¨μμ΄λ€. (Hook μ¬μ©)

### μ¬μ©λ²)

λ³μμ μΈ

```jsx
let {id} = useParams(); // HOOK
```

returnμ€μ 

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
.findν¨μλ₯Ό ν΅ν΄ κ²μ¦μ ν΄μ£Όκ³  λλ¦Ό

# 7. useEffect()