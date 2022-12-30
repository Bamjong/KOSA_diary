import { Table } from "react-bootstrap";
import { useDispatch, useSelector } from "react-redux";
import { changeName, changeCnt } from "../store";

function Cart() {
  // let value = useSelector((state) => state.state);
  //let value = useSelector((state) => state.people);
  //console.log(value);
  //let value1 = useSelector((state) => state.stock);
  //let value2 = useSelector((state) => state.stock[0]);
  //console.log(value1);
  //console.log(value2);

  let state = useSelector((state) => state);
  console.log(state);

  let dispatch = useDispatch(); // action에 있는 것들 호출해주는

  return (
    <div>
      <h1>{state.user}님의 장바구니</h1>
      <button onClick={() => dispatch(changeName())}>changeName</button>
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>#</th>
            <th>상품명</th>
            <th>수량</th>
            <th>변경하기</th>
          </tr>
        </thead>
        <tbody>
          {state.cart.map((item, i) => (
            <tr key={i}>
              <td>{state.cart[i].id}</td>
              <td>{state.cart[i].name}</td>
              <td>{state.cart[i].count}</td>
              <td>
                <button className="btn btn-dark" onClick={() => dispatch(changeCnt())}>+</button>
                <button className="btn btn-dark"></button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </div>
  );
}

export default Cart;