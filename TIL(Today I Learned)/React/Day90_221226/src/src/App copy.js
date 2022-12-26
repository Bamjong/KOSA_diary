//eslint-disable//
import './App.css';
import MyComponents from './components/MyComponents'
import Hello from './components/Hello';

function App() {
  const str = "React!!!";
  const name = "함수형 컴포넌트"; 

  return (
    <div className="App">
      <h1> Hello world</h1>
      고범종
      <MyComponents name={name} str={str}/>
      <Hello name={name} />
      <Hello str={str} />

    </div>
  );
}

export default App;
