# 📚 Day33_221007

Author: 고범종
Created Time: 2022년 10월 11일 오전 10:13
Status: 🖨 Published
Tags: 데이터 모델링
Updated Time: 2022년 10월 11일 오후 9:16

# 1. 데이터모델링

- 속성

속성 정의시 고려사항

파생된 값은 실제 성능을 위해서 사용되기도 하지만, 이런 값의 중복은 나중에 심각한 무결성 문제를 발생할 수 있으므로 조심해서 사용

- 도메인 지정

엔티티 내 속성에 대한 데이터 타입과 크기, 제약 사항 지정

- 식별자
    
    정의
    식별자란 하나의 엔티티 내에서 각각의 인스턴스를 Unique하게 구분해 낼 수 있는 속성 또는 속성 그룹을 말함
    
    - 후보식별자: 하나의 엔티티 내에서 식별자로 사용할 수 있는것
    - 주 식별자:
    
    - 내부식별자: 자신의 엔티티 내에서 스스로 생성되어 존재하는 식별자
    - 외부식별자: 다른 엔티티로부터 관계에 의해 주 식별자 속성을 상속받아 자신의 속성에 포함되는 식별자 (FK를 의미)
        
        
    - 단일식별자: 주식별자의 구성이 한 가지 속성으로 이루어진 경우
    - 복합식별자: 두 개 이상의 속성으로 구성된 경우
    
    (분포도가 좋은 속성은 우선순위가 높다.)
    

- **대리식별자**: 주 식별자의 속성이 복합식별자일 경우 여러 개의 속성을 묶어 하나의 속성으로 만들어 주 식별자로 활용하는 경우

- 관계 정의
    
     
    
    ![https://user-images.githubusercontent.com/92353613/194983247-912391dd-29f5-4c6a-bb0f-adcfd4d00462.png](https://user-images.githubusercontent.com/92353613/194983247-912391dd-29f5-4c6a-bb0f-adcfd4d00462.png)
    
    - 슈퍼타입 서브타입관계
        
        공통 속성을 가지는 슈퍼타입과, 고옽ㅇ 부분을 제외하고 두 개 이상의 엔티티 간의 속성에 차이가 있을 때 별도의 서브타입으로 존재
        
    - 배타적 관계: 슈퍼타입의 엔티티가 반드시 하나의 서브타입에는 속하는 관계
    - 포함 관계: 슈퍼타입의 엔티티가 두 개 이상의 서브타입에 포함될 수 있는 관계
    
    ---
    
    ---
    
    # 2. CSS
    
    ## 1. ****어트리뷰트 셀렉터 (Attribute Selector)****
    
    ## 2. Position 속성
    
    - static: position 속성을 부여하지 않았을 때 가지는 디폴드 값
    - relative: 현재 위치에서 상대적인 offset 속성을 줄 수 있다.
    - absolute: 부모 중에 static이 아닌 요소의 위치를 기준으로 상대적인 offset 속성을 줄 수 있다. 하지만 현재 위치가 변하는 것은 아니다.
    - fixed: 브라우저에 대해서 위치를 잡는다. 스크롤에 영향을 받지 않고 고정된 위치를 가짐.
    
    ### static
    
    ![https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile29.uf.tistory.com%2Fimage%2F23336C4F593969D52CA96C](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile29.uf.tistory.com%2Fimage%2F23336C4F593969D52CA96C)
    
    ### relative
    
    ![https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F2666384B59396B0D316F71](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F2666384B59396B0D316F71)
    
    ### absolute
    
    ![https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile7.uf.tistory.com%2Fimage%2F2149714B59396EF31D07FB](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile7.uf.tistory.com%2Fimage%2F2149714B59396EF31D07FB)
    
    ### fixed
    
    ![https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile9.uf.tistory.com%2Fimage%2F2721875059397C4A30130D](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile9.uf.tistory.com%2Fimage%2F2721875059397C4A30130D)