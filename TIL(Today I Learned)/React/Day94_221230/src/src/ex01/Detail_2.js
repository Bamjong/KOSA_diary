import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import styled from "styled-components";


let Box = styled.div`
    padding : 20px;
    color:grey;
`;
let ColorBtn = styled.button`
    background : ${ props => props.bg };
    color : ${ props=> props.bg == 'black' ? 'white' : props.color };
    padding: 10px;
`;
let YellowBtn = styled(ColorBtn)`  // 상속형태
    background : yellow;
`;

// let YellowBtn = styled.button`
//     background : yellow;
//     color : black;
//     padding: 10px;
// `;

function Detail(props) {

    let { id } = useParams();  // HOOK
    let navigate = useNavigate();
    let findId = props.shirts.find((item)=>  item.id == id );
    let [count, setCount] = useState(0);
    let [flag, setFlag] = useState(true);

    useEffect(()=>{ 
        let timer = setTimeout(() => { setFlag(false);  }, 3000)
        return ()=> {  clearTimeout(timer); }
     },[])
   
    return(
      <div className='container'>
         {
            flag == true
            ? <ColorBtn bg='yellow'>12월 말까지 구매하시면 40% 할인됩니다.</ColorBtn>
            : null
        }
       
        <div className='row'>
          <div className='col-md-6'>
            <img src={`https://raw.githubusercontent.com/ai-edu-pro/busan/main/t${(findId.id)+1}.jpg`} width='100%'/>
            <h4>{findId.title}</h4>
            <p>{findId.content}</p>
            <p>{findId.price}원</p>

            <button onClick={()=>{ navigate('/cart') }} className="btn btn-danger">주문하기</button>

            <button onClick={()=>{ navigate(-1) }} className="btn btn-primary">뒤로가기</button>
            <button onClick={()=>{ navigate('/') }} className="btn btn-success">홈</button>
            <button onClick={()=>{ navigate('/cart') }} className="btn btn-dark">장바구니</button>
          </div>
        </div>


      </div>
    )
}

export default Detail;