package com.victoree2.common;
import java.util.HashMap;

import com.victoree2.main.ReadingRoom;

public class ReturnMessage {
	ReadingRoom room = new ReadingRoom();

	
	HashMap<String, String> kor_message = new HashMap<String, String>();
	HashMap<String, String> en_message = new HashMap<String, String>();
	

	
	void init() {
		kor_message.put("0000", "해당계정은 정지되었습니다.");
		kor_message.put("0001","1:로그인  2:회원가입  3:좌석보기  4:In English(toggle)  -1:종료");
		kor_message.put("0002","1:마이페이지  2:정기권 예약  3:시간권 예약  4:%s  5:좌석보기  0:로그아웃  -1:종료\n"); 
		/*dayeong*/
		kor_message.put("0003","1:좌석현황  2:전체회원 목록  3:회원검색  4:매출현황  5:쿠폰관리  6:열람실 추가   0:로그아웃"); 
		/*dayeong*/
		kor_message.put("0004","스터디 카페 방문을 환영합니다 *^^*");
		kor_message.put("0005","계정이 없습니다.");
		kor_message.put("0006","계정을 만들어 사용하시오.");
		kor_message.put("0007","관리자");
		kor_message.put("0008","아이디");
		kor_message.put("0009","입력");
		kor_message.put("0010","패스워드");
		kor_message.put("0011","계정을 생성하였습니다.");
		kor_message.put("0012","아이디와 패스워드를 입력하시오.");
		kor_message.put("0013","아이디/패스워드가 틀렸습니다.");
		kor_message.put("0014","파일이 존재하지 않습니다.");
		kor_message.put("0015","끝");
		kor_message.put("0016","파일을 읽을 수 없습니다.");
		kor_message.put("0017","나머지 예외 : ");
		kor_message.put("0018","종료");
		kor_message.put("0019","님께서 로그인 하였습니다.");
		kor_message.put("0020","잘못 선택하였습니다.");
		kor_message.put("0021","관리자 페이지에 접속하였습니다.");
		kor_message.put("0022","<<회원가입>>");		
		kor_message.put("0023","이름");
		kor_message.put("0024","생일(주민등록번호 앞의 6자리)");
		kor_message.put("0025","전화번호");
		kor_message.put("0026","1:비밀번호 변경 2:전화번호 변경 3:결제내역 4:환불 0:뒤로가기 -1:종료");
		kor_message.put("0027","입실");
		kor_message.put("0028","퇴실");
		
		kor_message.put("0029","[%d]열람실 ");
		kor_message.put("0030", "로그인 시도 횟수가 너무 많습니다. 보안 검사 숫자를 따라 치세요 : ");
		kor_message.put("0031", "입력>>");
		kor_message.put("0032", "틀렸습니다.");
		kor_message.put("0033", "확인되었습니다.");
//		kor_message.put("0023","생일");
//		kor_message.put("0023","생일");
//		kor_message.put("0023","생일");
//		kor_message.put("0023","생일");
		
		
		/*dhj*/ /*dayeong*/
		//1:좌석현황 2:전체 회원 목록 3:회원검색 4:매출현황 5:쿠폰관리 0:로그아웃
		kor_message.put("0051", "현재 스터디카페 좌석 현황입니다.");  //1.좌석현황
		kor_message.put("0052", "전체 회원 목록을 조회합니다."); //2.전체 회원 목록 //3.회원검색
		kor_message.put("0053", "회원검색합니다. \n검색할 회원의 이름을 입력하세요."); //3.회원검색
		kor_message.put("0054", "쿠폰을 관리합니다. \n 1:현재 발행된 쿠폰 확인  2:쿠폰 추가  3:쿠폰 삭제  0:뒤로가기"); //5.쿠폰관리
		kor_message.put("0055", "현재 사용가능한 쿠폰 목록입니다.");//5.쿠폰발행 -> 1.현재 발행된 쿠폰 확인
		kor_message.put("0056", "추가할 쿠폰의 번호와 할인율을 입력하세요. 추가를 원치 않으면 0을 입력하세요.");//5. 쿠폰발행 -> 2.쿠폰추가
		kor_message.put("0057", "삭제할 쿠폰의 번호를 입력하세요. 삭제를 원치 않으면 0을 입력하세요.");//5.쿠폰발행 -> 3.쿠폰삭제
		kor_message.put("0058","검색결과"); //3.회원 검색 - 회원검색결과
		kor_message.put("0059","1:결제내역 조회 2:비밀번호 초기화 3.경고 4.정지 0:뒤로가기");//3.회원검색결과의 하위 옵션
		kor_message.put("0060","이 회원에게 경고를 줍니까? 1:예 2:뒤로가기"); //3.회원 검색 -> 3.경고
		kor_message.put("0061","경고를 주었습니다."); //3.회원검색 ->3.경고
		kor_message.put("0062","해당 회원의 결제내역입니다."); //3.회원 검색 -> 1.회원입퇴실내역조회
		kor_message.put("0063","이 회원의 비밀번호를 초기화하겠습니까? 0000으로 초기화됩니다. 1:예 2:뒤로가기");//3.회원검색 -> 2.비밀번호 초기화
		kor_message.put("0064","비밀번호가 초기화되었습니다.");//회원검색결과3번옵션-2
		kor_message.put("0065", "매출 현황 입니다"); //4. 매출 현황
		kor_message.put("0066","이 회원을 정지시킵니까? 1:예 2:뒤로가기"); //3.회원 검색 -> 4.정지 확인
		kor_message.put("0067","이 회원의 권한을 정지하였습니다"); //3.회원 검색 -> 정지
		kor_message.put("0068", "이 회원의 입퇴실 내역 입니다"); //3.회원검색 -> 1.회원의 입퇴실 내역
		//정기권 예약
		kor_message.put("0100","몇주를 예약하시겠습니까? \n 1: 2주권(%s원) \n 2: 4주권(%s원) \n 3: 8주권(%s원) \n 0: 뒤로가기 \n");//정기권예약
		
		kor_message.put("0102","%s원 결제하시겠습니까? \n 1:예  2:쿠폰이 있어요! 0:뒤로가기 \n"); // 1,2,3 선택시
		
		 //1번 "예" 눌렀을 경우
		kor_message.put("0103","%s 회원님의 권한이 부여되었습니다! \n 1: 열람실 선택하기 \n %s \n"); //앞에 이름 붙혀주기
		kor_message.put("0104","좌석을 선택해주세요  \n"); //앞에 이름 붙혀주기
		 //2번 "쿠폰이 있어요!" 눌렀을 경우
		kor_message.put("0105","쿠폰번호를 입력해주세요.");
		kor_message.put("0106","(쿠폰)몇주를 예약하시겠습니까?");
		kor_message.put("0107"," 1: 2주권(%s원)\n 2: 4주권(%s원)\n 3: 8주권(%s원)\n 0: 뒤로가기 \n");//이후 104번 출력
		kor_message.put("0108"," 1: 2시간(%s원)\n 2: 4시간(%s원)\n 3: 7시간(%s원)\n 4: 9시간(%s원)\n 5: 12시간(%s원)\n 0: 뒤로가기 \n");//이후 104번 출력
		kor_message.put("0109"," 시즌권은 자리를 지금 선택하셔야 합니다.");
		kor_message.put("0110","좌석을 선택해주세요.\n");
		kor_message.put("0111","열람실을 선택해주세요.");
		/*GBJ*/
		
		/*kdj*/
		kor_message.put("0200", "안녕하세요 ");
		kor_message.put("0201", "님!\n 회원님의 회원권은 ");
		kor_message.put("0202", "남았습니다. ");
		kor_message.put("0203"," 1:비밀번호 변경 \n 2:환불 \n 0:뒤로가기");
		kor_message.put("0204","현재 비밀번호를 입력하세요.");
		kor_message.put("0205","비밀번호를 다시 확인하세요.");
		kor_message.put("0206","새 비밀번호를 입력하세요.");
		kor_message.put("0207","비밀번호 변경이 완료되었습니다. ");
		kor_message.put("0208","환불 규정\n정기권 환불의 경우 1일 기준 환불이 가능합니다.\n시간권 환불의 경우 1시 기준 환불이 가능합니다.");
		kor_message.put("0209","회원님의 환불 가능 금액 : ");
		kor_message.put("0210","환불하시겠습니까? \n 1. 예 \n 2. 뒤로가기");
		kor_message.put("0211","환불되었습니다. \n다음에 또 이용해주세요. \n감사합니다. ");
		kor_message.put("","");
		kor_message.put("","");
		kor_message.put("","");
		kor_message.put("","");
		kor_message.put("","");
		kor_message.put("","");

		kor_message.put("0212","현재 전화번호를 입력하세요.");
		kor_message.put("0213","전화번호를 다시 확인하세요.");
		kor_message.put("0214","새 전화번호를 입력하세요.");
		kor_message.put("0215","전화번호 변경이 완료되었습니다.");
		kor_message.put("0216","");
		kor_message.put("0217","");
		
		
		/*kdj*/
		
		
		
		
	
		en_message.put("0214","Please enter a new phone number.");
		
		
		
		
		
		
		
		
		
		
		
		//////////영문////////////
		
		//1:좌석현황 2:전체 회원 목록 3:회원검색 4:회원정지 5:매출현황 6:쿠폰관리 0:로그아웃
		en_message.put("0000", "This account has been suspended.");
		en_message.put("0001","1:Sign-in  2:Sign-up  3:Seat status  4:한글로 보기(toggle)  -1:Finish");
		en_message.put("0002","1:My account  2:Season ticket  3:Time ticket  4:%s  5:Seat status  0:Sign-out  -1:Finish\n"); 
		/*dayeong*/
		en_message.put("0003","1:Seat status  2:Total membership list  3:Searching a specific member  4:Sale status  5:Coupon management  0:Log-out  -1: Finish"); 
		/*dayeong*/
		// en_message.put("0004","스터디 카페 방문을 환영합니다.^^;;");
		en_message.put("0005","The account list is empty");
		en_message.put("0006","Make your account");
		en_message.put("0007","Manager");
		en_message.put("0008","ID");
		en_message.put("0009","Entering");
		en_message.put("0010","PassWord");
		en_message.put("0011","Your account has been issued");
		en_message.put("0012","Enter your ID and PassWord");
		en_message.put("0013","Unmached ID/PassWord");
		en_message.put("0014","파일이 존재하지 않습니다.");
		en_message.put("0015","Finish");
		en_message.put("0016","파일을 읽을 수 없습니다.");
		en_message.put("0017","나머지 예외 : ");
		en_message.put("0018","Finish");
		en_message.put("0019"," has signed-in");
		en_message.put("0020","Select correctly");
		en_message.put("0021","관리자 페이지에 접속하였습니다.");
		en_message.put("0022","<< Sign-up >>");		
		en_message.put("0023","Name");
		en_message.put("0024","Birth(6 first digits of the personal id code)");
		en_message.put("0025","Phone number");
		en_message.put("0026","1:Changing password  2:Changing phone number  3:Payment details  4:Refund  0:Back  -1:Finish");
		en_message.put("0027","Entry");
		en_message.put("0028","Exit");
		
		en_message.put("0029","Room[%d]");
		en_message.put("0030", "Over the sign-in trying numbers. Enter the security code : ");
		en_message.put("0031", "Enter>>");
		en_message.put("0032", "Unmatched");
		en_message.put("0033", "Successfully confirmed");
//		kor_message.put("0023","생일");
//		kor_message.put("0023","생일");
//		kor_message.put("0023","생일");
//		kor_message.put("0023","생일");
		
		
		/*dhj*/ /*dayeong*/
		//1:좌석현황 2:전체 회원 목록 3:회원검색 4:매출현황 5:쿠폰관리 0:로그아웃
		en_message.put("0051", "Current seat status");  //1.좌석현황
		en_message.put("0052", "전체 회원 목록을 조회합니다."); //2.전체 회원 목록 //3.회원검색
		en_message.put("0053", "회원검색합니다. \n검색할 회원의 이름을 입력하세요."); //3.회원검색
		en_message.put("0054", "쿠폰을 관리합니다. \n 1:현재 발행된 쿠폰 확인  2:쿠폰 추가  3:쿠폰 삭제  0:뒤로가기 -1:종료"); //5.쿠폰관리
		en_message.put("0055", "현재 사용가능한 쿠폰 목록입니다.");//5.쿠폰발행 -> 1.현재 발행된 쿠폰 확인
		en_message.put("0056", "추가할 쿠폰의 번호와 할인율을 입력하세요. 추가를 원치 않으면 0을 입력하세요.");//5. 쿠폰발행 -> 2.쿠폰추가
		en_message.put("0057", "삭제할 쿠폰의 번호를 입력하세요. 삭제를 원치 않으면 0을 입력하세요.");//5.쿠폰발행 -> 3.쿠폰삭제
		en_message.put("0058","검색결과"); //3.회원 검색 - 회원검색결과
		en_message.put("0059","1:회원입퇴실내역조회 2:비밀번호 초기화 3.경고 4.정지 0:뒤로가기 -1:종료");//3.회원검색결과의 하위 옵션
		en_message.put("0060","이 회원에게 경고를 줍니까? 1:예 2:뒤로가기"); //3.회원 검색 -> 3.경고
		en_message.put("0061","경고를 주었습니다."); //3.회원검색 ->3.경고
		en_message.put("0062","해당 회원의 입퇴실내역입니다."); //3.회원 검색 -> 1.회원입퇴실내역조회
		en_message.put("0063","이 회원의 비밀번호를 초기화하겠습니까? 0000으로 초기화됩니다. 1:예 2:뒤로가기");//3.회원검색 -> 2.비밀번호 초기화
		en_message.put("0064","비밀번호가 초기화되었습니다.");//회원검색결과3번옵션-2
		en_message.put("0065", "매출 현황 입니다"); //4. 매출 현황
		en_message.put("0066","이 회원을 정지시킵니까? 1:예 2:뒤로가기"); //3.회원 검색 -> 4.정지 확인
		en_message.put("0067","이 회원의 권한을 정지하였습니다"); //3.회원 검색 -> 정지
		en_message.put("0068", "이 회원의 입퇴실 내역 입니다"); //3.회원검색 -> 1.회원의 입퇴실 내역
		//정기권 예약
		en_message.put("0100","Period of the ticket: \n 1: 2weeks(%s won) \n 2: 4weeks(%s won) \n 3: 8주권(%s원) \n 0: back \n");//정기권예약
		
		en_message.put("0102","%swon Would you buy this ticket? \n 1:Yes  2:Using a coupon! 0:back \n"); // 1,2,3 선택시
		
		 //1번 "예" 눌렀을 경우
		en_message.put("0103","%s You are authorized \n 1: Selecting a room \n %s \n"); //앞에 이름 붙혀주기
		en_message.put("0104","Select a seat  \n"); //앞에 이름 붙혀주기
		 //2번 "쿠폰이 있어요!" 눌렀을 경우
		en_message.put("0105","Enter the coupon code");
		en_message.put("0106","(coupon)How long would you reserve?");
		en_message.put("0107"," 1: 2weeks(%swon)\n 2: 4weeks(%swon)\n 3: 8weeks(%swon)\n 0: back \n");//이후 104번 출력
		en_message.put("0108"," 1: 2hours(%swon)\n 2: 4hours(%swon)\n 3: 7시간(%swon)\n 4: 9시간(%swon)\n 5: 12시간(%swon)\n 0: back \n");//이후 104번 출력
		en_message.put("0109"," Time ticket member should select a seat now");
		en_message.put("0110","Choose your seat\n");
		en_message.put("0111","Choose a room");
		/*GBJ*/
		
		/*kdj*/
		en_message.put("0200", "Hello :)");
		en_message.put("0201", "!\n Your ticket has ");
		en_message.put("0202", " hours left");
		en_message.put("0203"," 1:Changing password \n 2:refund \n 0:Back");
		en_message.put("0204","현재 비밀번호를 입력하세요.");
		en_message.put("0205","비밀번호를 다시 확인하세요.");
		en_message.put("0206","새 비밀번호를 입력하세요.");
		en_message.put("0207","비밀번호 변경이 완료되었습니다. ");
		en_message.put("0208","<Regulation of our refund>\n Season ticket can be refunded on a daily basis. \n Time ticket can be refunded on an hour basis");
		en_message.put("0209","Your valid refunding amount: ");
		en_message.put("0210","Would you refund it? \n 1. Yes \n 2. Back");
		en_message.put("0211","Successfully refunded \n Hopefully see you again \n Lovely thank you! ");
		en_message.put("","");
		en_message.put("","");
		en_message.put("","");
		en_message.put("","");
		en_message.put("","");
		en_message.put("","");

		en_message.put("0212","Enter your current phone numbers");
		en_message.put("0213","Check your numbers again");
		en_message.put("0214","Enter your new phone numbers.");
		en_message.put("0215","Successfully changed");
		kor_message.put("0216","");
		kor_message.put("0217","");

		
	}
	
	
	public String message(String language, String key) {
		init();
		String message="";
		if(room.language=="kor")
		{
			message = kor_message.get(key);
		}
		else {
			message = en_message.get(key);
		}
		return message;
	}
	
}
	