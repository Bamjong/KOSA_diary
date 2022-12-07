package DI2;

//점수를 출력하는 클래스
public class NewRecordView {
	//NewRecordView 는 점수를 받기 위해서 NewRecord 가 필요합니다
	
	private NewRecord record; //포함관계 (복합연관)
	
	//setter 함수를 통해서 필요한 객체의 주소를 받기
	//언제가 주소가 필요하겠지 그럼 그때가 오면 setter 함수를 통해서 주입 받으면 되겠지 
	public void setRecord(NewRecord record) {
		this.record = record;
	}
	
	
	public void print(){
		System.out.println(record.total() + " / " + record.avg());
	}
}