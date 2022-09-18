# Collection 사용한 은행관리 조별 과제
    generic 기능 사용가능

    Calendar 는 찿아서 처리

    ​

    Bank 클래스

    Account 클래스 

    Transaction 클래스

    main 함수 클래스 

    ​

    4개의 클래스 만들어서 사용하세요

    ​

    시나리오

    은행은 계좌를 관리한다.

    은행은 계좌를 등록한다.

    은행은 계좌번호로 계좌를 찾을 수 있다.

    은행은 계좌의 소유자명으로 계좌를 찾을 수 있다.

    은행은 모든 계좌의 목록을 볼 수 있다.

    계좌는 소유자명, 계좌번호, 잔고로 구성된다.

    계좌는 입금,출금 기능과 잔고확인 기능이 있다.

    계좌에서 잔액의 변화가 있을 때마다 입출금 명세에 기록된다.

    입출금 명세는 거래일자, 거래시간, 입금/출금, 금액, 잔액으로 구성된다.

    클래스 다이어그램

    시나리오로부터 클래스와 필드, 메소드를 추출해 내어야 한다.

    시나리오에서 명사에 해당하는 것이 클래스나 필드로, 동사에 해당하는 것이 메소드가 될 것이다.

<br><br>

![이미지](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Flh3.googleusercontent.com%2F-Dgg4barA3Sk%2FVX_qKuvc-LI%2FAAAAAAAACLI%2F9r_JG99thNs%2Fw617-h526-no%2Fbank-classdiagram.png%22&type=cafe_wa740)

![이미지](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Flh4.googleusercontent.com%2F-7_W2KsCUQSU%2FVX_qK5Qp9gI%2FAAAAAAAACLM%2F5EQN6xP4NXo%2Fw814-h526-no%2Fbank-classdiagram2.png%22&type=cafe_wa740)

클래스 다이어그램은 클래스의 구조뿐만 아니라 객체와 객체간의 관계를 나타낸다.

클래스 다이어그램에서 두 클래스가 선으로 연결되어 있다면 두 클래스로부터 생성된 객체들은 서로 관계가 있다.

속이 찬 다이아몬드는 객체가 다른 객체를 부품처럼 가지고 있는 관계를 나타낸다.2

0이나 *는 부품처럼 쓰는 객체의 최대 갯수로. 0..*는 0개 이상을 의미한다.

화살표는 객체가 다른 객체의 메소드를 호출하는 방향이다.

​

결과화면

= 전체 계좌 목록 =

[계좌번호 :10071, 소유자 명 : 백, 잔액 : 0]

[계좌번호 :890113, 소유자 명 : 택, 잔액 : 0]

[계좌번호 :0113, 소유자 명 : 택, 잔액 : 0]

[계좌번호 :987654321, 소유자 명 : 두팔, 잔액 : 0]

​

= 해당 계좌번호의 계좌정보 =

[계좌번호 :890113, 소유자 명 : 택, 잔액 : 0]

​

200000원 입금하셨습니다.

현재 잔액은 200000원 입니다.

​

= 해당 계좌번호의 계좌정보 =

[계좌번호 :890113, 소유자 명 : 택, 잔액 : 200000]

​

200000원 입금하셨습니다.

현재 잔액은 400000원 입니다.

​

= 해당 계좌번호의 계좌정보 =

[계좌번호 :890113, 소유자 명 : 택, 잔액 : 400000]

​

​

= 해당 소유자명의 계좌 목록 =

[계좌번호 :890113, 소유자 명 : 택, 잔액 : 400000]

[계좌번호 :0113, 소유자 명 : 택, 잔액 : 0]

​

= 해당 계좌번호의 계좌정보 =

​

= 해당 소유자명의 계좌 목록 =

​

= 해당 계좌번호의 계좌정보 =

[계좌번호 :890113, 소유자 명 : 택, 잔액 : 400000]

​

5500원 인출하셨습니다.

현재 잔액은 394500원 입니다.

​

= 해당 계좌번호의 계좌정보 =

[계좌번호 :890113, 소유자 명 : 택, 잔액 : 394500]

​

= 거래 내역 =

[거래금액:200000, 잔액:200000원 /2020년08월26일11시53분]

[거래금액:200000, 잔액:400000원 /2020년08월26일11시53분]

[거래금액:5500, 잔액:394500원 /2020년08월26일11시53분]

​

---------------------------------------------------------------------------------------------------

또는

​

1111라는 계좌번호를 가진 사람의 계좌

Account [accountNo=1111, name=강감찬, balance=0, transactions=[]]

유관순 이라는 이름을 가진 사람의 계좌

[Account [accountNo=2222, name=유관순, balance=0, transactions=[]], Account [accountNo=3333, name=유관순, balance=0, transactions=[]]]

​

전체 계좌 목록

Account [accountNo=1111, name=강감찬, balance=0, transactions=[]]

Account [accountNo=2222, name=유관순, balance=0, transactions=[]]

Account [accountNo=3333, name=유관순, balance=0, transactions=[]]

강감찬

6000

3000

Account [accountNo=1111, name=강감찬, balance=3000, transactions=[Transaction [transactionDate=2020/08/26, transactionTime=11:53:59 오전, kind=입금, amount=1000, balance=1000], Transaction [transactionDate=2020/08/26, transactionTime=11:53:59 오전, kind=입금, amount=2000, balance=3000], Transaction [transactionDate=2020/08/26, transactionTime=11:53:59 오전, kind=입금, amount=3000, balance=6000], Transaction [transactionDate=2020/08/26, transactionTime=11:53:59 오전, kind=출금, amount=3000, balance=3000]]]

​

Transaction [transactionDate=2020/08/26, transactionTime=11:53:59 오전, kind=입금, amount=1000, balance=1000]

Transaction [transactionDate=2020/08/26, transactionTime=11:53:59 오전, kind=입금, amount=2000, balance=3000]

Transaction [transactionDate=2020/08/26, transactionTime=11:53:59 오전, kind=입금, amount=3000, balance=6000]

Transaction [transactionDate=2020/08/26, transactionTime=11:53:59 오전, kind=출금, amount=3000, balance=3000]

​
```java
        Bank bank = new Bank();
        // 은행은 계좌를 등록한다.
        bank.addAcount("1111", "kim");
        bank.addAcount("2222", "lee");
        bank.addAcount("3333", "park");
        bank.addAcount("4444", "hong");
        bank.addAcount("5555", "hong");
        bank.addAcount("6666", "kim");
        bank.addAcount("7777", "lee");
        
        //은행은 계좌번호로 계좌를 찾을 수 있다.
        System.out.println("***계좌번호가 2222인 계좌 조회***");
        Account getAccount = bank.getAccount("2222");
        System.out.println(getAccount);
        
        //은행읜 계좌의 소유자명으로 계좌를 찾을 수 있다.
        System.out.println("\n***이름이 hong인 사람의 계좌 조회***");
        ArrayList<Account> findAccount = bank.findAccounts("hong");
        for(Account a : findAccount) {
            System.out.println(a);
        }
        
        //은행은 모든 계좌의 목록을 볼 수 있다.
        System.out.println("\n***모든 계좌 목록 조회***");
        ArrayList<Account> accounts = bank.getAccounts();
        for(Account a : accounts) {
            System.out.println(a);
        }
        
        //계좌는 입금, 출금 기능과 잔고 확인 기능이 있다.
        System.out.println("\n***계좌번호가 1111인 계좌에 5만원 입금***");
        Account kim = bank.getAccount("1111");
        kim.deposit(50000);
        System.out.println(kim);
        
        System.out.println("\n***계좌번호가 1111인 계좌에 2만원 출금***");
        kim.withdraw(20000);
        System.out.println(kim);
        
        System.out.println("\n***계좌번호가 1111인 계좌에 5000원 출금***");
        kim.withdraw(5000);
        System.out.println(kim);
        
        System.out.println("\n***계좌번호가 1111인 계좌의 잔고 확인하기***");
        System.out.println("kim 님의 \'1111\' 계좌 잔액: " + kim.getBalance());
        
        //계좌에서 잔액의 변화가 있을 때 마다 입출금 명세에 기록된다.
        //입출금 명세는 거래일자, 거래시간, 입금/출금, 금액, 잔액으로 구성된다.
        System.out.println("\n***계좌번호가 1111인 계좌의 거래내역 확인하기***");
        ArrayList<Transaction> kimTransaction = kim.getTransaction();
        for(int i = 0; i <= kim.getNum(); i++) {
            System.out.println(kimTransaction.get(i));
        }
        
        System.out.println("\n***계좌번호가 1111인 계좌에 잔고 초과해서 출금시도해보기***");
        kim.withdraw(100000);
```

<details>
<summary>코드</summary>

```java
package kr.or.kosa;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

class Bank {
	//Composition은 클래스 간에 포함(composite) 관계를 맺어주는 것,
	//즉, 한 클래스의 멤버변수로 다른 클래스 타입의 참조 변수를 선언하는 것을 의미한다.
	
	private int totalAccount = 0;
	private List<Account> accounts = new ArrayList<Account>();
	

	void addAccount(String accountNo, String name) {
		Account account;
		accounts.add(new Account(accountNo, name));
		
		totalAccount++;
	}
	
	Account getAccount(String accountNo) {
		Account account = null;
		//getter
		//accountNo를 파라미터로 받아서 해당 파라미터의 값을 가지는 계좌를 찾아 반환
//		Account value = new Account(accountNo, accountNo); //파라미터를 이렇게 해야되나????
		for(Account value1 : accounts) {
			if(value1.getAccountNo().equals(accountNo))
			{
				return value1;
			}
		}
		return account;
	}
	
	List<Account> findAccounts(String name){ //이름의 계좌를 찾는 메소드
		List<Account> nameList = new ArrayList<Account>();
		for(Account value : accounts) {
			if(value.getName().equals(name)) {
				//같은 이름
				nameList.add(value);
			}
		}
		return nameList;
		
	}
	
	List<Account> getAccounts(){ // 전체계좌목록 반환
		return accounts;
	}
	
	int getTotalAccount() {	//총 계좌 개수 리턴
		return accounts.size();
	}	
}

class Account{
	Calendar today = Calendar.getInstance();
	
	private String accountNo;
	private String name;
	private long balance = 0;
	
	public Account(String accountNo, String name){
		this.accountNo = accountNo;
		this.name = name;
	}
	
	List<Transaction> T = new ArrayList<Transaction>();
	
	void deposit(long amount) {
		//입금
		balance += amount;
//		Transaction t = new Transaction(String.valueOf(today.get(Calendar.YEAR))+today.get(Calendar.MONTH)+today.get(Calendar.DATE), String.valueOf(today.get(Calendar.HOUR_OF_DAY))+today.get(Calendar.MINUTE), amount, balance);
		Transaction t = new Transaction(String.valueOf(today.get(Calendar.YEAR))+"년"+today.get(Calendar.MONTH)+"월"+today.get(Calendar.DATE)+"일",String.valueOf(today.get(Calendar.HOUR_OF_DAY))+"시"+today.get(Calendar.MINUTE)+"분","입금", amount, balance);
		T.add(t);
	};
	void withdraw(long amount) {
		//출금
		//Transaction(String transactionDate, String transactionTime, String kind, long amount, long balance)
		balance = balance - amount;
		Transaction t = new Transaction(String.valueOf(today.get(Calendar.YEAR))+"년"+today.get(Calendar.MONTH)+"월"+today.get(Calendar.DATE)+"일",String.valueOf(today.get(Calendar.HOUR_OF_DAY))+"시"+today.get(Calendar.MINUTE)+"분","출금", amount, balance);
		T.add(t);
	}
	long getBalance() {
		return balance;
	}

	List<Transaction> getTransactions(){
		return T;
	}
	
	//getter setter?
	public String getAccountNo() {
		return accountNo;
	}
	
	public String getName() {
		return name;
	}

	@Override
	public String toString() {
		return "[계좌번호" + accountNo + " 계좌주:" + name + " 잔고:" + balance + "]\n";
	}

	
}

class Transaction{
	private String transactionDate;
	private String transactionTime;
	private String kind;
	private long amount;
	private long balance;
	
	public Transaction(String transactionDate, String transactionTime, String kind, long amount, long balance) {
		this.transactionDate = transactionDate;
		this.transactionTime = transactionTime;
		this.kind = kind;
		this.amount = amount;
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "거래일자:" + transactionDate + " 거래시간:" + transactionTime + ", "+ kind +" 거래금액:"
				+ amount + " 현재잔액:" + balance + "\n";
	}
	
	
}

public class ProjectBack{
	public static void main(String[] args) {
		
		Bank bank = new Bank();
		bank.addAccount("1111", "kim");
	    bank.addAccount("2222", "lee");
	    bank.addAccount("3333", "park");
	    bank.addAccount("4444", "hong");
	    bank.addAccount("5555", "hong");
	    bank.addAccount("6666", "kim");
	    bank.addAccount("7777", "lee");
	    System.out.print("총 계좌 개수 ");
	    System.out.println(bank.getTotalAccount());
	    
	    System.out.print("\n3333이 계좌번호인 계좌 정보 ");
	    System.out.println(bank.getAccount("3333"));
	    System.out.println("\n***이름이 hong인 사람의 계좌 조회***");
        List<Account> findAccount = bank.findAccounts("hong");
        for(Account a : findAccount) {
            System.out.println(a);
        }
		System.out.println("\n***전체 계좌 조회***");
		System.out.println(bank.getAccounts().toString());
//		
		bank.getAccount("1111").deposit(2000);
		bank.getAccount("1111").deposit(2000);
		bank.getAccount("1111").deposit(2000);
		bank.getAccount("1111").withdraw(1000);

//		System.out.println(bank.getAccount("1111"));
//		System.out.println("계좌번호 1111의 거래내역");
//		System.out.println(bank.getAccount("1111").getTransactions());
//
//		System.out.println();
//		bank.getAccount("2222").deposit(3000);
//		bank.getAccount("2222").deposit(10000);
//		bank.getAccount("2222").deposit(2000);
//		bank.getAccount("2222").withdraw(1000);
//
//		System.out.println(bank.getAccount("2222"));
//		System.out.println("계좌번호 2222의 거래내역");
//		System.out.println(bank.getAccount("2222").getTransactions());
		Account kim = bank.getAccount("1111");
		List<Transaction> kimTransaction = kim.getTransactions();
	        for(int i = 0; i < kimTransaction.size(); i++) {
	            System.out.println(kimTransaction.get(i));
	        }
	}
}

```
</div>
</details>
