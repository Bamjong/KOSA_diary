# π **Day91_221227**

# 1. κ³Όμ  1 - λ²νΌ ν΄λ¦­ μ Title λ³κ²½ β

```
<button onClick={()=>{
    (title[0] === 'νν μμ»€μ€')
    ? setTitle(["λΆμ² μμ»€μ€", "μΌμ° μμ»€μ€", "λΆν μμ»€μ€", "μ€λ μμ»€μ€"])
    : setTitle(["λΆμ² κ³ λ²μ’ μμ»€μ€", "μΌμ° κ³ λ²μ’ μμ»€μ€", "λΆν κ³ λ²μ’ μμ»€μ€", "μ€λ κ³ λ²μ’ μμ»€μ€"])
}}
class='btn btn-primary' >title chage</button>

```

<br>

# 2. κ³Όμ  2 - Tilteμ sort μ μ© β

```
function titleSort() {
  let titleSort = [...title].sort();
  setTitle(titleSort);
}

```

<br>

### [sort μ ]

![https://user-images.githubusercontent.com/111114507/209604120-caa4bcfb-269c-4833-9d6f-66ebd9e1543e.png](https://user-images.githubusercontent.com/111114507/209604120-caa4bcfb-269c-4833-9d6f-66ebd9e1543e.png)

<br>

### [sort ν]

![https://user-images.githubusercontent.com/111114507/209604099-5093357c-186a-44fe-9af1-4b37fd64b904.png](https://user-images.githubusercontent.com/111114507/209604099-5093357c-186a-44fe-9af1-4b37fd64b904.png)

<br>

# 3. κ³Όμ  3 - Modal β

```jsx
import './App.css';
import {useState} from "react";

// function alert(){
//   swal("Good job!", "You clicked the button!", "success");
// }

function App() {
let nickName="λλ"
let [title, setTitle] = useState(["νν μμ»€μ€", "κ°λ¨ μμ»€μ€", "νλ μμ»€μ€", "μ’λ‘ μμ»€μ€"]);
let [like, setLike] = useState([0,0,0,0]);
let [count, setCount] = useState(0);
let [day, setDay] = useState(["λ²μ’μ΄μ§", "μ μμ΄μ§", "μΈμ²μ","λΆμ²μ"])
let [publish] = useState(['2μ 10μΌ λ°ν','6μ 5μΌ λ°ν','12μ 3μΌ λ°ν', '4μ 19μΌ λ°ν'])
let [flag, setfleg] = useState(false);
let [modal, setModal] = useState([false,false,false,false]);

function onoff() {
  (modal === false) ? setModal(false) : setModal(true)
}

function titleSort(){
  let titleSort = [...title].sort
  setTitle(titleSort)
}

function click (){
  let copy = [...title];
  copy[0] = "μλ"
  setTitle(copy);

  title[0] === "νν μμ»€μ€" ? setTitle(["λ²μ’","λ²μ’","λ²μ’","λ²μ’"]) : setTitle(["μλ","μλ","μλ","μλ"])
}

  return (
    <div className="App">
      <div onClick={()=>{setCount(count + 1); console.log(count);}}>μλ</div>
      <header className = "">
      <div className="nav"> λ°€ν¨ μμ»€μ€λ¨</div>
      <p>{nickName} λ λ°€ν¨ μμ»€μ€μ μ€μ  κ²μ νμν©λλ€</p>
      <a href="https://www.naver.com/" rel="nooper noreferrer" target="blank">UFC KISS</a>
      </header>
      <br></br>
      
      {title.map((el, i) => {
        return (
          <div className="list" key={i}>
            <h3 onClick={() => {

              let modal1 = [...modal];
              
              if(modal[i] === false){
                modal1[i] = true
                setModal(modal1)
              } else{
                modal1[i] = false
                setModal(modal1)
              }
            }}>
              {el}
              <span
                onClick={() => {
                  let likeCnt = [...like];
                  likeCnt[i]++;
                  setLike(likeCnt);
                }}
              >
                π
              </span>
              {like[i]}
            </h3>
            <p>3μ 02μΌ λ°ν</p>
            <hr />

            {
              modal[i] === true ?  <MyModal title={title[i]} day={day[i]} like={like[i]}/> : null
            }
          </div>
          
        );
      })}

      <button className='btn btn-primary' onClick={click}>title change</button>
      <button className='btn btn-primary' onClick={titleSort}>title sort</button>
     
     
    </div>
  );
}

function MyModal(props){
  return(
    <div>
      <b>μμΈμ λ³΄</b>
      <p>βΆ {props.title} / 
      λ μ§ : {props.day} / 
      μ’μμ : {props.like}</p>
    </div>
  )
}

export default App;
```

<br>

# 4. κ³Όμ  4 - μΌνλͺ° β

![https://user-images.githubusercontent.com/111114507/209660250-2d380eef-9f96-49d1-914d-cdea30589289.png](https://user-images.githubusercontent.com/111114507/209660250-2d380eef-9f96-49d1-914d-cdea30589289.png)

### [App.js]

```
<div className="jumbotron">
<img src={"<https://www.foodandwine.com/thmb/o_G0VswYjyWy4B9epctoJ8lz9pI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/buttermilk-crumpets-FT-RECIPE0221-6975d0b31b0f469d8ebea3ae1dcf7bfd.jpg>"} width={'80%'} height ={'400px'} alt="νμ΄"/>
<h3>Fancy a crumpet?</h3>
<p className="lead">delicious crumpets</p>
</div>

<div className="container">
<div className="row">

{image.map((el, i) => {
    // let fullLink =  "<https://raw.githubusercontent.com/ai-edu-pro/busan/main/t>" + (i+1) + ".jpg"
    return (
    <div className='col-md-4'>
            <img src={el.image} width="80%"/>
            <h4>{el.title}</h4>
            <p>{el.content}</p>
            <p>{el.price}</p>
    </div>
    )
})}
</div>

```

<br>

### [data.js]

```
let data = [

	{
	    id : 0,
	    title : "Black and White",
  	    content : "Born in France",
	    price : 120000,
		image : "<https://raw.githubusercontent.com/ai-edu-pro/busan/main/t1.jpg>"
	},
	{
	    id : 1,
	    title : "Red Knit",
  	    content : "Born in Seoul",
	    price : 110000,
		image : "<https://raw.githubusercontent.com/ai-edu-pro/busan/main/t2.jpg>"
	},
	{
	id : 2,
	title : "Brey Yordan",
	content : "Born in the states",
	image : "<https://raw.githubusercontent.com/ai-edu-pro/busan/main/t5.jpg>"
	}
]
export default data;

```

# 5. img

reactμμ  public ν΄λμμ λ£μ΄μ μ¬μ©ν¨