import java.util.Scanner;

public class Main{
    public static void main(String[] args) {
        MonthSchedule april = new MonthSchedule(31); // 4월달의 할 일
        april.run();
    }
}

class MonthSchedule{
    Scanner sc = new Scanner(System.in);
    Day[] day = null;
    int Daily;
    String toDo;
    int days;
    
    

    MonthSchedule(int days){
        this.days = days;
        day = new Day[days];

        for (int i = 0; i < day.length; i++) {
            day[i] = new Day();
        }
    }
    
    public void input(){
        System.out.printf("날짜(1~%d)?",days);
        Daily = Integer.parseInt(sc.next());
        System.out.println();

        System.out.print("할일(빈칸없이입력)?");
        toDo = sc.next();
        day[Daily].set(toDo);
        
    }

    public void view(){
        System.out.printf("날짜(1~%d)?",days);
        Daily = sc.nextInt();
        System.out.println();

        //System.out.printf("%d일의 할 일은 %s입니다.",Daily,day.show());
        System.out.print(Daily + "일의 할 일은 ");
        day[Daily].show();
        System.out.println();

    }

    public void finish(){
        System.out.println("프로그램을 종료합니다.");
        System.exit(0);
    }

    public void run(){
        System.out.println("이번달 스케쥴 관리 프로그램.");
        System.out.print("할일(입력:1 , 보기:2, 끝내기:3) >>");
        switch (Integer.parseInt(sc.next())) {
            case 1:
                input();
            
                run();
                break;
            
            case 2:
                view();

                run();
                break;

            case 3:
                finish();
                break;

            default :
                System.out.println("다시 입력해주세요");
                run();
                break;
        }
    }
}

class Day{
    private String work;

    public void set(String work){
        this.work = work;
    }
    public String get(){
        return work;
    }

    public void show(){
        if(work == null){
            System.out.println("없습니다.");
        } else {
            System.out.println(work + "입니다.");
        }
    }
}