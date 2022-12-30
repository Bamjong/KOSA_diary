import {configureStore, createSlice} from "@reduxjs/toolkit";

//{ name : 'state Name', initialState : 'state Value'}
let user =  createSlice( {  
        name :  'user',
        initialState : 'yunasss',
        reducers: {
            changeName(state){
                return 'doteon ' + state;
            }
        }
})

export let {changeName} = user.actions;

let stock =  createSlice( {  
    name :  'stock',
    initialState : [7,14,20]
})

let cart = createSlice({
    name : 'cart',
    initialState : [
        {
           id : 0, name : "NM HAIRY BEANIE", count: 2
          
        },
        {
           id : 1, name : "FLARE Knit Beanie", count: 1
        }
    ],
    reducer: {
        changeCnt(state){
            return state.count++;
        }
    }

})
export let {changeCnt} = cart.actions;

export default configureStore({ //상태변수 등록하는 부분
    reducer: {
        user :user.reducer,
        stock : stock.reducer,
        cart : cart.reducer
    }
})




// export default configureStore({
//     reducer : {
// 	상태변수 등록하는 부분
//     }
// })
