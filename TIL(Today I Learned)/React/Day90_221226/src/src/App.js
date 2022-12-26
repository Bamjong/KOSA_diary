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


      {/* <div className="list">
        <h4>{title[0]} <span onClick={()=>{setLike(like + 1);}}> 👍 </span>{like[0]} </h4>
          <p>3월 6일 공연일</p>
      </div>

      <div className="list">
        <h4>{title[1]} <span> 👍 </span>{like[1]} </h4>
          <p>3월 6일 공연일</p>
      </div>

      <div className="list">
        <h4>{title[2]} <span> 👍 </span>{like[2]} </h4>
          <p>3월 6일 공연일</p>
      </div>

      <div className="list">
        <h4>{title[3]} <span> 👍 </span>{like} </h4>
          <p>3월 6일 공연일</p>
      </div> */}

    </div>
  );
}

export default App;