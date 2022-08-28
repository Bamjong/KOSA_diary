class TV{
    String name;
    int year;
    int inch;
    public void TV(String name, int year, int inch){
        this.name = name;
        this.year = year;
        this.inch = inch;

    }
    
    public void show(){
        System.out.prinf("%s에서 만든 %d년형 %d인치 TV",name,year,inch);
    }
}

public class Main {
    public static void main(String[] args) {
        Tv myTV = new TV("LG", 2017, 32); // LG에서 만든 2017년 32인치
        meTV.show();
    }
}
