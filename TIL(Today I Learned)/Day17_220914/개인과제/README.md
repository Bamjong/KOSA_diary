## 문제
    도서관리 프로그램 ... HashMap  사용해서

    도서정보를 저장하는 클래스

    Book  클래스 (도서번호 , 도서제목 , 도서가격)

    BookManager (도서 추가 , 도서 삭제 , 도서 검색 , 도서목록 )

    HashMap 활용해서 


### 나의 솔루션

```java
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

class BookManager{
	Scanner sc = new Scanner(System.in);
    Map<String,Book> Book;
        
    
    BookManager(){
    Book = new HashMap<String,Book>();
    }
    
    void addBook() {
    	String ISBN;
    	String name;
    	String price;
    	
    	System.out.print("추가할 도서 ISBN:");
    	ISBN = sc.next();
    	
    	System.out.print("도서 제목:");
    	name = sc.next();

    	System.out.print("가격:");
    	price = sc.next();
    	
    	Book.put(ISBN, new Book(name, price));
    	
    	System.out.println("ISBN:" + ISBN + " 이름:" + name + " 가격:" + price + " 생성하였습니다. \n");
    }
    
    void remove() {
    	String ISBN;
    	
    	System.out.println("삭제할 도서 ISBN:");
    	ISBN = sc.next();
    	Object value = Book.remove(ISBN);
    	
    	System.out.println("삭제하였습니다.");
    	System.out.println();
    }
    
    void list() {
    	System.out.println("도서 목록");
    	System.out.println("도서 수:" + Book.size());
    	
    	for(Map.Entry m : Book.entrySet()) {
			System.out.println("ISBN:" + m.getKey()+ " " + m.getValue());
		}
    	System.out.println();
    }
    
    void search() {
    	String ISBN;
    	
    	
    	System.out.print("검색할 도서 ISBN:");
    	ISBN = sc.next();
    	
    	System.out.println();
    	System.out.print("검색 결과>>");
    	System.out.println("ISBN:" + ISBN + " " + Book.get(ISBN));
    	System.out.println();
    }
    
    void showISBN() {
    	System.out.println("ISBN 목록");
    	System.out.println("도서 수:" + Book.size());
    	
    	for(Map.Entry m : Book.entrySet()) {
			System.out.println(m.getKey());
		}
    	System.out.println();
    }
    
    
    
    
    void Menu(int number) {
    
	    		switch (number) {
			case 1:
				addBook();
				break;
			
			case 2:
				remove();
				break;
				
			case 3:
				search();
				break;
				
			case 4:
				list();
				break;
			
			case 5:
				showISBN();
				break;
				
			case 0:
				System.out.println("프로그램을 종료합니다.");
				System.exit(1);
	
			default:
				System.out.println("잘못된 입력값입니다.");
	    		}
 
    	
    }
    
    void show() {
    	while(true) {
			System.out.println("1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료");
	    	Menu(sc.nextInt());
    	}
    	
    	
    }
 
}

class Book{
	String book;
	String price;
	
	
	public Book(String book, String price) {
		super();
		this.book = book;
		this.price = price;
	}


	@Override
	public String toString() {
		return "이름:" + book + " 가격:" + price;
	}
	
	
}


public class library {
    public static void main(String[] args) {
    	BookManager book = new BookManager();
    	book.show();
    }
}
```

### 출력
    1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료
    1
    추가할 도서 ISBN:1234
    도서 제목:java
    가격:2000
    ISBN:1234 이름:java 가격:2000 생성하였습니다. 

    1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료
    1
    추가할 도서 ISBN:4321
    도서 제목:C언어
    가격:5000
    ISBN:4321 이름:C언어 가격:5000 생성하였습니다. 

    1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료
    1
    추가할 도서 ISBN:3421
    도서 제목:자료구조
    가격:2000
    ISBN:3421 이름:자료구조 가격:2000 생성하였습니다. 

    1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료
    4
    도서 목록
    도서 수:3
    ISBN:1234 이름:java 가격:2000
    ISBN:4321 이름:C언어 가격:5000
    ISBN:3421 이름:자료구조 가격:2000

    1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료
    5
    ISBN 목록
    도서 수:3
    1234
    4321
    3421

    1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료
    3
    검색할 도서 ISBN:1234

    검색 결과>>ISBN:1234 이름:java 가격:2000

    1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료
    2
    삭제할 도서 ISBN:
    4321
    삭제하였습니다.

    1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료
    4
    도서 목록
    도서 수:2
    ISBN:1234 이름:java 가격:2000
    ISBN:3421 이름:자료구조 가격:2000

    1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료
    5
    ISBN 목록
    도서 수:2
    1234
    3421

    1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료
    0
    프로그램을 종료합니다.
