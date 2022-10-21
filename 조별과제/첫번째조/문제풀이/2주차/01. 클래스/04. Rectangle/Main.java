class Rectangle{
    int x,y;
    int width, height;

    Rectangle(int x, int y, int width, int height){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    int square(){
        return this.width * this.height;
    }

    void show(){
        System.out.printf("(%d,%d)에서 크기가 %dx%d인 사각형\n",this.x,this.y,this.width,this.height);
    }

    boolean contains(Rectangle r){
        if(x < r.x && y < r.y)
            if((width+x) > (r.x+r.width) && (height+y) > (r.y+r.height))
                return true;
        return false;

        /*   문제를 잘 못이해해서 결국 답보게 된부분.
        if( (r.x <= this.x) && (r.y <= this.y) && (r.width <= this.width) && (r.height <= this.height) ){
            System.out.printf("t는 %s을 포함합니다.", r);
            return true;
        } else {
            return false;
        }
        */
    }

}

public class Main {
    public static void main(String[] args) {
        Rectangle r = new Rectangle(2, 2, 8, 7);
        Rectangle s = new Rectangle(5, 5, 6, 6);
        Rectangle t = new Rectangle(1, 1, 10, 10);

        r.show();
        System.out.println("s의 면적은 " + s.square());
        if (t.contains(r)) System.out.println("t는 r을 포함합니다.");
        if (t.contains(s)) System.out.println("t는 s을 포함합니다.");
    }
}
