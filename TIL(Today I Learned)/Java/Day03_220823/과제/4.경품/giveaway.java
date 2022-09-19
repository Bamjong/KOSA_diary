import java.io.IOException;

public class giveaway {
	public static void main(String[] args) {
		
		int random = (int)((Math.random() * 10)+1);
		
		random = random * 100;
		

		switch (random) {
		case 1000:
			System.out.println("TV, NoteBook, 냉장고, 한우세트, 휴지");
			break;
		case 900:
			System.out.println("NoteBook, 냉장고, 한우세트, 휴지");
			break;
		case 800:
			System.out.println("냉장고, 한우세트, 휴지");
			break;
		case 700:
			System.out.println("한우세트, 휴지");
			break;
		case 600:
			System.out.println("휴지");
			break;
			
			
		default:
			System.out.println("칫솔");
			break;
		}
		System.out.println(random);
		
		
		/*
		 int jumsu = ((int)(Math.random()* 10) + 1)*100;
		  System.out.println("추첨번호 : " + jumsu);
		  String msg="";//초기화
		  msg+= "고객님의 점수는 :" + jumsu + " 이고 상품은 : ";  
		  switch(jumsu) {
		  	case 1000:msg+="Tv";
		  	case 900:msg+="NoteBook ";
		  	case 800:msg+="냉장고 ";
		  	case 700:msg+="한우 ";
		  	case 600:msg+="휴지 ";
		  	     break;
		  	default:msg+="칫솔";     
		  }
		  System.out.println(msg);
		  
		  정답
​
		 */
		
	}
}