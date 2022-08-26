package kr.or.kosa;

public class Eggmayo {
	public int calories = 700;
	public int price = 3500;
	public int eggCount = 1;
	public int end = 0;
	
		public void printInfo() {
			System.out.println("현재 에그마요 상태");
			System.out.printf("칼로리: %d\n",calories);
			System.out.printf("가격 : %d\n",price);
		}
	
		public void eggAdd(){
			if (calories <= 0) {
				System.out.println("삐빅! 칼로리가 0입니다.");
			} else {
			calories += 100;
			price += 300;
			System.out.printf("에그마요 %d번 추가했습니다.\n",eggCount);
			eggCount++;
			eggWarning();
			}
		}
			
		public void eggSubtract(){
			if (calories <= 0) {
				System.out.println("삐빅! 칼로리가 0입니다.");
			} else {
			calories -= 100;
			price -= 300;
			eggCount--;
			eggWarning();
			}
		}
		
		public void priceCheck(int User, int price) {
			if(User < price) {
				System.out.println("돈을 더 추가해주세요");
			} else {
				int a = Balance(User, price);
				System.out.printf("잔돈 %d원 입니다.\n",a);
				System.out.println("감사합니다.");
				end = 1;
			}
		}
		
		public int Balance(int User, int price) {
			return User - price;
		}
		
		
		public void eggWarning() {
			if (eggCount >= 4) {
				eggCount--;
				System.out.println("최대 3번까지 입니다.");
			}
			if (eggCount <= 0) {
				eggCount++;
				System.out.println("최소 1개는 넣어야합니다.");
			}
		}
			
			
		
}
