![Circle class](https://user-images.githubusercontent.com/92353613/187051693-8c2de42d-7fe6-441b-949f-7c9c49532bf1.jpg)

```java
import java.util.Scanner;

class Circle{
    private double x, y;
    private int radius;

    public Circle(double x, double y, int radius){
        this.x = x;
        this.y = y;
        this.radius = radius;
    }
    public void show(){
        System.out.printf("(%.1f,%.1f)%d\n",x,y,radius);
    }
}

public class CircleManager {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Circle c [] = new Circle [3];

        for (int i = 0; i < c.length; i++) {
            System.out.print("x, y, radius >>");

            c[i] = new Circle(scanner.nextDouble(),scanner.nextDouble(),scanner.nextInt());
            
            
        }

        for (int i = 0; i < c.length; i++) {
            c[i].show();
        }
        scanner.close();
    }
}

```

출력
---
    x, y, radius >>3.0 3.0 5
    x, y, radius >>2.5 2.7 6
    x, y, radius >>5.0 2.0 4
    (3.0,3.0)5
    (2.5,2.7)6
    (5.0,2.0)4