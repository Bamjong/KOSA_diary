package kr.or.kosa;

public class coffeeMachine {
    private String name = "아메리카노";
    private int shot = 2;
    private int price = 1500;
    
    public void printInfo() {
    	System.out.printf("이름: %s 현재 가격: %d", name, price);
    	System.out.println("");
    }
    
    public void shotAdd() {
    	if(shot >= 1 && shot < 4) {
    	 	price += 300;
        	shot++;
    	}else {
    		System.out.println("4샷을 초과할 수 없습니다.");
    	}
    }
    
    public void shotRemove() {
        if((shot - 1) >= 2) {
    	 	price -= 300;
        	shot--;
        } else if((shot - 1) == 1){
        	shot--;
        } else {
    		System.out.println("최소 1샷 입니다.");
    	}
    }
    
    public void decaffein() {
    	name = "디카페인 아메리카노";
    	price += 300;
    }
    
}