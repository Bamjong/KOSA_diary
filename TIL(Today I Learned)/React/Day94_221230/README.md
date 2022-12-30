# 📚 **Day94_221230**

# 1. Redux

![https://user-images.githubusercontent.com/92353613/210025720-e69c9595-01b4-4b8d-bc81-4e6a84ae0e47.png](https://user-images.githubusercontent.com/92353613/210025720-e69c9595-01b4-4b8d-bc81-4e6a84ae0e47.png)

설치)

```jsx
npm install @reduxjs/toolkit react-redux
```

### 사용법)

js파일 생성

```jsx
import { configureStore } from "../node_modules/@reduxjs/toolkit/dist/configureStore";
import { createSlice } from "../node_modules/@reduxjs/toolkit/dist/createSlice";

// createSlice( {  
//     name :  변수 이름,
//     initialState : 초기값
//  } )

// export default configureStore({
//     reducer : {
//    상태변수 등록하는 부분
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

export default configureStore({ //상태변수 등록하는 부분
    reducer : {
        user : user.reducer,
        people : people.reducer
    
    }

})
```

- let user,people 을 생성해준 후 configureStore에서 reducer 해준다

이후 다른곳에서 사용할려면?

```jsx
function Cart(){

    let value = useSelector((state)={ return state})
    

    return(
        <>
        </>
    )
}
```

- 위와같이 useSelector선언 해준 후 작성하면 reducer에 작성한걸 가져올 수 있다.

다양한 방식

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