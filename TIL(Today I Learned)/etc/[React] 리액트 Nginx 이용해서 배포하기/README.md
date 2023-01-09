# [React] 리액트 Nginx 이용해서 배포하기

# Nginx(엔진엑스)

- Java 서블릿은 대게 Tomcat을 연동해서 구동한다면
React는 대게 Nginx를 이용해 구동한다.

---

# 다운방법

### 1. nginx 다운로드

[nginx: download](http://nginx.org/en/download.html)

- 위 사이트에 들어가 Stable version을 다운받는다.

```
Tip)

**Stable Version** 은 최종 버전 중에서 테스트가 완료되고 버그가 수정된 안정된 버전이다.

**Legacy Version** 은 아직 사용이 가능한 예전 버전이다. 최신 버전에서 새로 생긴 기능들은 제공되지 않지만 아직까지 최신 환경에서 사용하기에 문제가 없는 버전을 가리킨다.
```

### 2. 포트설정

압축을 풀면 conf → **nginx.conf** 파일이 있을 것 이다.

위 파일을 열고 아래로 조금만 내려다 보면 아래와 같이 작성된 칸이 있다.

![https://user-images.githubusercontent.com/92353613/211353324-ea75f899-6711-430c-8b4e-8924b1484e74.png](https://user-images.githubusercontent.com/92353613/211353324-ea75f899-6711-430c-8b4e-8924b1484e74.png)

- listen: nginx를 실행하였을때 열리는 포트번호를 지정할 수 있다.
- root: 사용자가 원하는 배포파일의 경로를 지정할 수 있다.
- index: root 마지막 경로에서 index.html or index.htm 파일을 찾아 실행시킨다.

### 3. 실행

이후 nginx.exe 파일을 실행 후 위와같은 사진 기준으로 [http://localhost:4000](http://localhost:4000) 으로 들어가면 접속 할 수 있다.

조심!)

‘************nginx.exe’************ 파일이 안 열린다고 계속 누르게 되면 작업관리자에선 계속 무한대로 증식(?)하니 조심할 것.

아래와같은 대참사가 발생…

![https://user-images.githubusercontent.com/92353613/211352437-d677affb-c838-4a65-869c-b5658a2b3268.png](https://user-images.githubusercontent.com/92353613/211352437-d677affb-c838-4a65-869c-b5658a2b3268.png)