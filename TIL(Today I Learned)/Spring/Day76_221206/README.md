# 📚 Day76_221206

Author: 고범종
Created Time: 2022년 12월 6일 오전 9:30
Status: 🖨 Published
Tags: Java, Spring
Updated Time: 2022년 12월 6일 오후 11:51

# 1. Spring

## 스프링 사용법!

스프링에 필요한 라이브러리 필요

- beans
- core
- context
- expression

---

1. 내가 필요한 클래스를 설계한다
2. 스프링에필요한 객체들이 필요한 설정
    - xml 파일 설정 (DIConfig.xml)
    - annotation 설정
3. xml 파일에 bean 만들고 필요한곳에서 getBean으로 가져오기

---

## 결론) 개발자가 NEW를 하지 않고 생성자가 꺼내서 쓰는 방식!

```
기존)
어떤 객체가 필요하면 직접
Emp emp = enw Emp() 사용

스프링)
xml 또는 annotation을 통해서 미리 객체를 생성해 놓고 사용하기

>> 미리 모든 부품을 만들고 놓고 조립만 해라 그리고 사용해라 (스프링)
```

사진으로 보는 순서!

1. 먼저 객체를 하나 만듬

![https://user-images.githubusercontent.com/92353613/205787039-7adae32b-43b2-47c0-84e8-1b6085924de3.png](https://user-images.githubusercontent.com/92353613/205787039-7adae32b-43b2-47c0-84e8-1b6085924de3.png)

1. DI.xml 파일을 만들어서 올림

![https://user-images.githubusercontent.com/92353613/205787126-b40f4713-f0b3-4e27-9375-7a633222545a.png](https://user-images.githubusercontent.com/92353613/205787126-b40f4713-f0b3-4e27-9375-7a633222545a.png)

1. 이후 메인에서 저런식으로 불러오면 ok!

![https://user-images.githubusercontent.com/92353613/205787177-1819cd00-2d66-4c5e-a6e2-6edf808cb452.png](https://user-images.githubusercontent.com/92353613/205787177-1819cd00-2d66-4c5e-a6e2-6edf808cb452.png)

---

## xml파일 설정하기

![https://user-images.githubusercontent.com/92353613/205789376-a28c8b21-437d-4a38-a407-510cc2c544db.png](https://user-images.githubusercontent.com/92353613/205789376-a28c8b21-437d-4a38-a407-510cc2c544db.png)

- 위와같이 값을 넣어주는 파일인 xml을 만들어줄때

![https://user-images.githubusercontent.com/92353613/205791445-6268bd82-b88b-4fbc-98b8-5e7093ff46df.png](https://user-images.githubusercontent.com/92353613/205791445-6268bd82-b88b-4fbc-98b8-5e7093ff46df.png)

```xml
greeting에 value를 넣어줘야하므로 위 사진 맨 아래와 같이 해줌

<constructor-arg value="hong" />
<property name="greeting" value="hello"/>
```

![https://user-images.githubusercontent.com/92353613/205792748-494ace22-0e2f-42fe-b516-20c6cd99c2e7.png](https://user-images.githubusercontent.com/92353613/205792748-494ace22-0e2f-42fe-b516-20c6cd99c2e7.png)

```xml
이후 Main문에서

위 사진과 같이 ApplicationContext로 불러온 후
getBean을 통해 불러오기
```

# 2. getBean

```java
ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_05_Spring/DI_05.xml");
		MyBean m = context.getBean("mybean", MyBean.class);
		MyBean m2 = context.getBean("mybean", MyBean.class);
		MyBean m3 = context.getBean("mybean", MyBean.class);

그렇기에 위 코드 m,m2,m3는 주소가 같다
```

1. 컨테이너 안에 있는 객체를 리턴 (new가 아니에요)
2. return type Object (타입에 맞는 casting)
3. **스프림 컨테이너 안에 객체들은 default singleton
4. **예외적으로 getbean() 설정을 바꾸면 new 할 수 있지만 99% 사용하지 않음

# 3. IOC/DI

## IOC)

IOC 컨테이너 (제어의 역전)
내가 주도했던 코드에서 Spring 이 주체 .....

- 작은 단위의 부품을 만들고 놓고 그 것을 조립하는 행위 (레고블럭)

## DI)

[DI개념]_1 : 의존성 주입 (의존 객체 주입)

xml 설정에서 타입을 명시하지 않은 값은: 문자열

```java
기존)
어떤 객체가 필요하면 직접
Emp emp = enw Emp() 사용

스프링)
xml 또는 annotation을 통해서 미리 객체를 생성해 놓고 사용하기

>> 미리 모든 부품을 만들고 놓고 조립만 해라 그리고 사용해라 (스프링)
```

# 4. Lombok

@getter/setter 등을 입력하고 컨트롤 + 스페이스바를 눌러 적용한다.

@Data를 쓰면 getter/setter toString 등등 다 설정을 해준다.

# 5. Annotation

Annotation 사용에 필요한 모든 클래스를 한방에 객체로 만들어서 컨테이너에 올려 주는 역할

- 장점 : 각각의 Annotation 사용시 별도의 빈객체 설명 할 필요 없다.
- 단점 : 사용하지 않는 bean 자동 생성 된다

<context:annotation-config />를 맨 위에 설정해줘야지 @Autowired가 정상실행됨

그렇기에 주입이 안되서 null이 나오는 경우 한번 체크 해봐야함

### @Autowired 정상 동작 되지 않는 경우

1. injection 되는 타입 객체가 (bean) IOC 컨테이너 안에 없는 경우
2. IOC 컨테이너 안에 같은 타입의 객체 여러개 존재하는 경우
<bean id="a" class="DI_Annotation_01.Recorder"></bean>
<bean id="b" class="DI_Annotation_01.Recorder"></bean>
<bean id="c" class="DI_Annotation_01.Recorder"></bean>
3. IOC 컨테이너 안에 같은 타입의 객체 여러개 존재하더라도
bean 객체의 id 값이 setter 함수의 parameter 명과 동일하면 자동 주입 성공