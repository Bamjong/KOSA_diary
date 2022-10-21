
class Number{
    int[] ranArray = {random(),random(),random(),random(),random(),random(),random(),random(),random(),random()};
    double result;

    int random(){
        return (int)(Math.random() * 11 + 1);           
    }

    double Avg(){
        for (int i = 0; i < ranArray.length; i++) {
            result += ranArray[i];
        }
        result /= ranArray.length;
        return result;
    }
}

public class Main{
    public static void main(String[] args) {
        Number number = new Number();
            System.out.print("랜덤한 정수들 : ");
            
            for(int ran : number.ranArray){
                System.out.print(ran + " ");
            }
        System.out.printf("\n평균은 %.1f", number.Avg());
    }
}