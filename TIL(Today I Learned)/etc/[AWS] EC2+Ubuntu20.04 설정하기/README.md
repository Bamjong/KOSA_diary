[아마존 클라우드 서버 호스팅 | Amazon Web Services](https://aws.amazon.com/ko/ec2/?nc2=type_a)

# 1. 대시보드 열기

![https://user-images.githubusercontent.com/92353613/211993879-cc7decd7-3ec4-4233-909f-72d57586748d.png](https://user-images.githubusercontent.com/92353613/211993879-cc7decd7-3ec4-4233-909f-72d57586748d.png)

- 오른쪽 상단 **인스턴스 시작** 누르기

# 2. 인스턴스 시작

![https://user-images.githubusercontent.com/92353613/211994028-7bd9c8ff-0951-4d19-8878-d91fd49281a7.png](https://user-images.githubusercontent.com/92353613/211994028-7bd9c8ff-0951-4d19-8878-d91fd49281a7.png)

1. 이름 및 태그
    - 본인이 알아볼 수 있는 이름적기
2. 애플리케이션 및 OS 이미지
    - 나는 Ubuntu가 편해서 Ubuntu로함
    - 22/12/22일 기준 22.04LTS 최신버전이지만
    `20.04LTS` 버전이 좀 더 안정적이고 예제도 구글에 많아서 20.04 선택
3. 인스턴스 유형
    - t2.micro가 프리티어에서 가장 좋은(?) 하드웨어 같아서 저걸로함
4. 키 페어(로그인)
    - 아래와 같은 이미지로 설정 후 저장(`RSA`, `.ppk`)
    - 이거 진짜 중요하니 잘 보관하도록
    
    ![https://user-images.githubusercontent.com/92353613/211994099-96c1d522-4db3-49a1-9912-c6aaf9221b11.png](https://user-images.githubusercontent.com/92353613/211994099-96c1d522-4db3-49a1-9912-c6aaf9221b11.png)
    

# 3. 네트워크 설정

![https://user-images.githubusercontent.com/92353613/211994162-db7cf038-b644-47c8-9d69-6091c975abcf.png](https://user-images.githubusercontent.com/92353613/211994162-db7cf038-b644-47c8-9d69-6091c975abcf.png)

1. 그냥 만진거 없고 위 사진과 동일하게 패스

# 4. 인스턴스 완료

![https://user-images.githubusercontent.com/92353613/211994237-829f3681-3c5a-478e-b9b3-34205685f107.png](https://user-images.githubusercontent.com/92353613/211994237-829f3681-3c5a-478e-b9b3-34205685f107.png)

- 만진거 없이 바로 인스턴스 시작 누르면됨
- 완성!

---

이후에 Putty를 이용해 접속하는것과
탄력적IP를 이용해 EC2의 IP를 고정하는걸 작성하겠습니다

# 탄력적IP

![https://user-images.githubusercontent.com/92353613/211994299-33acb0c4-e3e0-4126-ae15-a97ef5c9a6ab.png](https://user-images.githubusercontent.com/92353613/211994299-33acb0c4-e3e0-4126-ae15-a97ef5c9a6ab.png)

- 하… 탄력적IP가 두개가 만들어지고 하나가 연결 안되고 쉬고있었다.
- 그래서 벌금(?)형식으로 연결 안해놓고 하낙
- 지금이라도 찾아서 다행이라 생각하고 연결안한 탄력적IP를 삭제했다

탄력적IP 설명

[[AWS] 탄력적 IP (Elastic IP) 설명](https://sepiros.tistory.com/43)

탄력적IP 삭제하는방법

[[AWS EC2] 탄력적 IP 주소 추가 및 삭제](https://saii42.tistory.com/95)