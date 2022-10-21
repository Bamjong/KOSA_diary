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