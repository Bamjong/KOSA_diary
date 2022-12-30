import {Nav, Navbar, Container, NavDropdown} from 'react-bootstrap'
import './App.css';
import bg from './images/bg.jpg'
import Data from '../data'
import { useState } from 'react';


function App() {

   let [shrits, setShrits] = useState(Data);

  return (
    <div className="App">
      
    <Navbar bg="light" expand="lg">
      <Container>
        <Navbar.Brand href="#home">대보쇼핑몰</Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            <Nav.Link href="#home">Home</Nav.Link>
            <Nav.Link href="#link">Link</Nav.Link>
            <NavDropdown title="Dropdown" id="basic-nav-dropdown">
              <NavDropdown.Item href="#action/3.1">Action</NavDropdown.Item>
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

    <div className='container'>
      <div className='row'>
        
        <div className='col-md-4'>
        {/* <div className='main-img'
              style={{backgroundImage:'url(' + bg +')'}} ></div> */}
          <img src="https://raw.githubusercontent.com/ai-edu-pro/busan/main/t1.jpg" width='100%'/>
          <h4>{shrits[0].title}</h4>
          <p>{shrits[0].content}</p>
          <p>{shrits[0].price}</p>
        </div>


        {/* <div className='col-md-4'>
          <img src="https://raw.githubusercontent.com/ai-edu-pro/busan/main/t2.jpg" width='100%'/>
          <h4>{shrits[1].title}</h4>
          <p>{shrits[1].content}</p>
          <p>{shrits[1].price}</p>
        </div>

        <div className='col-md-4'>
          <img src="https://raw.githubusercontent.com/ai-edu-pro/busan/main/t5.jpg" width='100%'/>
          <h4>{shrits[2].title}</h4>
          <p>{shrits[2].content}</p>
          <p>{shrits[2].price}</p>
        </div> */}
      </div>

    </div>

    </div>
  );
}

export default App;
