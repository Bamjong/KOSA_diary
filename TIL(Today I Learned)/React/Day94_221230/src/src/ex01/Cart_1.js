import { Table } from "react-bootstrap";
import { useSelector } from "react-redux";

function Cart() {

    // let value = useSelector((state)=>{ return state})
    let value = useSelector((state)=> state.peple)
    console.log(value);


    return(
    <div>
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
                <tr>
                    <td>1</td>
                    <td>Red Knit</td>
                    <td>1</td>
                    <td>1</td>
                </tr>
            </tbody>
        </Table>
    </div>
    )
  }

export default Cart;