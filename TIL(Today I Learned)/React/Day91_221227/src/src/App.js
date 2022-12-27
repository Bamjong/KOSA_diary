import './App.css';
import logo from './images/chic_bg.png'
import Button from 'react-bootstrap/Button';
import Container from 'react-bootstrap/Container';
import Form from 'react-bootstrap/Form';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';
import data from './data'
import { useState } from 'react';


function App() {

  console.log(data)
  let [shrits, setShrits] = useState(data);

  return (
    <div className="App">
        <Navbar bg="light" expand="lg">
          <Container fluid>
            <Navbar.Brand href="#">Navbar scroll</Navbar.Brand>
            <Navbar.Toggle aria-controls="navbarScroll" />
            <Navbar.Collapse id="navbarScroll">
              <Nav
                className="me-auto my-2 my-lg-0"
                style={{ maxHeight: '100px' }}
                navbarScroll
              >
                <Nav.Link href="#action1">Home</Nav.Link>
                <Nav.Link href="#action2">Link</Nav.Link>
                <NavDropdown title="Link" id="navbarScrollingDropdown">
                  <NavDropdown.Item href="#action3">Action</NavDropdown.Item>
                  <NavDropdown.Item href="#action4">
                    Another action
                  </NavDropdown.Item>
                  <NavDropdown.Divider />
                  <NavDropdown.Item href="#action5">
                    Something else here
                  </NavDropdown.Item>
                </NavDropdown>
                <Nav.Link href="#" disabled>
                  Link
                </Nav.Link>
              </Nav>
              <Form className="d-flex">
                <Form.Control
                  type="search"
                  placeholder="Search"
                  className="me-2"
                  aria-label="Search"
                />
                <Button variant="outline-success">Search</Button>
              </Form>
            </Navbar.Collapse>
          </Container>
        </Navbar>

        <div className="jumbotron">
          <h1 className="display-4">Hello, world!</h1>
          {/* <img src='./images/chic_bg.png' alt='치킨' /> */}
          <img src={logo} className='App-logo' alt='치킨' />
          <p className="lead">이것은 굉장한 치킨!</p>
          <p>매우 엄청난!</p>
          <p className="lead">
            <a className="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
          </p>
        </div>

        <div className='container'>
          <div className='row'>
            
            
            {shrits.map((el)=>{
                return (
                  <div className='col-md-4'>
                    <img src={el.img} width='80%'/>
                    <h4>{el.title}</h4>
                    <p>{el.content}</p>
                    <p>{el.price}</p>
                  </div>
                )
            })}



{/* 
            <div className='col-md-4'>
              <img src="https://raw.githubusercontent.com/ai-edu-pro/busan/main/t1.jpg" width='80%'/>
              <h4>{shrits[0].title}</h4>
              <p>{shrits[0].content}</p>
              <p>{shrits[0].price}</p>
            </div>
            <div className='col-md-4'>
              <img src="https://raw.githubusercontent.com/ai-edu-pro/busan/main/t2.jpg"  width='80%' />
              <h4>{shrits[1].title}</h4>
              <p>{shrits[1].content}</p>
              <p>{shrits[1].price}</p>
            </div>
            <div className='col-md-4'>
              <img src="https://raw.githubusercontent.com/ai-edu-pro/busan/main/t5.jpg"  width='80%'/>
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