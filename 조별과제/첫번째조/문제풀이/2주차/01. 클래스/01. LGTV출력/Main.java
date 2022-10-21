class TV{
    String name;
    int year;
    int inch;

    TV(String name, int year, int inch){
        this.name = name;
        this.year = year;
        this.inch = inch;
    }

    void show(){
        System.out.printf("%s에서 만든 %d년 %d인치 TV", this.name,this.year,this.inch);
    }
}

public class Main {
    public static void main(String[] args) {
        TV myTV = new TV("LG",2017,32); // LG에서 만든 2017년 32인치
        myTV.show();
    }
}
