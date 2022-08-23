# 2022년 8월 23일 요일
<br>

### 1. Git 기본 개념
---

![이미지링크](https://t1.daumcdn.net/cfile/tistory/993CCF4B5F17C75211)

#### Git 구조

    Git은 내 컴퓨터에서만 운영해도 되지만 거의 99%는 원격서버와 같이 연계해서 협업을 하며 사용합니다. 

    Github, Gitlab은 원격 저장소(Remote Repository)로써 동기화가 된 상태라고 가정했을 때, 로컬 저장소(Local Repository)와 동일한
    내용을 가지고 있습니다. 

    Git을 운영하는 순서는 여러가지가 있겠지만 가장 많이 사용하는 것은 원격저장소의 파일을 로컬로 다운로드받아서 작업 후 다시 업로드 하는 식으로
    많이 하므로 그 순서를 기준으로 설명하겠습니다. 


### 2. 클래스의 기본 구성 요소
---

![이미지링크](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fdthumb-phinf.pstatic.net%2F%3Fsrc%3D%2522https%253A%252F%252Fcafeptthumb-phinf.pstatic.net%252FMjAxNzA3MjZfMjgw%252FMDAxNTAxMDYyNzM1OTkz.9P-EK-45WNIQrV3kFXILTTXbUO2HLn4q7t8oc5z4GE4g.-p_yN_vSxIqVqoI1VM6_7KcXUXQ5rLLWsdX0CqkcHIEg.PNG.i7027%252F%2525ED%252581%2525B4%2525EB%25259E%252598%2525EC%25258A%2525A4_%2525EA%2525B5%2525AC%2525EC%252584%2525B1_%2525EB%2525A9%2525A4%2525EB%2525B2%252584.PNG%253Ftype%253Dw740%2522%26amp%3Btype%3Dcafe_wa740%22&type=cafe_wa800)

![이미지링크](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fdthumb-phinf.pstatic.net%2F%3Fsrc%3D%2522https%253A%252F%252Fcafeptthumb-phinf.pstatic.net%252FMjAxNzA3MjZfMTc2%252FMDAxNTAxMDYyNzM2MTMy.wvZ8Vf80Xh0JARlkx7fP-_WzWzYoWmcobhN4jQb6pO4g.xWwfvLGzA9KEIIQNREAIlzOJbsZ-6BFvmf7vK_gLW3Ug.PNG.i7027%252F%2525ED%252595%252584%2525EB%252593%25259C_%2525EA%2525B5%2525AC%2525EC%252584%2525B1.PNG%253Ftype%253Dw740%2522%26amp%3Btype%3Dcafe_wa740%22&type=cafe_wa800)