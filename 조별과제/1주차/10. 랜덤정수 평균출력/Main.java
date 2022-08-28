class Number {
    private int num;
    


    public Number(int num){
        this.num = num;
    }

    public int random(){
        num = (int)(Math.random() * 10 + 1);
        return num;
    }
}

//(int)(Math.random() * 10 + 1);

public class Main {
    public static void main(String[] args) {
        Number num [] = new Number[10];


        for (int i = 0; i < num.length; i++) {
            //num[i] = (int)(Math.random() * 10 + 1);
            num[i] = 1;
        }

        for (int i = 0; i < num.length; i++) {
            System.out.println(num[i]);
        }
    }
}
