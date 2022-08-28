class TV{
    private String name;
    private int year;
    private int inch;
    public TV(String name, int year, int inch){
        this.name = name;
        this.year = year;
        this.inch = inch;
    }
    
    public void show(){
        System.out.printf("%s에서 만든 %d년형 %d인치 TV",this.name,this.year,this.inch);
        //System.out.println(this.name + "에서 만든 " + this.year + "년형 " + this.inch + "인치 TV");
    }
}

public class Main {
    public static void main(String[] args) {
        TV myTV = new TV("LG", 2017, 32); // LG에서 만든 2017년 32인치
        myTV.show();
    }
}
