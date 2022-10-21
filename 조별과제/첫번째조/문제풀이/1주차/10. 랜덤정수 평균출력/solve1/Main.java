
class Number{
    int[] ranArray = new int[10];
    double result;

    Number(){ //생성자를 이용해 시작하자마자 배열에 랜덤값 삽입
        random();
    }

    int[] random(){ //랜덤값을 ranArray에 삽입
        
        for (int i = 0; i < ranArray.length; i++) {
            int ran = (int)(Math.random() * 11 + 1); // 1 ~ 10 난수 설정
            ranArray[i] = ran;
        }
        return ranArray;
    }

    double Avg(){ //평균 설정
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
            
            for(int ran : number.ranArray){  //랜덤 정수 확인
                System.out.print(ran + " ");
            }
        System.out.printf("\n평균은 %.1f", number.Avg());
    }
}