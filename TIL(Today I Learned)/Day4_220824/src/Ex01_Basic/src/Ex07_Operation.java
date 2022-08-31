
public class Ex07_Operation {

	public static void main(String[] args) {
		/*
		 * 	대입연산자
		 *  += , -= , *=, /=
		 */
		
		/*
		 * 간단한 학점 계산기
		 * 학점: A+ , A- , B+ , B- , .....F
		 * 점수 : 94
		 * 
		 * 판단기준 90점이 이상인지 >> A 부여
		 * 판단 95점 이상 >> A+
		 * 아니라면 >> A-
		 * 
		 * 84 일단 80점이 이상 > B
		 * 판단 85 이상 >> B+
		 * 아니라면 >> B-
		 * 
		 * if문을 사용해서 학점 계산을 하세요
		 */
		System.out.println("'C' 이하는 다 'F' 입니다.");
		
		
		int score = (int)(Math.random() * 100);
		String grade = ""; //A+, A- 를 담는 변수
		System.out.println("당신의 점수는 : " + score);
		
		grade = score >= 95 ? "A+" :
			score >= 90 ? "A-" :
			score >= 85 ? "B+" :
			score >= 80 ? "B-" : "F";

			System.out.println("당신의 등급은: " + grade);
			


		}

	}


		
		
		
		// 제일 간단하게

//		if (score >= 95) {
//			grade = "A+";
//		} else if (score >= 90) {
//			grade = "A-";
//		} else if (score >= 85) {
//			grade = "B+";
//		} else if (score >= 80) {
//			grade = "B-";
//		}
		
//////////////////////////////////////////////////////////////////		

		// if if
		
//		if (score >= 90) {
//			if (score >= 95) {
//				grade = "A+";
//			} else {
//				grade = "A-";
//			}
//		} else if (score >= 80) {
//			if (score >= 85) {
//				grade = "B+";
//			} else {
//				grade = "B-";
//			}
//		}
		
//////////////////////////////////////////////////////////////////	
//////////////////////////////////////////////////////////////////			

		//if + 삼항연산
				
//		if(score >= 90) {
//				grade="A";
//				grade = (score>=95) ? (grade+="+") :(grade+="-");
//			}else if (score >= 80){
//				grade="B";
//				if(score >= 85) {
//					grade+="+";
//				}else {
//					grade+="-";
//				}
//			}else if (score >= 70) {
//				grade="C";
//				if(score >= 75) {
//					grade+="+";
//				}else {
//					grade+="-";
//				}
//			}else {
//				grade="F";
//			}
		
//////////////////////////////////////////////////////////////////				
