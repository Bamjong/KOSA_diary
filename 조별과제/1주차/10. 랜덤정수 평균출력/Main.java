class Number{
    private int number;
    private int random;

    public Number(int number){
        this.number = number;
    }

    public int Random(){
       random =  (int)(Math.random() * 10 + 1);
       return random;
    }

    public void show(){
        System.out.println(number);
    }

}

//(int)(Math.random() * 10 + 1);

public class Main {
    public static void main(String[] args) {
        Number na = new Number((int)(Math.random() * 10 + 1));
        Number num [] = new Number[10];

        System.out.println(num.show());

        for (int i = 0; i < num.length; i++) {
            
            //num[i] = num.Random;
        }

        for (int i = 0; i < num.length; i++) {
            System.out.println(num[i]);
        }
    }
}
