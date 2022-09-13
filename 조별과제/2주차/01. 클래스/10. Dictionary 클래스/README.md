-1을 통해 사전에 있는단어인지 없는단어인지 해결해보았다.

```java
import java.util.Arrays;
import java.util.Scanner;

class Dictionary{
    Scanner sc = new Scanner(System.in);
    private static String [] kor = { "사랑", "아기", "돈", "미래", "희망"};
    private static String [] eng = { "love", "baby", "money", "future", "hope"};


    public static String kor2Eng(String word){
        int index = -1;

        for (int i = 0; i < kor.length; i++) {
            index = Arrays.asList(kor).indexOf(word);    
        }

        if(index == -1){
            System.out.println(word + "는 저의 사전에 없습니다.");
        }
    

        if(index == -1){
            return null;
        } else {
            return eng[index]; 
        }

    }

    public void show(){
        String word;
        String eng;

        System.out.println("한영 단어 검색 프로그램입니다.");
        
        while(true){
            System.out.print("한글 단어?");
            word = sc.next();
            if(word.equals("그만")){
                break;
            }
            eng = kor2Eng(word);
            if(eng != null){
            System.out.println(word+ "은 " + eng);
            }
        }
    }
}

public class Main{
    public static void main(String[] args) {
        Dictionary dic = new Dictionary();
        dic.show();
        
    }
}
```