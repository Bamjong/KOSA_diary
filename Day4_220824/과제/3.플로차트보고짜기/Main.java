import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int unit = 10000;  //화폐단위
        int num = 0;  //화폐매수
        boolean sw = false; //

        int money = Integer.parseInt(sc.nextLine());  //Money입력
        
        while(true){

            num = (money/unit);

            System.out.printf("unit값: %d \t num값: %d\n",unit,num);

            if (unit > 1) {
                    money = money - (unit * num);
            } else {break;}

            if (sw == false) {
                unit = unit / 2;
                sw = true;
            } else {
                unit = unit / 5;
                sw = false;
            }
        }
    }
}