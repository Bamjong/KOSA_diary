![이미지](../%EB%AC%B8%EC%A0%9C%20%EC%82%AC%EC%A7%84/10-11%EB%B2%88.jpg)

[소스]

```java
import java.util.Scanner;

class Add{
    int a;
    int b;

    void setValue(int a, int b){
        this.a = a;
        this.b = b;
    }

    int calculate(){
        return a+b;
    }
}

class Sub{
    int a, b;

    void setValue(int a, int b){
        this.a = a;
        this.b = b;
    }

    int calculate(){
        return a-b;
    }
}

class Mul{
    int a, b;

    void setValue(int a, int b){
        this.a = a;
        this.b = b;
    }

    int calculate(){
        return a*b;
    }
}

class Div{
    int a, b;

    void setValue(int a, int b){
        this.a = a;
        this.b = b;
    }

    int calculate(){
        return a/b;
    }
}

public class Main {
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);

        int a = 0;
        int b = 0;
        String operator = null;

        System.out.print("두 정수와 연산자를 입력하시오>>");
        

        a = Integer.parseInt(sc.next());
        b = Integer.parseInt(sc.next());
        operator = sc.next();
        System.out.println();

        if (operator.equals("+")) {
            Add add = new Add();
            add.setValue(a, b);
            System.out.print(add.calculate());

        } else if (operator.equals("-")) {
            Sub sub = new Sub();
            sub.setValue(a, b);
            System.out.print(sub.calculate());

        } else if (operator.equals("*")){
            Mul mul = new Mul();
            mul.setValue(a, b);
            System.out.print(mul.calculate());

        } else if (operator.equals("/")){
            Div div = new Div();
            div.setValue(a, b);
            System.out.print(div.calculate());
        }
    }
}

```

[출력]

    e두 정수와 연산자를 입력하시오>> 5 7 *
    35