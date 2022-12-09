# 📚 Day79_221209

Author: 고범종
Created Time: 2022년 12월 9일 오후 2:05
Status: 🖨 Published
Updated Time: 2022년 12월 9일 오후 2:17

# 1. AOP

Aspect-Oriented Programming(관점 지향 프로그래밍)

**스프링 DI 가 의존성(new) 에 대한 주입이라면
스프링 AOP 는 로직(code) 주입이라고 볼 수 있습니다.**

[https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fdthumb-phinf.pstatic.net%2F%3Fsrc%3D%2522http%253A%252F%252Fcfile27.uf.tistory.com%252Fimage%252F0311115050FE424A37319F%2522%26amp%3Btype%3Dcafe_wa740%22&type=cafe_wa740](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fdthumb-phinf.pstatic.net%2F%3Fsrc%3D%2522http%253A%252F%252Fcfile27.uf.tistory.com%252Fimage%252F0311115050FE424A37319F%2522%26amp%3Btype%3Dcafe_wa740%22&type=cafe_wa740)

- **보조 업무(cross-cutting concern)** : 주 업무 실행 시 발생하는 보조적인 업무. 주 업무와 분리 및 결합이 쉽게 될 수 있도록 만들어야 한다.
- **주 업무(core concern, primary concern)** : 핵심적인 기능을 수행하는 부분. 사용자의 요청에 대한 기본적인 수행 및 결과 반환을 수행해야 한다.
- **Advice** : 언제 어떤 공통 관심 기능(보조 업무)을 적용할지 결정하는 방법. 순서에 따라 세 가지로 나뉜다.
    - Before Advice : 보조 업무가 주 업무 실행 전에 수행되는 경우
    - After Advice : 보조 업무가 주 업무 실행 후에 수행되는 경우
    - Around Advice : 보조 업무가 주 업무 실행 전과 후에 수행되는 경우
- **Proxy** : 주 업무를 실행하는 객체와 동일한 모양을 가진 **가짜 객체**. 사용자가 주 업무를 실행하는 객체를 찾아가는 것이 아닌, proxy를 찾아가도록 지정하게 된다. proxy 내부에서 보조 업무를 실행한 후, 주 업무를 호출하도록 하면 외부에서 볼 때, 주 업무를 실행하는 것과 같은 결과가 나오도록 할 수 있다.
- **JoinPoint** : proxy 내부에서 주 업무를 호출하는 경우에 특정 지점에만 호출되도록 할 수 있다.
- **Weaving** : advice를 주 업무에 적용하는 과정을 부르는 명칭
- **Aspect** : 여러 주 업무 객체에 공통적으로 적용되는 공통 관심 사항(보조 업무)을 aspect 라고 한다.**(보조 업무 == cross-cutting concern == aspect == 공통 관심 사항 == 공통 업무)**

## **프록시의 호출 및 처리 순서**

1) Proxy 호출

2) 보조 업무 처리

3) Proxy 처리 함수(메서드) 가 실제 구현 함수(메서드) 호출 및 주 업무 처리

4) 제어권이 다시 Proxy 함수(메서드)로 넘어오고 나머지 보조 업무 처리

5) 처리 작업 완료 후, 호출 함수(메서드)로 반환.