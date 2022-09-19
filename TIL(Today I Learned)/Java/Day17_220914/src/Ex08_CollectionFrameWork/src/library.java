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
    
    void Menu() {
       	while(true) {
       		System.out.println("1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료");
        	int number = Integer.parseInt(sc.nextLine()); 
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
}
    
    void addBook() {
    	String ISBN;
    	String name;
    	int price = 0;
    	
    	System.out.print("추가할 도서 ISBN:");
    	ISBN = sc.nextLine();
    	
    	System.out.print("도서 제목:");
    	name = sc.nextLine();

    	while(true) {
    		
	    	try {
	    		System.out.print("가격:");
	        	price = Integer.parseInt(sc.nextLine()); 
	        	Book.put(ISBN, new Book(name, price));
	        	break;
			} catch (Exception e) {
				System.out.println("숫자를 입력하세요");
				
			}
    	}
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
    
    
    
    
    
    

}

class Book{
	String book;
	int price;
	
	
	public Book(String book, int price) {
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
    	book.Menu();;
    }
}
