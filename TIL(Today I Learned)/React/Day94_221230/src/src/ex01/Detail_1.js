import data from '../data'
import { useNavigate, useParams } from 'react-router-dom';
import styled from "styled-components";


let Box = styled.div`
  padding : 20px;
  color : grey;
  font-size: 20px;
`;
// let ColorBtn = styled.button`
//   background : blue;
//   color : black;
//   padding : 10px;
// `;
let ColorBtn = styled.button`
  background : ${ props => props.bg};
  color : ${props=> props.bg == 'blue' ? 'white' : props.color};
  padding : 10px;
`;
// let YellowBtn = styled.button`
//   background : yellow;
//   color : black;
//   padding : 10px;
// `;

function Detail(props) {


    
    let {id} = useParams(); //HOOK
    let navigate = useNavigate();
    let findId = props.data.find((item) => item.id == id);
    console.log(findId);

    return (
        <>
        
        <Box>
          <ColorBtn bg="blue">Detail Page</ColorBtn>
        </Box>
        <ColorBtn bg="black">Detail Page</ColorBtn>
        <div className='container'>
                <div className='row'>

                return <div className='col-md-4'>
                  <img src={findId.img} className='img-fluid' alt='yb'/>
                  <h4>{findId.title}</h4>
                  <p>{findId.content}</p>
                  <p>{findId.price}원</p>
                  <button className="btn btn-warning">주문하기</button>

                  <button className="btn btn-primary" onClick={()=>{navigate(-1)}}>뒤로가기</button>
                  <button className="btn btn-success" onClick={()=>{navigate('/')}}>HOME</button>
                  <button className="btn btn-dark" onClick={()=>{ navigate('/cart')}}>장바구니</button>
                </div>
                </div>
              </div>
        </>
    )
}

export default Detail;