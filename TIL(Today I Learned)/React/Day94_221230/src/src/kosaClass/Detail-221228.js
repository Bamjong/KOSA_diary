import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import styled from "styled-components";

let Box = styled.div`
    padding : 20px;
    color:grey;
    font-size: 20px;
`

function Detail({shrits}){

    let {id} = useParams(); // HOOK
    let navigate = useNavigate();
    let findId = shrits.find((item) => item.id == id)
    let [count, setCount] = useState(0)
    let [flag, setFlag] = useState(true);

    useEffect(()=>{
        let timer = setTimeout(() => {setFlag(false)}, 3000)
        return () => {clearTimeout(timer)}
    },[])

    return(
        <div className='col-md-4'>
        {
            flag == true
            ?
            <div>
                <img src='https://us.123rf.com/450wm/lkeskinen/lkeskinen1611/lkeskinen161100407/66746998-%EB%B0%94%EA%B2%90-%EC%84%B8%EC%9D%BC-%EC%84%B8%EC%9D%BC-%EA%B3%A0%EB%AC%B4-%EC%8A%A4%ED%83%AC%ED%94%84%EC%9E%85%EB%8B%88%EB%8B%A4-%EB%A8%BC%EC%A7%80-%ED%9D%A0%EC%A7%91-%EA%B7%B8%EB%9F%B0-%EC%A7%80-%EB%94%94%EC%9E%90%EC%9D%B8%EC%9E%85%EB%8B%88%EB%8B%A4-%ED%9A%A8%EA%B3%BC%EB%8A%94-%EA%B9%A8%EB%81%97%ED%95%98%EA%B3%A0-%EC%84%A0%EB%AA%85%ED%95%9C-%EB%AA%A8%EC%96%91%EC%9C%BC%EB%A1%9C-%EC%89%BD%EA%B2%8C-%EC%A0%9C%EA%B1%B0-%ED%95%A0-%EC%88%98-%EC%9E%88%EC%8A%B5%EB%8B%88%EB%8B%A4-%EC%83%89%EC%83%81%EC%9D%B4-%EC%89%BD%EA%B2%8C-%EB%B0%94%EB%80%9D%EB%8B%88%EB%8B%A4-.jpg' />
                <p>위 사진은 3초뒤 없어집니다.</p>
            </div>    
            : null
        }
        
            <button onClick={()=>{setCount(count+1)}}>증가</button>
            <Box>Detail Page</Box>
          <a href='/event/one'><img src={findId.img} width='100%'/></a>
          <h4>{findId.title}</h4>
          <p>{findId.content}</p>
          <p>{findId.price}원</p>

          <button className="btn btn-danger">주문하기</button>
          
          <button onClick={()=>{navigate(-1)}} className="btn btn-primary">뒤로가기</button>
          <button onClick={()=>{navigate(`/`)}} className="btn btn-success">홈</button>
          <button onClick={()=>{navigate(`/cart`)}} className="btn btn-dark">장바구니</button>

        </div>
    )
}

export default Detail;