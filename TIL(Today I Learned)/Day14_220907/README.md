# 2022년 9월 7일 수요일
<br>


## 1. UML(Unified Modeling Language)    (*06_Ex01_abstract_class 01~02)

### UML이란
    Unified Modeling Language의 약자로 1997년 OMG(Object Management Group)에서 표준으로 채택한 통합모델링언어 입니다.
    즉, 모델을 만드는 표준언어인 것입니다.

 
![이미지](https://www.nextree.co.kr/content/images/2021/01/--1-UML---.png)

### ***기업***에서 다이어그램 쓰는 순위

    1. 클래스 다이어그램
    2. 유스케이스 다이어그램
    3. 시퀸스 다이어그램
    4. 엑티비티 다이어그램

### 클래스 다이어그램

![이미지](https://www.nextree.co.kr/content/images/2021/01/--3----.png)
#### 클래스 다이어그램의 요소(Element)
    클래스는 보통 3개의 compartment(구획)으로 나누어 클래스의 이름, 속성, 기능을 표기합니다.
    속성과 기능은 옵션으로 생략이 가능하지만 이름은 필수로 명시해야 합니다.
    
![이미지](https://gmlwjd9405.github.io/images/class-diagram/access-controller.png)

    왼쪽 -(하이픈) = private
    파랑색: public
    
 
![이미지](https://www.nextree.co.kr/content/images/2021/01/--4--------.png)
#### Stereo Type (스테레오 타입)
    스테레오 타입이란 UML에서 제공하는 기본 요소 외에 추가적인 확장요소를 나타내는 것으로 쌍 꺾쇠와 비슷하게 생긴 길러멧(guillemet, « ») 사이에 적습니다.

    빨간줄 + 밑줄 = public static final 
    파란색 + 밑줄 = public static

    밑줄 = static

![이미지](https://www.nextree.co.kr/content/images/2021/01/--5------.png)
#### Abstract Class/Method (추상 클래스 / 메서드)
    추상클래스란 1개 이상의 메서드가 구현체가 없고 명세만 존재하는 클래스를 말합니다.

    추상클래스 작성법

![이미지](https://www.nextree.co.kr/content/images/2021/01/--6-----------.png)
#### 클래스간의 관계 표현법
    클래스 다이어그램의 주 목적은 클래스간의 관계를 한눈에 쉽게 보고 의존 관계를 파악하는 것에 있습니다.
    그렇기 때문에 클래스 다이어그램에서 가장 중요한 것이 클래스간의 관계입니다.

![이미지](https://www.nextree.co.kr/content/images/2021/01/--7-Generalization1.png)
#### Generalization (일반화)
    Generalization은 슈퍼(부모)클래스와 서브(자식)클래스간의 Inheritance(상속) 관계를 나타냅니다.

    이미지에서 login()이 Customer Admin 에서 위로 가니까 User에도 기입이 되어있다.
    이는 login()을 재정의 해야한다는 뜻이다.

![이미지](https://www.nextree.co.kr/content/images/2021/01/--8-Realization.png)

#### Realization(실체화)
    interface의 spec(명세, 정의)만 있는 메서드를 오버라이딩 하여 실제 기능으로 구현 하는 것을 말합니다.


    인터페이스 부분은 정의가 하나도 안되어있으니 실체화를 하여 재정의 하라는 뜻이다.

![이미지](https://www.nextree.co.kr/content/images/2021/01/--9-Dependency.png)

#### Dependency(의존)
    Dependency는 클래스 다이어그램에서 일반적으로 제일 많이 사용되는 관계로서, 어떤 클래스가 다른 클래스를 참조하는 것을 말합니다.

    유저는 스케쥴에 의존합니다
    어디서?
    함수 내에서.

나머지는 [이곳](https://www.nextree.co.kr/p6753/)에서 자세히 살펴보도록 하자.

<Br><br><br>

### UseCase(유스케이스)

    시스템에서 제공해야하는 기능이나 서비스를 명세하는 단계로 상용자와 시스템 사이의 상호작용을 보여준다.

1) 외부사용자(External entity)를 찾아낸다. 사용자를 역할에 따라 동질성 있는 집단으로 분류하여 이를 행위자, 또는 액터(Actor)라고 부른다.

2) 각 행위자는 시스템에 대하여 각기 다른 관점과 용도를 가지며, 이를 유스케이스라 한다. 

3) 각 유스케이스에 대하여 시나리오를 작성한다. 시나리오는 사건의 흐름과 과정을 나타내며 시스템과 행위자들이 주고 받는 정보 뿐만 아니라 상호작용이 발생하는 상황, 환경, 배경등을 포함할 수 있다. 

4) 유스케이스 모델링은 시스템 외부의 모습을 분석하는 도구이다.

5) 유스케이스는 시스템의 최상위 기능에 해당한다.

6) 유스케이스 시나리오는 동적모델링에 해당한다.

7) 유스케이스 기법을 사용하면 다양한 이해관계자를 개발 프로세스에 참여시킬 수 있다. 

<br><br>



예시)

잘한경우
![이미지](https://postfiles.pstatic.net/MjAxNzA1MTBfNTAg/MDAxNDk0MzkxMjEyODQy._X90dmijdHf8463ZjPWEdVo_tcPpNRdsmW11L_hfjxsg.Rl9xV80ED5PgQyuz7C16vysed3yR1xYYik48Ckg9rE0g.PNG.ljh0326s/image.png?type=w966)

못한경우
![이미지](https://postfiles.pstatic.net/MjAxNzA1MTBfMjcg/MDAxNDk0NDEwNDg1NDUx.w-R9u82QuZvpHYyxHypR5Cr6R-TOaqJvELKi_hBf-Qog.myNIt1o4TgS9vhnAXZQeE2bMGLRw8PjlfTtxRqa6zHwg.PNG.ljh0326s/image.png?type=w966)

<br><br>
    예시를 보고 내가 느낀건

    시스템 구동, 시스템 종료, 인출, 예금, 계좌조회
    이런건 프론트엔드가

    사용자인증, 트랜잭션
    이런건 백엔드가 구현하는것 이라고 생각하면서
    짜면 좀 더 수월하게 짤 수 있을것이라 생각하게 되었다.
<br><br>

유스케이스 명세서 예제)

![이미지](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fcafeptthumb-phinf.pstatic.net%2FMjAxODAyMDdfMTE3%2FMDAxNTE3OTYwOTYzMTgy.iOQK3yLFduKnGC5_MPdaqLNi5vxJFZel0yDUF3GW1qUg.FJK7iws61WrKI7YGOM-VCxpzR_2mthzqev_v-jCeHLgg.PNG.i7027%2FUseCase_%25EB%25AA%2585%25EC%2584%25B8%25EC%2584%259C_1.PNG%3Ftype%3Dw740%22&type=cafe_wa740)


