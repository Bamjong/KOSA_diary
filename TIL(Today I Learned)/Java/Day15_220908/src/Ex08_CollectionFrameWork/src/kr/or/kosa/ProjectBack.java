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
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
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