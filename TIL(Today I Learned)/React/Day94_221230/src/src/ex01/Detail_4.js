import { useEffect, useState } from "react";
import { Tabs, Tab, Nav } from "react-bootstrap";
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
// 

function Detail(props) {

    let { id } = useParams();  // HOOK
    let navigate = useNavigate();
    let findId = props.shirts.find((item)=>  item.id == id );
    let [count, setCount] = useState(0);
    let [flag, setFlag] = useState(true);

    let [clickTab, setClickTab] = useState(0);

    //useEffect(()=>{ 실행코드 }, [])
    //useEffect(()=>{ 실행코드 }, [state변수])
    //useEffect(()=>{ 2실행코드 return()=>{ 1리턴실행코드 }}, [])
    // useEffect(()=>{ 
    //    let timer = setTimeout(() => { setFlag(false); console.log('aaa'); }, 3000)
    //    return ()=> {  clearTimeout(timer); console.log('bbb');}
    // },[count])

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
        {/* <button onClick={()=>{setCount(count+1)}}>증가</button>
        {count} */}
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
        </div><br />

      {/* <Tabs defaultActiveKey="link0"   transition={false}
        id="noanim-tab-example"
        className="mb-3"
        >
          <Tab onClick={setClickTab(0)} eventKey="link0" title="환불정책">button0</Tab>          
          <Tab onClick={setClickTab(1)} eventKey="link1" title="교환방법">button1</Tab>
          <Tab onClick={setClickTab(2)}  eventKey="link2" title="배송문의">button2</Tab>
          
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

       <TabComponet clickTab={clickTab} />

      </div>
    )
} // end Detail.js 

//function TabComponet(props) {
function TabComponet({clickTab}) {

  let [fade, setFade] = useState('');

  useEffect(()=>{
    let timer = setTimeout(()=>{
      setFade('end')
    }, 10);

    return()=>{
      clearTimeout(timer);
      setFade('')
    }

  },[clickTab])

  return (
    <div className={`start ${fade}`}>

        {[<div>내용0</div>, <div>내용1</div>, <div>내용2</div>][clickTab]}
    </div>
  )

    // if(props.clickTab === 0 ) {
    //   return <div>내용1</div>
    // }
    
    // if(props.clickTab === 1 ) {
    //   return <div>내용2</div>
    // }
    
    // if(props.clickTab === 2 ) {
    //   return <div>내용3</div>
    // }

}

export default Detail;