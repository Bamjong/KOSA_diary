import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("숫자를 입력하세요: ");
        int inputNum = Integer.parseInt(sc.nextLine());

        int number = 0;

        while (true){
            inputNum /= 10;
            number++;
            if(inputNum == 0){
                break;
            }
        }
        System.out.println(number);

        sc.close();
    }
}