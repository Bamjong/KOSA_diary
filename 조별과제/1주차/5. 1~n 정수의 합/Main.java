import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("몇까지 더할까요?: ");
        int count = Integer.parseInt(sc.nextLine());

        int result = 0;


        for (int i = 0; i < count; i++) {
            result += i;
            System.out.println(result);
        }
        
    }
}
