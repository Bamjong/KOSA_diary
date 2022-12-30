import './App.css';
import React, { useState } from 'react';
import './css/main.css'
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import data from './data'
import {Route, Routes, useNavigate } from 'react-router-dom';
import Detail from './component/Detail'
import Cart from './component/Cart'
import About from './component/About'
import axios from "axios";

export let StockContext = React.createContext(); // 1. 컨텍스트 만들고


function App() {

  let [Data, setData] = useState(data);
  let [stock] = useState([7, 13, 20]); // 재고 - Context API
  return (
    <div className="App">
      
        <Navbar bg="light" expand="lg">
          <Container fluid>
            <Navbar.Brand href="#">Tea Time And Coding</Navbar.Brand>
            <Navbar.Toggle aria-controls="navbarScroll" />
            <Navbar.Collapse id="navbarScroll">
              <Nav
                className="me-auto my-2 my-lg-0"
                style={{ maxHeight: '100px' }}
                navbarScroll
              >
                <Nav.Link href="/">Home</Nav.Link>
                <Nav.Link href="/detail">Detail</Nav.Link>
                <Nav.Link href="/cart">Cart</Nav.Link>
                <Nav.Link href="/about">About</Nav.Link>

              </Nav>
             
            </Navbar.Collapse>
          </Container>
        </Navbar>



      <Routes>
        <Route path='/' element={

          <>
            <div className="home">
              <div className="jumbotron">
                <img src="img/bg.jpg" className="w-25" alt="모자쓴예삐" />
                <h1 className="display-4">Hello, YEPPIE!</h1>
                <p className="lead">대보에 대한 불신이 가득한 KOSA 703호입니다. 예삐의 모자를 구경하세요.</p>
                <p className="lead">
                  <a className="btn btn-primary btn-lg" href="#" role="button">View more</a>
                </p>
              </div>
            </div>

              
              <Card data={data}/>
          </>
        }>
        </Route>

        <Route path='/detail/:id' element={
        <StockContext.Provider value={{stock}}>
          <Detail data={data}/>
          </StockContext.Provider>
        }
        />
            <Route path='/cart' element={<Cart/>}/>
            <Route path='/about' element={<About/>}>
                <Route path='emp' element={<div>너는 우리 직원이야</div>}/>
                <Route path='location' element={<div>혜화역 4번 출구</div>}/>
            </Route>
            <Route path='/event' element={<Event/>}>
                <Route path='one' element={<div>첫 주문은 1+1입니다.</div>}/>
                <Route path='two' element={<div>포인트 1,0000점을 드립니다.</div>}/>
            </Route>
            {/* 에러페이지 만들기 */}
            <Route path='*' element={<h1>없는 페이지 입니다.</h1>}/>
        {/* <Outlet></Outlet> */}
        {/* 이 위치에 중첩 라우터 한 거 보여준다 */}

      </Routes>
      <button onClick={()=>{
        axios.get('https://raw.githubusercontent.com/Domaya/React/main/workspace/shopping-mall/src/data2.json')
        .then((result)=>{
          let newCopy = [...data, ...result.data];
          setData(newCopy);
          console.log(newCopy)
        }).catch(()=>{console.log('ajax fail')})
      }} className='btn btn-primary'>더보기</button>

      
            
      <button onClick={()=>{
        axios.post('URL', {name:'yuma'}).then().catch()
      }} className='btn btn-primary'>
        추가
        </button>

    </div>
  );
}
function Event(){

}

function Card(props){
  let navigate = useNavigate();

  return(
     <div className='container'>
      <h3>Detail Page</h3>



            <div className='row'>
            {props.data.map((item, index) => 
              <div className='col-md-4' key={index}>
              
              <img onClick={()=>{navigate(`/detail/${item.id}`)}}
                src={item.img} className='img-fluid' alt='yb'/>
              <h4>{item.title}</h4>
              <p>{item.content}</p>
              <p>{item.price}</p>
              {/* <button className="btn btn-danger">주문하기</button> */}
            </div>
            )}
  
            
        </div>
      </div>

  )
}

export default App;