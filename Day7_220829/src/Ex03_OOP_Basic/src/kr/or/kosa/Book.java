package kr.or.kosa;

public class Book {
	/*
	책은 책이름과 가격정보를 가지고있다.
	책이 출판되면 반드시 책이름과 책 가격정보를 가지고 있어야 한다
	책의 이름과 가격 정보는 특정 기능을 통해서만 볼 수 있고, 출판된 이우에는 수정 할 수 없다(책의 가격, 이름)
	책이름과 가격정보는 각각 확인 할 수 있다.
	 */
		private String name;
		private int price;
		
		public Book(String n, int p) {
			name = n;
			price = p;
		}
		
		public void showBook() {
			System.out.printf("책 이름: %s , 책 가격: ",name,price);
		}
		
		public void showBook(String n) {
			System.out.println("책 이름: " + name);
		}
		
		public void showBook(int p) {
			System.out.println("책 가격: " + price);
		}
		
}

