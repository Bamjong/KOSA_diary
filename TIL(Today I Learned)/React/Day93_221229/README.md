# 📚 **Day93_221229**

# 1. Ajax

> 비동기 통신(ajax)

1.  XMLHttpRequest
2. fetch()
3. axios  <--- 외부라이브러리

## Axios 사용하기

설치)

```jsx
npm install axios
```

사용 1)

```jsx
<button onClick={() => {
        axios.get()
				.then()
				.catch()
    }}
```

- get(): Json과 같은 객체 가져오기
- then(): 제대로 실행되었을 경우 실행할것
- catch(): 안됐을경우 실행할것

사용 1) 예시