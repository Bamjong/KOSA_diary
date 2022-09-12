```java
import java.util.Scanner;

public class Main{
    public static void main(String[] args) {
        
        // int person = ;
        // PhoneBook phonebook = new PhoneBook(person);
        PhoneBook phoneBook = new PhoneBook();
        phoneBook.show();
        
    }
}

class PhoneBook{
    Scanner sc = new Scanner(System.in);
    Phone[] phone = null;
    int person;
    String name, number;

    PhoneBook(){
        System.out.print("인원수>>");
        this.person = sc.nextInt();
        
    }
    
    void input(){
        phone = new Phone[this.person];

        for (int i = 0; i < phone.length; i++) {
            name = sc.next();
            number = sc.next();
            phone[i] = new Phone(name, number);
        }
    }

    void search(){
        boolean a = false;

        while(true){
            System.out.print("검색할 이름>>");
            String searchName = sc.next();
            if(searchName.equals("그만")){
                break;
            }

            for (int i = 0; i < phone.length; i++) {
                if(phone[i].name.equals(searchName)){
                    System.out.println(searchName + "의 번호는 " + phone[i].number + " 입니다.");
                    i = phone.length;
                    a = true;
                } else {
                    a = false;
                }
            }
            if(a == false){
                System.out.println(searchName + " 이 없습니다.");
            }
        }
        
    }


    public void show(){
        System.out.print("이름과 전화번호(이름과 번호는 빈 칸없이 입력)>>");
        input();
        System.out.println("저장되었습니다...");
        search();
    }
}


class Phone{
    String name;
    String number;

    Phone(String name, String number){
        this.name = name;
        this.number = number;
    }
}
```


### 출력
    인원수>>3
    이름과 전화번호(이름과 번호는 빈 칸없이 입력)>>황기태 777-7777
    나명품 999-9999 
    최자바 333-1234
    저장되었습니다...
    검색할 이름>> 최자바
    최자바의 번호는 333-1234 입니다.
    검색할 이름>>고범종
    고범종 이 없습니다.
    검색할 이름>> 김판호
    김판호 이 없습니다.
    검색할 이름>>  김장훈
    김장훈 이 없습니다.
    검색할 이름>>나명품
    나명품의 번호는 999-9999 입니다.
    검색할 이름>>그만