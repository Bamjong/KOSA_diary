class Song{
    String title;
    String artist;
    int year;
    String country;

    Song(){
        this("Dancing Queen", "ABBA", 1978, "스웨덴");
    }
    // 1978년 스웨덴국적의 ABBA가 부른 Dancing Queen
    Song(String title, String artist, int year, String country){
        this.title = title;
        this.artist = artist;
        this.year = year;
        this.country = country;
    }

    void show(){
        System.out.printf("%d년 %s국적의 %s가 부른 %s" , this.year , this.country, this.artist, this.title);
    }
}
// 1978년 스웨덴국적의 ABBA가 부른 Dancing Queen
public class Main {
    public static void main(String[] args) {
        Song song = new Song();
        song.show();
    }

}
