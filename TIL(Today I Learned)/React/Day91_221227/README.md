# 📚 **Day91_221227**

# 1. 과제 1 - 버튼 클릭 시 Title 변경 ✔

```
<button onClick={()=>{
    (title[0] === '혜화 서커스')
    ? setTitle(["부천 서커스", "삼산 서커스", "부평 서커스", "중동 서커스"])
    : setTitle(["부천 고범종 서커스", "삼산 고범종 서커스", "부평 고범종 서커스", "중동 고범종 서커스"])
}}
class='btn btn-primary' >title chage</button>

```

<br>

# 2. 과제 2 - Tilte에 sort 적용 ✔

```
function titleSort() {
  let titleSort = [...title].sort();
  setTitle(titleSort);
}

```

<br>

### [sort 전]

![https://user-images.githubusercontent.com/111114507/209604120-caa4bcfb-269c-4833-9d6f-66ebd9e1543e.png](https://user-images.githubusercontent.com/111114507/209604120-caa4bcfb-269c-4833-9d6f-66ebd9e1543e.png)

<br>

### [sort 후]

![https://user-images.githubusercontent.com/111114507/209604099-5093357c-186a-44fe-9af1-4b37fd64b904.png](https://user-images.githubusercontent.com/111114507/209604099-5093357c-186a-44fe-9af1-4b37fd64b904.png)

<br>

# 3. 과제 3 - Modal ✔

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
let [day, setDay] = useState(["범종이집", "정원이집", "인천시","부천시"])
let [publish] = useState(['2월 10일 발행','6월 5일 발행','12월 3일 발행', '4월 19일 발행'])
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
  copy[0] = "안녕"
  setTitle(copy);

  title[0] === "혜화 서커스" ? setTitle(["범종","범종","범종","범종"]) : setTitle(["워니","워니","워니","워니"])
}

  return (
    <div className="App">
      <div onClick={()=>{setCount(count + 1); console.log(count);}}>안녕</div>
      <header className = "">
      <div className="nav"> 밤톨 서커스단</div>
      <p>{nickName} 님 밤톨 서커스에 오신 것을 환영합니다</p>
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
                👍
              </span>
              {like[i]}
            </h3>
            <p>3월 02일 발행</p>
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
      <b>상세정보</b>
      <p>▶ {props.title} / 
      날짜 : {props.day} / 
      좋아요 : {props.like}</p>
    </div>
  )
}

export default App;
```

<br>

# 4. 과제 4 - 쇼핑몰 ✔

![https://user-images.githubusercontent.com/111114507/209660250-2d380eef-9f96-49d1-914d-cdea30589289.png](https://user-images.githubusercontent.com/111114507/209660250-2d380eef-9f96-49d1-914d-cdea30589289.png)

### [App.js]

```
<div className="jumbotron">
<img src={"<https://www.foodandwine.com/thmb/o_G0VswYjyWy4B9epctoJ8lz9pI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/buttermilk-crumpets-FT-RECIPE0221-6975d0b31b0f469d8ebea3ae1dcf7bfd.jpg>"} width={'80%'} height ={'400px'} alt="하이"/>
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

react에선 public 폴더안에 넣어서 사용함