![이미지](../%EB%AC%B8%EC%A0%9C%20%EC%82%AC%EC%A7%84/01-02%EB%B2%88.jpg)

[소스]
```java
import java.util.Scanner;

class Grade{
    private int math;
    private int science;
    private int english;

    public Grade(int math, int science, int english){
        this.math = math;
        this.science = science;
        this.english = english;
    }

    public int average(){
        int result = (math + science + english) / 3;

        return result;
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("수학, 과학, 영어 순으로 3개의 점수 입력>>");
        int math = scanner.nextInt();
        int science = scanner.nextInt();
        int english = scanner.nextInt();
        Grade me = new Grade(math, science, english);
        System.out.println("평균은 " + me.average()); // average()는 평균을 계산하여 리턴

        scanner.close();
    }
}
```

[출력]

    수학, 과학, 영어 순으로 3개의 점수 입력>> 90 88 96
    평균은 91