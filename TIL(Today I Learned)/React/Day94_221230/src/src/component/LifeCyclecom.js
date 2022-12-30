import { Component } from "react";

class LifeCycleCom extends Component{

    componentDidMount(){
        //컴퍼넌트가 mount 될 때 코드 실행
        
    }
    componentDidUpdate(){
        //컴포너느가 update 될 때 코드 실행ㄹ
    }

    componentDid(){

    }

    //useEffect(()=>{}) //화면에 UI가 재 렌더링되거나 코드 실행
    //useEffect(()=>{}, []) // 마운트될때 화면이 처음 최초에한번 될떄 1회만 실행됨
    //useEffect(()=>{}, [상태변수]) // 상태변수가 작동될 때 실행
    //useEffect(()=>{}, return) //소멸
}