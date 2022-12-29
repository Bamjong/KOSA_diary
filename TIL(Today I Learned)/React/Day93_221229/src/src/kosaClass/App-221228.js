import {Nav, Navbar, Container, NavDropdown} from 'react-bootstrap'
import './App.css';
import bg from './images/bg.jpg'
import Data from './data'
import { useEffect, useState } from 'react';
import { Navigate, Outlet, Route, Routes, useNavigate } from 'react-router-dom';
import Detail from './components/Detail'
import Cart from './components/Cart'


function App() {

   let [shrits, setShrits] = useState(Data);
   let navigate = useNavigate();
   useEffect(()=>{
      //여기에 기재하면 이 코드는 컴포넌트의 생성/업데이트/소멸에 관련된 것들을 실행한다.
      console.log('react');
   })

  return (
    <div className="App">
      
    <Navbar bg="light" expand="lg">
      <Container>
        <Navbar.Brand href="#home">대보쇼핑몰</Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
              <Nav.Link onClick={() => navigate('/')}>Home</Nav.Link>
              <Nav.Link href="/detail">detail</Nav.Link>
              <Nav.Link href="/cart">cart</Nav.Link>
            <NavDropdown title="우리회사정보" id="basic-nav-dropdown">
              <NavDropdown.Item href="/about">정보</NavDropdown.Item>
              <NavDropdown.Item href="/event">이벤트</NavDropdown.Item>
              <NavDropdown.Item href="#action/3.2">
                Another action
              </NavDropdown.Item>
              <NavDropdown.Item href="#action/3.3">Something</NavDropdown.Item>
              <NavDropdown.Divider />
              <NavDropdown.Item href="#action/3.4">
                Separated link
              </NavDropdown.Item>
            </NavDropdown>
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
    <div className="jumbotron">
      <img src={bg} width={'100%'} height={'50%'} alt='블랙핑크 티셔츠' />
      {/* <img src={"https://thumb.cjonstyle.net/unsafe/fit-in/470x470/itemimage.cjonstyle.net/goods_images/20/759/2006298759L.jpg?timestamp=20220920083804"} width={'100%'} height={'100px'} alt='블랙핑크 티셔츠' /> */}
      <h4 className="display-4">블랙핑크 티셔츠</h4>
      <p className="lead">우리 이쁜 티셔츠 입고 되었어요.</p>
    </div>

    
    <Routes>
      <Route path='/' element={
        <div div className = 'container' >
          <div className='row'>
            {/* 배열데이터.map( ()=>{} ) */}
            {
              shrits.map((item, i)=> {
                return <Card shrits={shrits[i]} i={i} key={i} />
              })
            }  
          </div>
        </div>
        }>
      </Route>

      <Route path='/cart' element={<Cart/>}/>
      <Route path='/detail/:id' element={<Detail shrits={shrits}/>}/>

      <Route path='/about' element={<About/>}>
        <Route path='emp' element={<div>너는 우리 직원이야</div>}/>
        <Route path='location' element={<div>혜화역 4번출구</div>}/>
      </Route>

      <Route path='*' element={<h3>404 없는페이지입니다</h3>}>

      </Route>

      <Route path='/event' element={<Event/>}>
        <Route path='one' element={<div>첫 주문은 1+1입니다</div>}/>
        <Route path='two' element={<div>포인트 10,000점 드립니다.</div>}/>
      </Route>


    </Routes>

    </div>
  );
}

function Event(){
  return(
    <>
    <h1>이벤트 내역</h1>
    <Outlet></Outlet>
    </>

  )
}

function About(){

  return(
      <>
      <h1>About Page</h1>
      <p>회사 정보</p>
      <Outlet></Outlet>  
      {/* 이 위치에 중첩 라우터 한 거 보여준다 */}
      </>
  )
} // end About.js


// '문자'+변수+'문자'  ==> `문자 ${변수} 문자`
//function Card(props) {
function Card({shrits}) {

  let navigate = useNavigate();

  return(
 
        <div className='col-md-4'>
  
          <img onClick={() => {navigate(`/detail/${shrits.id}`)}}
           src={shrits.img} width='100%'/>
          <h4>{shrits.title}</h4>
          <p>{shrits.content}</p>
          <p>{shrits.price}</p>
          <button onClick={()=>{
              // navigate(`/detail`)
          }} className='btn btn-primary'>주문하기</button>
        </div>

  )
}

export default App;