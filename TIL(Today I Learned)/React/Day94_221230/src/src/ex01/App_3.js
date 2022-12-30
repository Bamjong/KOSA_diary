import { useState } from 'react';
import {Nav, Navbar, Container, NavDropdown, Button} from 'react-bootstrap'
import { Link, Outlet, Route, Routes, useNavigate } from 'react-router-dom';
import axios from 'axios';

import './App.css';
import bg from './images/bg.jpg'
import Data from '../data'
import Detail from '../componets/Detail';
import Cart from '../componets/Cart';


function App() {

   let [shirts, setShirts] = useState(Data);  //HOOK

  return (
    <div className="App">
      
    <Navbar bg="light" expand="lg">
      <Container>
        <Navbar.Brand href="#home">대보쇼핑몰</Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            <Nav.Link href="/">홈</Nav.Link>
            <Nav.Link href="/detail/0">상세페이지</Nav.Link>
            <Nav.Link href="/cart">장바구니</Nav.Link>
            <Link to="/event" >이벤트</Link>
            <NavDropdown title="우리회사정보" id="basic-nav-dropdown">
              <NavDropdown.Item href="/about">정보</NavDropdown.Item>
              <NavDropdown.Item href="#action/3.2">
                찾아오시는길
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
      <img src={bg} width={'100%'} height={'5%'} alt='블랙핑크 티셔츠' />
      {/* <img src={"https://thumb.cjonstyle.net/unsafe/fit-in/470x470/itemimage.cjonstyle.net/goods_images/20/759/2006298759L.jpg?timestamp=20220920083804"} width={'100%'} height={'100px'} alt='블랙핑크 티셔츠' /> */}
      <h4 className="display-4">블랙핑크 티셔츠</h4>
      <p className="lead">우리 이쁜 티셔츠 입고 되었어요.</p>
    </div>

    <button onClick={() =>{
      axios.get('https://raw.githubusercontent.com/ai-edu-pro/busan/main/data2.json')
      // axios.get('https://raw.githubusercontent.com/TWKIM0709/DataBaseGit/main/cheese.json')
      .then((result)=>{ 
        let newShirts = [...shirts, ...result.data]
        setShirts(newShirts)
        console.log(result.data);
       })
      .catch(()=>{console.log('data fail'); })
  }}
    className='btn btn-primary'>더보기</button>
    
  <Routes>
    <Route path='/' element={
        <div className='container'>
            <div className='row'>
              {/* 배열데이터.map( ()=>{} ) */}
              {
                shirts.map((item, i)=> {
                  return <Card shirts={shirts[i]} i={i} key={i} />
                })
              }  
            </div>
        </div>
      }
    />

    <Route path='/cart' element={<Cart />}  />
    <Route path='/detail/:id' element={ <Detail shirts={shirts}/>} />

    <Route path='/about' element={<About />}>
      <Route path='emp' element={<div>너는 우리 직원이야</div>} />
      <Route path='location' element={<div>혜화역 4번 출구</div>} />
    </Route>

    <Route path='*' element={<h3>없는 페이지 입니다.</h3>}  />

    <Route path='/event' element={<EventPage />}>
      <Route path='one' element={<h1>One</h1>} />
      <Route path='two' element={<h1>Two</h1>} />
    </Route>

  </Routes>   
  

  {/* <button onClick={()=>{   // JSON --> object/array  자동으로 변환 못한다. 직접 변환해줘야한다.
    fetch('url').then(res=> res.json()).then((result)=>{ console.log(result);})
  }}>fetch()</button> */}

  {/* <button onClick={()=>{
    axios.post('URL', {name:'yuna'}).then().catch()

    Promise.all([axios.get('URL1'), axios.get('URL2')]).then(1).then(2).catch()
  }}
  className='btn btn-success'>추가</button> */}

  </div>
  );
}  // end App.js

function About() {
  return(
      <>
          <h1>About Page</h1>
          <Outlet></Outlet>
      </>
  )
} // end About.js

function EventPage() {
  return(
      <>
          <h1>EventPage Page</h1>
          <Outlet></Outlet>
      </>
  )
} // end EventPage.js

// '문자'+변수+'문자'  ==> `문자 ${변수} 문자`
//function Card({shirts, i}) {
function Card(props) {

  let navigate = useNavigate();

  return(
    <div className='container'>
      <div className='row'>
        <div className='col-md-6'>
          {/* <img src={"https://raw.githubusercontent.com/ai-edu-pro/busan/main/t" + (props.i) + ".jpg"} width='100%'/> */}
          <img onClick={()=>{ navigate(`/detail/${props.shirts.id}`) }}
               src={`https://raw.githubusercontent.com/ai-edu-pro/busan/main/t${(props.i)+1}.jpg`} width='100%'/>
          {/* <h4>{props.shirts.title}</h4>
          <p>{props.shirts.content}</p>
          <p>{props.shirts.price}</p> */}
          {/* <Button>주문하기</Button> */}
          
        </div>
      </div>
    </div>
  )
}  // end Card.js

export default App;
