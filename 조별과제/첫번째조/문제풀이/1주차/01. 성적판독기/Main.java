import java.util.Scanner;

public class Main{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int User = 0;
        String name = "";
        
        User = Integer.parseInt(sc.nextLine());  //유저 점수 기입

        //삼항연산자 이용
        name =  90 <= User ? "수" :
                80 <= User ? "우" :
                70 <= User ? "미" :
                60 <= User ? "양" : "가"; 

        System.out.println(name);
        
                    
        sc.close();
    }
}