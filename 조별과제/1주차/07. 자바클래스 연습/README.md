![이미지](https://user-images.githubusercontent.com/92353613/187064414-f667b7cc-a35a-463e-8490-a9a9d41dcdd9.png)

```java
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
    }
}

public class Main {
    public static void main(String[] args) {
        TV myTV = new TV("LG", 2017, 32); // LG에서 만든 2017년 32인치
        myTV.show();
    }
}

```


출력
--- 
    LG에서 만든 2017년형 32인치 TV