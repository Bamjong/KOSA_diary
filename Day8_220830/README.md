# 2022년 8월 30일 화요일
<br>


## 1. 배열(Array) (*04_Ex01_Array_Basic, Ex02~03 ···)

### 배열은 객체다
    1. new를 통해서 생성
    2. 배열은 객체이기 때문에 heap 메모리 생성(관리자원)
    3. 고정배열(정적배열) : 배열을 한번 선언하면 (크기가 정해지면) 변경 불가 <-> collection(동적)
    4. 자료구조 (알고리즘) 기초적인 학습

```java
int[] arr1 = new int[5]; // 기본
int[] arr2 = new int[] {100, 200, 300}; // 초기값을 통해서 배열개수정의하고 값을 할당
int[] arr3 = {11,22,33}; //컴파일러에게 자동으로 new 부분을 부탁...    <- 이 방법 많이씀
//Tip) javascript : let cararr = [1,2,3,4,5];
```

### 문제
    제어문을 통해서
    max 라는 변수에 시험점수중에 최대값을 담고
    min 라는 변수에 최소값을 담으세요
    출력결과 : max -> 97점	, min -> 54점
    단) for문을 한번만 사용하세요.
```java
for (int i = 0; i < score.length; i++) {

    if(score[i] > max) {
        max = score[i];
    }
    if(score[i] < min) {
        min = score[i];
    }
    
    //// 위아래 두개는 같은거임

    max = (score[i] > max) ? score[i] : max;
    min = (score[i] < min) ? score[i] : min;
    }
System.out.println("max: " + max);
System.out.println("min: " + min);
```

#### 출력
    max: 97
    min: 54




### 문제
    어느 학생의 기말고사 시험점수 (5과목)

    1. 총과목의 수
    2. 과목의 합
    3. 과목의 평균
    단 2,3번 문제는 하나의 for문으로 해결하세요.
```java

int[] jumsu = {100,55,90,60,78};
int sum = 0;
float avg = 0f;

    for (int i = 0; i < jumsu.length; i++) {
        sum += jumsu[i];
        if(i == jumsu.length -1) { //마지막 방 이라면
            avg = sum / jumsu.length;	
        }
        
    }
System.out.printf("총 과목수: [%d] 총점: [%d] 평균[%d]",jumsu.length,sum,(int)avg);

```
#### 출력
    총 과목수: [5] 총점: [383] 평균[76]



<br>






## 2. 개선된 for문 (*04_Ex04_Array_For)

    for문 >> 향상된 for문, 개선된 for문
    JAVA	: for(Type 변수명 : 배열 or Collection) (실행블럭)
    C#		: for(Type 변수명 in 배열 or Collection) (실행블럭)
    JS		: for(Type 변수명 in Collection) (실행블럭)

```java
    //일반 ...
    int[] arr = {5,6,7,8,9};
    
    for (int i = 0; i < arr.length; i++) {
        System.out.println(arr[i]);
    }
    
    //개선된 ...
    for(int value : arr) {
        System.out.println(value);
```

#### 출력
    5
    6
    7
    8
    9

## 3. 객체 배열  (*05_Ex05_Array_Object)
![이미지](https://smoothiecoding.kr/wp-content/uploads/2021/03/javaarray-1.jpg)

#### 객체 배열 3가지 방법으로 만들기
		
1. int[] arr = new int[10];
```java
Person[] parray1 = new Person[10]; // 방만 생성
for (int i = 0; i < parray1.length; i++) {
    parray1[i] = new Person();
    System.out.println("주소값: " + parray1[i]);
}
```
		
2. int[] arr = new int[]{10,20,30}
```java
Person[] parray2 = new Person[] {new Person(), new Person(), new Person()};  
```


3. int[] arr = {10,20,30}
```java
Person[] parray3 = {new Person(), new Person(), new Person()};
```