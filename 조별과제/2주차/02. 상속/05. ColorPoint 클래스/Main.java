class Point{
    private int x,y;
    public Point(int x, int y) {this.x = x; this.y = y;}
    public int getX(){ return x; }
    public int getY(){ return y; }
    protected void move(int x, int y) { this.x = x; this.y = y;}
}

class ColorPoint extends Point{
    String Color;

    ColorPoint(int x, int y, String Color){
        super(x, y);
        this.Color = Color;
    }

    void setXY(int x, int y){
        move(x, y);
    }

    void setColor(String Color){
        this.Color = Color;
    }

    @Override
    public String toString() {
        return Color + "색의" + "(" + getX() + "," + getY() + ")" + "의 점";
    }

}

public class Main {
    public static void main(String[] args) {
        ColorPoint cp = new ColorPoint(5, 5, "YELLOW");
        cp.setXY(10, 20);
        cp.setColor("RED");
        String str = cp.toString();
        System.out.println(str + "입니다.");
    }
}
