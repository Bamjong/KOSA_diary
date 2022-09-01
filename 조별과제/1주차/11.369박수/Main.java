
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        int num = 0;


        while(num < 100){
            if(num == 3 || num == 6 || num == 9)  // 1의자리 369 짝
                System.out.println(num + " 박수 짝");
            
            
            if((num %10) == 3||(num %10) == 6||(num %10) == 9){  // 10의자리 짝
                if(num/10 == 3||num/10 == 6||num/10 == 9)
                    System.out.println(num + " 박수 짝짝");
                else
                    System.out.println(num + " 박수 짝");
            }
                else if(num/10 == 3||num/10 == 6||num/10 == 9)
                    System.out.println(num + " 박수 짝");
            
            num++;
        }
    }
}
