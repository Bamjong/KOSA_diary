import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        int user_Select = 0;
        int computer = 0;
        Scanner sc = new Scanner (System.in);
 

        System.out.println("본격! 컴퓨터를 이겨라!");
        System.out.println("1.가위 | 2.바위 | 3.보");
        System.out.print("숫자를 입력해주세요: ");


        user_Select = Integer.parseInt(sc.nextLine()); //유저 가위바위보 픽
         


        System.out.printf("\n유저: %s | %s :컴퓨터\n",user_Select,computer);

        computer = Rock_Scissors_Paper(user_Select); // 컴퓨터가 뭐 냈는지
        


        sc.close();
    }



    //랜덤 1,2,3
    public static int random(){
        double random = Math.random();
		random = (3*random+1); //1 <= random < 4;
		
        return (int)random;
        
    }


    //가위바위보 게임
    public static int Rock_Scissors_Paper (int user){
        int computer = random();
        
        
        //가위 바위 보 순서로 승리, 패배 순으로 나열

               if ((user == 1) && (computer == 3)) {
            System.out.println("이겼습니다! :)");
        } else if ((user == 1) && (computer == 2)) {
            System.out.println("패배했습니다! :(");
        } else if ((user == 2) && (computer == 1)){
            System.out.println("이겼습니다! :)");
        } else if ((user == 2) && (computer == 3)){
            System.out.println("패배했습니다! :(");
        } else if ((user == 3) && (computer == 2)){
            System.out.println("이겼습니다! :)");
        } else if ((user == 3) && (computer == 1)){
            System.out.println("패배했습니다! :(");
        } else {
            System.out.println("비겼습니다!");
        }
        return computer;
    }
}