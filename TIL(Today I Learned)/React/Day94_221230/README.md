# ๐ **Day94_221230**

# 1. Redux

![https://user-images.githubusercontent.com/92353613/210025720-e69c9595-01b4-4b8d-bc81-4e6a84ae0e47.png](https://user-images.githubusercontent.com/92353613/210025720-e69c9595-01b4-4b8d-bc81-4e6a84ae0e47.png)

์ค์น)

```jsx
npm install @reduxjs/toolkit react-redux
```

### ์ฌ์ฉ๋ฒ)

jsํ์ผ ์์ฑ

```jsx
import { configureStore } from "../node_modules/@reduxjs/toolkit/dist/configureStore";
import { createSlice } from "../node_modules/@reduxjs/toolkit/dist/createSlice";

// createSlice( {  
//     name :  ๋ณ์ ์ด๋ฆ,
//     initialState : ์ด๊ธฐ๊ฐ
//  } )

// export default configureStore({
//     reducer : {
//    ์ํ๋ณ์ ๋ฑ๋กํ๋ ๋ถ๋ถ
//     }
// })

//{name : 'state Name', initialState : 'state value'}
let user = createSlice({
    name : 'user',
    initialState : 'jw'
})

let people = createSlice({
    name : 'people',
    initialState : 200
})

export default configureStore({ //์ํ๋ณ์ ๋ฑ๋กํ๋ ๋ถ๋ถ
    reducer : {
        user : user.reducer,
        people : people.reducer
    
    }

})
```

- let user,people ์ ์์ฑํด์ค ํ configureStore์์ reducer ํด์ค๋ค

์ดํ ๋ค๋ฅธ๊ณณ์์ ์ฌ์ฉํ ๋ ค๋ฉด?

```jsx
function Cart(){

    let value = useSelector((state)={ return state})
    

    return(
        <>
        </>
    )
}
```

- ์์๊ฐ์ด useSelector์ ์ธ ํด์ค ํ ์์ฑํ๋ฉด reducer์ ์์ฑํ๊ฑธ ๊ฐ์ ธ์ฌ ์ ์๋ค.

๋ค์ํ ๋ฐฉ์

```jsa
let user = createSlice({
    name : 'user',
    initialState : 'yuna'     // user='yuna'
})
let peple = createSlice({
    name : 'peple',
    initialState : 200    // peple = 200
})
let stock = createSlice({
    name : 'stock',
    initialState : [7,13,20]    // stock = [7,13,20]
})
let cart = createSlice({
    name : 'cart',
    initialState :
    [   // cart = [{},{}]
        { id : 0, name : "Black and White", count: 2},
        { id : 0, name : "Red Knit", count: 1}
    ]
})
```