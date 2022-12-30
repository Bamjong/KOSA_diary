import data from '../data'
import { useNavigate, useParams } from 'react-router-dom';
import styled from "styled-components";
import {React, useContext, useEffect, useState} from 'react'
import { Tabs,Tab,Nav } from "react-bootstrap";
import { StockContext } from '../App';


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
    let [count, setCount] = useState(0);
    let [flag, setFlag] = useState(true);
    let [clickTab, setClickTab] = useState(0);
    // useEffect(()=>{
    //   // 여기에 기재하면 코드는 컴포넌트의 생성/업데이트/소멸에 관련된 것들을 실행한다.
    //   console.log('react');
    //   setCount();
    // },[count])

    // useEffect(()=>{
    //   setInterval(() => {setFlag(false)}, 3000 );
    //   // setTimeout(() => { setFlag(false)}, 3000);
    // },[])   
    useEffect(()=>{
      let timer = setTimeout(() => {setFlag(false)}, 3000)
      return () => { clearTimeout(timer);}
      }, [count]);
 
    return (
        <>
        {
          flag == true
          ? <div>1초 이내 구매하시면 할인 됩니다.</div>
          : null
        }
        <button onClick={()=>{setCount(count+1)}}>증가</button>
        {count}
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
                <br/>

                {/* <Tabs defaultActiveKey="link1"   transition={false}
                id="noanim-tab-example"
                className="mb-3"
                >
                <Tab   eventKey="link1" title="환불정책">
                  <div>내용1</div>
                </Tab>
                <Tab eventKey="link2" title="교환방법">
                  <div>내용2</div>
                </Tab>
                <Tab   eventKey="link3" title="배송문의">
                  <div>내용3</div>
                </Tab>
              </Tabs> */}
              <Nav variant="tabs" defaultActiveKey="/home">
                <Nav.Item>
                      <Nav.Link eventKey="link1" onClick={() => { setClickTab(0) }}>환불정책</Nav.Link>
                  </Nav.Item>
                  <Nav.Item>
                      <Nav.Link eventKey="link2" onClick={() => { setClickTab(1) }}>교환방법</Nav.Link>
                  </Nav.Item>
                  <Nav.Item>
                      <Nav.Link eventKey="link3" onClick={() => { setClickTab(2) }}>
                          상품평
                      </Nav.Link>
                  </Nav.Item>
              </Nav>
              <TabComponent clickTab={clickTab} />
              </div>

              

        </>
    )
} 



function TabComponent({clickTab}){
  let [fade, setFade] = useState('');
 
  useEffect(()=>{
    let timer = setTimeout(()=>{
      setFade('end')
    }, 10);
    return()=>{
      clearTimeout();
      setFade('')
    }
  },[clickTab])

  let {stock} = useContext(StockContext);

  return (
    <div className={`start ${fade}`}>
      {stock[2]}
      {[<div>내용0</div>,<div>내용1</div>,<div>내용2</div>][clickTab]}
    </div>
  )
}

// function TabComponent({probs}){

//   if(probs.clickTab === 0) {
//     <div>내용1</div>
//   }
//   if(probs.clickTab === 1){
//     <div>내용2</div>
//   }
//   if(probs.clickTab === 2){
//     <div>내용3</div>
//   }
// }

export default Detail;