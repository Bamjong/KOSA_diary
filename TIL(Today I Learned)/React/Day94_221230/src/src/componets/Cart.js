import { Table } from "react-bootstrap";
import { useDispatch, useSelector } from "react-redux";
import { changeName } from "../store";

function Cart() {

    // let value = useSelector((state)=>{ return state})
    let state = useSelector(state => state.cart)
    console.log(state);
    let dispatch = useDispatch(); // action에 있는 것들 호출해주는

    
  
  return (
    <div>
      <h1>{state.user}님의 장바구니</h1>
      <button onClick={() => dispatch(changeName())}>changeName</button>

        <Table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>변경하기</th>
                </tr>
            </thead>
            <tbody>
                {state.map((el)=>
                <tr>
                    <td>1</td>
                    <td>{el.name}</td>
                    <td>{el.count}</td>
                    <td>
                      <button onClick={()=>{}}>+</button> 
                      <button>-</button>
                      <button>변경</button>
                    </td>
                </tr>
                )}
            </tbody>
        </Table>
    </div>
    )
  }

export default Cart;