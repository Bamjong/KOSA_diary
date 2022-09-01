import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Hello hello = new Hello();

        System.out.print("몇번 입력하시겠습니까? ");
        int count = Integer.parseInt(sc.nextLine());

        for (int i = 0; i < count ; i++) {
            hello.hi();
        }


    }
}

class Hello{

    public void hi(){
        System.out.println("안녕하세요");
    }
}