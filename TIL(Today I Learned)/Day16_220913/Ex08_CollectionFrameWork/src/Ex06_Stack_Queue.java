import kr.or.kosa.MyStack;

public class Ex06_Stack_Queue {
	public static void main(String[] args) {
		// Java API 제공하는 클래스
		// Collection Java API 제공
		
		// Stack 자료구조 가지는 클래스 제공 받아요
		
//		Stack stack = new Stack();  //	LIFO
//		stack.push("A");
//		stack.push("B");
//		stack.push("C");
//		
//		System.out.println(stack.pop());
//		System.out.println(stack.pop());
//		System.out.println(stack.pop());
		
		MyStack mystack = new MyStack(10);
		mystack.push("hello");
		mystack.push("My");
		mystack.push("name");
		mystack.pop();
		mystack.pop();
		mystack.pop();
	}
}
