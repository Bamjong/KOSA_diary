# ๐ Day76_221206

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 12์ 6์ผ ์ค์  9:30
Status: ๐จ Published
Tags: Java, Spring
Updated Time: 2022๋ 12์ 6์ผ ์คํ 11:51

# 1. Spring

## ์คํ๋ง ์ฌ์ฉ๋ฒ!

์คํ๋ง์ ํ์ํ ๋ผ์ด๋ธ๋ฌ๋ฆฌ ํ์

- beans
- core
- context
- expression

---

1. ๋ด๊ฐ ํ์ํ ํด๋์ค๋ฅผ ์ค๊ณํ๋ค
2. ์คํ๋ง์ํ์ํ ๊ฐ์ฒด๋ค์ด ํ์ํ ์ค์ 
    - xml ํ์ผ ์ค์  (DIConfig.xml)
    - annotation ์ค์ 
3. xml ํ์ผ์ bean ๋ง๋ค๊ณ  ํ์ํ๊ณณ์์ getBean์ผ๋ก ๊ฐ์ ธ์ค๊ธฐ

---

## ๊ฒฐ๋ก ) ๊ฐ๋ฐ์๊ฐ NEW๋ฅผ ํ์ง ์๊ณ  ์์ฑ์๊ฐ ๊บผ๋ด์ ์ฐ๋ ๋ฐฉ์!

```
๊ธฐ์กด)
์ด๋ค ๊ฐ์ฒด๊ฐ ํ์ํ๋ฉด ์ง์ 
Emp emp = enw Emp() ์ฌ์ฉ

์คํ๋ง)
xml ๋๋ annotation์ ํตํด์ ๋ฏธ๋ฆฌ ๊ฐ์ฒด๋ฅผ ์์ฑํด ๋๊ณ  ์ฌ์ฉํ๊ธฐ

>> ๋ฏธ๋ฆฌ ๋ชจ๋  ๋ถํ์ ๋ง๋ค๊ณ  ๋๊ณ  ์กฐ๋ฆฝ๋ง ํด๋ผ ๊ทธ๋ฆฌ๊ณ  ์ฌ์ฉํด๋ผ (์คํ๋ง)
```

์ฌ์ง์ผ๋ก ๋ณด๋ ์์!

1. ๋จผ์  ๊ฐ์ฒด๋ฅผ ํ๋ ๋ง๋ฌ

![https://user-images.githubusercontent.com/92353613/205787039-7adae32b-43b2-47c0-84e8-1b6085924de3.png](https://user-images.githubusercontent.com/92353613/205787039-7adae32b-43b2-47c0-84e8-1b6085924de3.png)

1. DI.xml ํ์ผ์ ๋ง๋ค์ด์ ์ฌ๋ฆผ

![https://user-images.githubusercontent.com/92353613/205787126-b40f4713-f0b3-4e27-9375-7a633222545a.png](https://user-images.githubusercontent.com/92353613/205787126-b40f4713-f0b3-4e27-9375-7a633222545a.png)

1. ์ดํ ๋ฉ์ธ์์ ์ ๋ฐ์์ผ๋ก ๋ถ๋ฌ์ค๋ฉด ok!

![https://user-images.githubusercontent.com/92353613/205787177-1819cd00-2d66-4c5e-a6e2-6edf808cb452.png](https://user-images.githubusercontent.com/92353613/205787177-1819cd00-2d66-4c5e-a6e2-6edf808cb452.png)

---

## xmlํ์ผ ์ค์ ํ๊ธฐ

![https://user-images.githubusercontent.com/92353613/205789376-a28c8b21-437d-4a38-a407-510cc2c544db.png](https://user-images.githubusercontent.com/92353613/205789376-a28c8b21-437d-4a38-a407-510cc2c544db.png)

- ์์๊ฐ์ด ๊ฐ์ ๋ฃ์ด์ฃผ๋ ํ์ผ์ธ xml์ ๋ง๋ค์ด์ค๋

![https://user-images.githubusercontent.com/92353613/205791445-6268bd82-b88b-4fbc-98b8-5e7093ff46df.png](https://user-images.githubusercontent.com/92353613/205791445-6268bd82-b88b-4fbc-98b8-5e7093ff46df.png)

```xml
greeting์ value๋ฅผ ๋ฃ์ด์ค์ผํ๋ฏ๋ก ์ ์ฌ์ง ๋งจ ์๋์ ๊ฐ์ด ํด์ค

<constructor-arg value="hong" />
<property name="greeting" value="hello"/>
```

![https://user-images.githubusercontent.com/92353613/205792748-494ace22-0e2f-42fe-b516-20c6cd99c2e7.png](https://user-images.githubusercontent.com/92353613/205792748-494ace22-0e2f-42fe-b516-20c6cd99c2e7.png)

```xml
์ดํ Main๋ฌธ์์

์ ์ฌ์ง๊ณผ ๊ฐ์ด ApplicationContext๋ก ๋ถ๋ฌ์จ ํ
getBean์ ํตํด ๋ถ๋ฌ์ค๊ธฐ
```

# 2. getBean

```java
ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_05_Spring/DI_05.xml");
		MyBean m = context.getBean("mybean", MyBean.class);
		MyBean m2 = context.getBean("mybean", MyBean.class);
		MyBean m3 = context.getBean("mybean", MyBean.class);

๊ทธ๋ ๊ธฐ์ ์ ์ฝ๋ m,m2,m3๋ ์ฃผ์๊ฐ ๊ฐ๋ค
```

1. ์ปจํ์ด๋ ์์ ์๋ ๊ฐ์ฒด๋ฅผ ๋ฆฌํด (new๊ฐ ์๋์์)
2. return type Object (ํ์์ ๋ง๋ casting)
3. **์คํ๋ฆผ ์ปจํ์ด๋ ์์ ๊ฐ์ฒด๋ค์ default singleton
4. **์์ธ์ ์ผ๋ก getbean() ์ค์ ์ ๋ฐ๊พธ๋ฉด new ํ  ์ ์์ง๋ง 99% ์ฌ์ฉํ์ง ์์

# 3. IOC/DI

## IOC)

IOC ์ปจํ์ด๋ (์ ์ด์ ์ญ์ )
๋ด๊ฐ ์ฃผ๋ํ๋ ์ฝ๋์์ Spring ์ด ์ฃผ์ฒด .....

- ์์ ๋จ์์ ๋ถํ์ ๋ง๋ค๊ณ  ๋๊ณ  ๊ทธ ๊ฒ์ ์กฐ๋ฆฝํ๋ ํ์ (๋ ๊ณ ๋ธ๋ญ)

## DI)

[DI๊ฐ๋]_1 : ์์กด์ฑ ์ฃผ์ (์์กด ๊ฐ์ฒด ์ฃผ์)

xml ์ค์ ์์ ํ์์ ๋ช์ํ์ง ์์ ๊ฐ์: ๋ฌธ์์ด

```java
๊ธฐ์กด)
์ด๋ค ๊ฐ์ฒด๊ฐ ํ์ํ๋ฉด ์ง์ 
Emp emp = enw Emp() ์ฌ์ฉ

์คํ๋ง)
xml ๋๋ annotation์ ํตํด์ ๋ฏธ๋ฆฌ ๊ฐ์ฒด๋ฅผ ์์ฑํด ๋๊ณ  ์ฌ์ฉํ๊ธฐ

>> ๋ฏธ๋ฆฌ ๋ชจ๋  ๋ถํ์ ๋ง๋ค๊ณ  ๋๊ณ  ์กฐ๋ฆฝ๋ง ํด๋ผ ๊ทธ๋ฆฌ๊ณ  ์ฌ์ฉํด๋ผ (์คํ๋ง)
```

# 4. Lombok

@getter/setter ๋ฑ์ ์๋ ฅํ๊ณ  ์ปจํธ๋กค + ์คํ์ด์ค๋ฐ๋ฅผ ๋๋ฌ ์ ์ฉํ๋ค.

@Data๋ฅผ ์ฐ๋ฉด getter/setter toString ๋ฑ๋ฑ ๋ค ์ค์ ์ ํด์ค๋ค.

# 5. Annotation

Annotation ์ฌ์ฉ์ ํ์ํ ๋ชจ๋  ํด๋์ค๋ฅผ ํ๋ฐฉ์ ๊ฐ์ฒด๋ก ๋ง๋ค์ด์ ์ปจํ์ด๋์ ์ฌ๋ ค ์ฃผ๋ ์ญํ 

- ์ฅ์  : ๊ฐ๊ฐ์ Annotation ์ฌ์ฉ์ ๋ณ๋์ ๋น๊ฐ์ฒด ์ค๋ช ํ  ํ์ ์๋ค.
- ๋จ์  : ์ฌ์ฉํ์ง ์๋ bean ์๋ ์์ฑ ๋๋ค

<context:annotation-config />๋ฅผ ๋งจ ์์ ์ค์ ํด์ค์ผ์ง @Autowired๊ฐ ์ ์์คํ๋จ

๊ทธ๋ ๊ธฐ์ ์ฃผ์์ด ์๋์ null์ด ๋์ค๋ ๊ฒฝ์ฐ ํ๋ฒ ์ฒดํฌ ํด๋ด์ผํจ

### @Autowired ์ ์ ๋์ ๋์ง ์๋ ๊ฒฝ์ฐ

1. injection ๋๋ ํ์ ๊ฐ์ฒด๊ฐ (bean) IOC ์ปจํ์ด๋ ์์ ์๋ ๊ฒฝ์ฐ
2. IOC ์ปจํ์ด๋ ์์ ๊ฐ์ ํ์์ ๊ฐ์ฒด ์ฌ๋ฌ๊ฐ ์กด์ฌํ๋ ๊ฒฝ์ฐ
<bean id="a" class="DI_Annotation_01.Recorder"></bean>
<bean id="b" class="DI_Annotation_01.Recorder"></bean>
<bean id="c" class="DI_Annotation_01.Recorder"></bean>
3. IOC ์ปจํ์ด๋ ์์ ๊ฐ์ ํ์์ ๊ฐ์ฒด ์ฌ๋ฌ๊ฐ ์กด์ฌํ๋๋ผ๋
bean ๊ฐ์ฒด์ id ๊ฐ์ด setter ํจ์์ parameter ๋ช๊ณผ ๋์ผํ๋ฉด ์๋ ์ฃผ์ ์ฑ๊ณต