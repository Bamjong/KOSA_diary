# 📚 Day31_221005

Author: 고범종
Created Time: 2022년 10월 5일 오전 9:16
Status: 🖨 Published
Updated Time: 2022년 10월 5일 오후 8:10

# 1. JDBC

---

JDBC_Ex07_Transaction.java

## **하나의 DB서버를 공유해서 사용할 경우 생기는 문제점 ?**

- DML 작업을 하고 Commit 을 하지 않은 경우
    
    하나의 DB 서버를 사용할 경우
    한명의 사용자가 DML 작업을 한 경우 반드시   Commit , rollback  을 통해서 작업을 완료하자
    그렇지 않으면 다른 사용자는  DML 작업 불가 ....
    

## setAutoCommit

JDBC >> default(dml)) >> autocommit >> 실반영
JDBC >> autocommit >> 개발자 >> false >> 반드시 >> commit, rollback (강제성 부여)

- 기본적으로 JDBC를 사용할경우 DML작업을 할땐 자동적으로 commit이 된다.
하지만 ‘setAutoCommit(false)’ 작업을 통해 막아둔다면 강제로 commit or rollback을 사용하여야 한다.

- 예제코드 (Ex07_Transaction.java)
    
    ```jsx
    public class Ex07_Transaction {
    
    	public static void main(String[] args) {
    		Connection conn = null;
    		PreparedStatement pstmt = null;
    		PreparedStatement pstmt2 = null;
    		
    		conn = SingletonHelper.getConnection("oracle");
    		
    		String  sql="insert into trans_A(num,name) values(100,'A')";
    		String sql2="insert into trans_B(num,name) values(100,'B')";
    		
    		try {
    			 //둘다 성공 아니면 둘다 실패 (하나의 논리적 단위)
    			 conn.setAutoCommit(false); //JDBC 개발자 (commit or rollback)
    			 //begin tran
    			  pstmt = conn.prepareStatement(sql);
    			  pstmt.executeQuery();
    			 
    			  pstmt2 = conn.prepareStatement(sql2);
    			  pstmt2.executeQuery();
    			 //end tran
    			 conn.commit(); //둘다 정상적으로 실행되고 예외가 발생되지 않으면 :commit
    			 
    		} catch (Exception e) {
    			System.out.println("문제발생 : " + e.getMessage());
    			try {
    				conn.rollback(); //둘다 취소
    			} catch (SQLException e1) {
    				e1.printStackTrace();
    			}
    		}finally {
    			SingletonHelper.close(pstmt);
    			SingletonHelper.close(pstmt2);
    		}
    	}
    }
    ```
    

## DAO, DTO, VO

- **DAO**
    
    **Data Access Object** 
    
    데이터베이스의 data에 접근하기 위한 객체입니다. **DataBase에 접근 하기 위한 로직 & 비지니스 로직**을 분리하기 위해 사용합니다.
    
    > DAO 클래스 설계하기
    Data Acesse Object
    > 
    > 1. DB연결
    > 2. CRUD 구현
    > 3. 기본적으로 함수 5개를 만듬 (하나의 테이블에 대해서)
    > 3.1 전체조회, 조건조회, 삽입, 수정, 삭제 기능
    
- **DTO**
    
    **Data Transfer Object**
    
    계층 간 데이터 교환을 하기 위해 사용하는 객체로, DTO는 로직을 가지지 않는 순수한 데이터 객체(getter & setter 만 가진 클래스)입니다.
    
    해당 DTO를 받은 서버가 DAO를 이용하여 데이터베이스로 데이터를 집어넣습니다.
    
    > DTO(VO), DOMAIN 클래스
    데이터를 1건 담을 수 있는 클래스
    DB 테이블과 1:1 매핑구조
    DB에 dept 테이블의 1건 row 담을 수 있는 클래스
    > 
    
- **VO**
    
    **Value Object**
    
    값 오브젝트로써 값을 위해 쓰입니다.
    
    DTO와 유사하지만 DTO는 setter를 가지고 있어 값이 변할 수 있습니다.
    

## JDBC 초급자 과제

JDBC_Tier (Program_Emp.java, EmpDao.java, Emp.java, SingletonHelper.java)

[문제]

```
create table sdept
as
   select * from dept;

sdept 테이블에 대해서
전체조회
조건조회
삽입
삭제
수정
을 작업 하시면 됩니다
PreparedStatement
```

- [Program_Emp.java]
    
    ```java
    import java.util.Calendar;
    import java.util.Date;
    import java.util.List;
    
    import DAO.EmpDao;
    import DTO.Emp;
    
    /*
    MVC 패턴
    >>잘하는 것만 해 
    
    Model  : 데이터 java
    View   : 화면   >> jsp
    Controller: 조정 (제어) >> servlet
    
    jsp ,servlet , java .....
    
    Model : dto(vo) , dao  >> java
    View  : java (console)
    ...
    
    */
    public class Program_Emp {
    
    	public static void main(String[] args) {
    		//main 함수 (View) 영역
    		
    		//DAO객체 요청
    		EmpDao dao = new EmpDao(); //6개의 함수
    		Date nowDate = new Date();
    		int row = 0;
    		
    		Calendar cal = Calendar.getInstance();
    		
    		
    		
    		System.out.println("[전체조회]*******");
    		List<Emp> emplist =dao.getEmpAllList();
    		//화면구성
    		if(emplist != null) {
    			empPrint(emplist);
    		}
    		//조건조회
    		System.out.println("[조건조회]*******");
    		Emp emp =dao.getEmpListByEmpno(7934);
    		if(emp != null) {
    			empPrint(emp);
    		}else {
    			//.....
    		}
    		
    		System.out.println("[데이터 삽입]*******");
    		Emp insertemp = new Emp();
    		
    		insertemp.setEmpno(555);
    		insertemp.setEname("KOKO");
    		insertemp.setJob("Hustler");
    		insertemp.setMgr(9999);
    	
    	    insertemp.setHiredate(cal.getTime());
    
    		insertemp.setSal(7777);
    		insertemp.setComm(200);
    		insertemp.setDeptno(10);
    		
    		row = dao.insertEmp(insertemp);
    		if(row > 0) {
    			System.out.println("insert rowcount : " + row);
    		}
    		
    		System.out.println("[방금전 insert 데이터 전체조회]*******");
    		emplist =dao.getEmpAllList();
    		//화면구성
    		if(emplist != null) {
    			empPrint(emplist);
    		}
    		
    		System.out.println("[방금전 insert 데이터 수정하기]*******");
    		Emp updateemp = new Emp();
    		updateemp.setEname("GOGO");
    		updateemp.setJob("Homeless");
    		updateemp.setSal(777);
    		updateemp.setHiredate(cal.getTime());
    		updateemp.setEmpno(555);
    		
    		row = dao.updateEmp(updateemp);
    		if(row > 0) {
    			System.out.println("update rowcount : " + row);
    		}
    		
    		System.out.println("[방금전 update 데이터 전체조회]*******");
    		emplist =dao.getEmpAllList();
    		//화면구성
    		if(emplist != null) {
    			empPrint(emplist);
    		}
    		
    //		System.out.println("[방금전 update 데이터 삭제하기]*******");
    //		row = dao.deleteEmp(555);
    //		if(row > 0) {
    //			System.out.println("delete rowcount : " + row);
    //		}
    		
    		System.out.println("[방금전 delete 데이터 전체조회]*******");
    		emplist =dao.getEmpAllList();
    		//화면구성
    		if(emplist != null) {
    			empPrint(emplist);
    		}
    		
    		System.out.println("[like] 라이크ㅡㅡ으");
    		emplist = dao.getEmpListByEname("FORD");
    		
    		if(emplist != null) {
    			empPrint(emplist);
    		}
    	}
    	public static void empPrint(Emp emp) {
    		System.out.println(emp.toString());
    	}
    	public static void empPrint(List<Emp> list) {
    		for(Emp data : list) {
    			System.out.println(data.toString());
    		}
    	}
    
    }
    ```
    

- [EmpDao.java]
    
    ```java
    package DAO;
    
    import java.sql.Connection;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.text.SimpleDateFormat;
    import java.util.ArrayList;
    import java.util.List;
    
    import DTO.Emp;
    import UTILS.SingletonHelper;
    public class EmpDao {
    	Connection conn = null;
    	public EmpDao() {
    		conn = SingletonHelper.getConnection("oracle");
    	}
    	
    	//전체조회
    	public List<Emp> getEmpAllList(){
    		PreparedStatement pstmt = null;
    		ResultSet rs = null;
    		
    		//Point
    		List<Emp> emplist = new ArrayList<Emp>();
    	    
    		try {
    	           String sql="select * from emp";
    	           pstmt = conn.prepareStatement(sql);
    	           rs = pstmt.executeQuery();
    	            
    	           if (rs.next()) { //최소 1건
    	        	   do {
    	            	Emp emp = new Emp();
    	            	
    	            	emp.setEmpno(rs.getInt("empno"));
    	            	emp.setEname(rs.getString("ename"));
    	            	emp.setJob(rs.getString("job"));
    	            	emp.setMgr(rs.getInt("mgr"));
    	            	emp.setHiredate(rs.getDate("hiredate"));
    	            	emp.setSal(rs.getInt("sal"));
    	            	emp.setComm(rs.getInt("comm"));
    	            	emp.setDeptno(rs.getInt("deptno"));
    	            	
    	            	
    	            	
    	            	emplist.add(emp); // 배열에 객체 담기
    					} while (rs.next());
    	        	   
    	         }else { System.out.println("조회된 데이터가 없습니다."); }
    
    	         } catch (Exception e) {
    	            
    	         }finally {
    	            SingletonHelper.close(rs);
    	            SingletonHelper.close(pstmt);
    	         }
    		     
    	       return emplist;
    	}
    	
    	//조건조회
    	public Emp getEmpListByEmpno(int empno) {
    		PreparedStatement pstmt = null;
    		ResultSet rs = null;
    		Emp emp = null;
    
    		try {
    			String sql = "select empno,ename,job,mgr,hiredate,sal,comm,deptno from emp where empno=?";
    			pstmt = conn.prepareStatement(sql);
    			
    			pstmt.setInt(1, empno);
    			
    			rs = pstmt.executeQuery();
    
    			while (rs.next()) {
    				emp = new Emp();
                	
                	emp.setEmpno(rs.getInt("empno"));
                	emp.setEname(rs.getString("ename"));
                	emp.setJob(rs.getString("job"));
                	emp.setMgr(rs.getInt("mgr"));
                	emp.setHiredate(rs.getDate("hiredate"));
                	emp.setSal(rs.getInt("sal"));
                	emp.setComm(rs.getInt("comm"));
                	emp.setDeptno(rs.getInt("deptno"));
    			}
    		} catch (Exception e) {
    			System.out.println(e.getMessage());
    		} finally {
    			SingletonHelper.close(rs);
    			SingletonHelper.close(pstmt);
    		}
    
    		return emp;
    	}
    	
    	//데이터 삽입
    	public int insertEmp(Emp emp) {
    		PreparedStatement pstmt = null;
    		ResultSet rs = null;
    		
    		int row = 0;
    		
    		try {
    	           String sql="insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) values(?,?,?,?,?,?,?,?)";
    	           pstmt = conn.prepareStatement(sql);
    	           
    	           pstmt.setInt(1, emp.getEmpno());
    		       pstmt.setString(2, emp.getEname());
    		       pstmt.setString(3, emp.getJob());
    	           pstmt.setInt(4, emp.getMgr());
    	           
    	           SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
    	           String date = dateformat.format(emp.getHiredate());
    	           pstmt.setDate(5, java.sql.Date.valueOf(date));
    	           
    	           pstmt.setInt(6, emp.getSal());
    	           pstmt.setInt(7, emp.getComm());
    	           pstmt.setInt(8, emp.getDeptno());
    		       
    	           row = pstmt.executeUpdate();
    	            
    	         }catch (Exception e) {
    	            
    	         }finally {
    	            SingletonHelper.close(rs);
    	            SingletonHelper.close(pstmt);
    	         }
    		
    		return row;
    	}
    	
    	
    	//데이터 삭제
    	public int deleteEmp(int empno) {
    		PreparedStatement pstmt = null;
    		
    		int row = 0;
    	      
            try {
               String sql="delete from emp where empno=?";
               pstmt = conn.prepareStatement(sql);
               
    	       pstmt.setInt(1, empno);
               
               row = pstmt.executeUpdate();
                
             }catch (Exception e) {
                
             }finally {
                SingletonHelper.close(pstmt);
             }
           return row;
    	}
    	
    	//데이터 수정
    	public int updateEmp(Emp emp) {
    		PreparedStatement pstmt = null;
    		ResultSet rs = null;
    		
    		int row = 0;
    	      
            try {
               String sql="update emp set ename=? , job=? , sal=? , hiredate=?  where empno=?";
               pstmt = conn.prepareStatement(sql);
               
               pstmt.setString(1, emp.getEname());
    	       pstmt.setString(2, emp.getJob());
    	       pstmt.setInt(3, emp.getSal());
    	    
    	       SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
               String date = dateformat.format(emp.getHiredate());
               pstmt.setDate(4, java.sql.Date.valueOf(date));
    
    	       pstmt.setInt(5, emp.getEmpno());
    	       
               row = pstmt.executeUpdate();
                
             }catch (Exception e) {
                
             }finally {
                SingletonHelper.close(rs);
                SingletonHelper.close(pstmt);
             }
           return row;
    	}
    	
    	//like 이름검색
    	public List<Emp> getEmpListByEname(String ename){
    	      PreparedStatement pstmt = null;
    	      ResultSet rs = null;
    	      List<Emp> emplist = new ArrayList<Emp>();
    	      
    	      try {
    	         String sql = "select * from emp where ename like ?";
    	         pstmt = conn.prepareStatement(sql);
    	         
    	         pstmt.setString(1, "%" + ename + "%"); //'%?%'
    	         
    	         rs = pstmt.executeQuery();
    	         
    	         if(rs.next()) {
    	            do {
    	               Emp emp = new Emp();
    	               emp.setEmpno(rs.getInt("empno"));
    	               emp.setEname(rs.getString("ename"));
    	               emp.setJob(rs.getString("job"));
    	               emp.setMgr(rs.getInt("mgr"));
    	               emp.setHiredate(rs.getDate("hiredate"));
    	               emp.setSal(rs.getInt("sal"));
    	               emp.setComm(rs.getInt("comm"));
    	               emp.setDeptno(rs.getInt("deptno"));
    
    	               emplist.add(emp);
    	            }while(rs.next());
    	         }else {
    	            System.out.println("조회 데이터 없음");
    	         }
    	         
    	      } catch (Exception e) {
    	         System.out.println(e.getMessage());
    	      } finally {
    	         SingletonHelper.close(rs);
    	         SingletonHelper.close(pstmt);
    	      }
    
    		return emplist;
    	}
    }
    ```
    

- [Emp.java]
    
    ```java
    package DTO;
    
    import java.util.Date;
    
    /*
    EMPNO    NOT NULL NUMBER       
    ENAME             VARCHAR2(10) 
    JOB               VARCHAR2(9)  
    MGR               NUMBER       
    HIREDATE          DATE         
    SAL               NUMBER       
    COMM              NUMBER       
    DEPTNO            NUMBER       
    
     */
    public class Emp {
    	private int empno;
    	private String ename;
    	private String job;
    	private int mgr;
    	private Date hiredate;
    	private int sal;
    	private int comm;
    	private int deptno;
    	
    	public int getEmpno() {
    		return empno;
    	}
    	public void setEmpno(int empno) {
    		this.empno = empno;
    	}
    	public String getEname() {
    		return ename;
    	}
    	public void setEname(String ename) {
    		this.ename = ename;
    	}
    	public String getJob() {
    		return job;
    	}
    	public void setJob(String job) {
    		this.job = job;
    	}
    	public int getMgr() {
    		return mgr;
    	}
    	public void setMgr(int mgr) {
    		this.mgr = mgr;
    	}
    	
    	public Date getHiredate() {
    		return hiredate;
    	}
    	public void setHiredate(Date hiredate) {
    		this.hiredate = hiredate;
    	}
    	public int getSal() {
    		return sal;
    	}
    	public void setSal(int sal) {
    		this.sal = sal;
    	}
    	public int getComm() {
    		return comm;
    	}
    	public void setComm(int comm) {
    		this.comm = comm;
    	}
    	public int getDeptno() {
    		return deptno;
    	}
    	public void setDeptno(int deptno) {
    		this.deptno = deptno;
    	}
    	@Override
    	public String toString() {
    		return "Emp [empno=" + empno + ", ename=" + ename + ", job=" + job + ", mgr=" + mgr + ", hiredate=" + hiredate
    				+ ", sal=" + sal + ", comm=" + comm + ", deptno=" + deptno + "]";
    	}
    	
    	
    	
    }
    ```
    

java build path 잡아줘야함!

[SingletonHelper.java](http://SingletonHelper.java)를 이용하였음

혹시모를 소스추가

- [SingletonHelper.java]
    
    ```java
    package UTILS;
    
    import java.sql.Connection;
    import java.sql.DriverManager;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.sql.Statement;
    
    //조별 문제
    //ConnectionHelper 코드는 singleton으로 바꾸세요 ^^
    public class SingletonHelper {
    	private static Connection conn = null; //public > private
    	private SingletonHelper() {}
    
    	public static Connection getConnection(String dsn) {
    		if(conn != null) {
    			//System.out.println("conn is not null");
    			return conn;
    		}
    		try {
    			  if(dsn.equals("oracle")) {
    				  Class.forName("oracle.jdbc.OracleDriver");
    				  conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","KOSA","1004");
    			  }else if(dsn.equals("mysql")) {
    				  Class.forName("com.mysql.cj.jdbc.Driver");
    				  conn = DriverManager.getConnection("jdbc:mysql://192.168.0.3:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true","kosta","1004");
    			  }
    
    		}catch(Exception e) {
    			System.out.println(e.getMessage());
    		}
    		//System.out.println("conn return");
    		return conn; 
    	}
    
    	
    
    	public static void dbClose() {
    		if(conn != null) {
    			try {
    				 conn.close();//연결해제 (DB 연결 끊기)
    				 conn = null; //참조를  null 만는다  
    			}catch(Exception e) {
    				System.out.println(e.getMessage());
    			}
    		}
    	}
    
         public static void close(Connection conn) {
    
    		if(conn != null) {
    			try {
    				conn.close();
    			}catch(Exception e) {
    				System.out.println(e.getMessage());
    			}
    		}
    	}
    
    	
    	public static void close(Statement stmt) {
    		if(stmt != null) {
    			try {
    				stmt.close();
    			}catch(Exception e) {
    				System.out.println(e.getMessage());
    			}
    		}
    	}
    
    	public static void close(ResultSet rs) {
    		if(rs != null) {
    			try {
    				rs.close();
    			}catch(Exception e) {
    				System.out.println(e.getMessage());
    			}
    		}
    	}
    
    	public static void close(PreparedStatement pstmt) {
    		if(pstmt != null) {
    			try {
    				pstmt.close();
    			}catch(Exception e) {
    				System.out.println(e.getMessage());
    			}
    		}
    	}
    }
    ```
    

# 2. MVC 패턴

[mvc 모델 1]

![https://user-images.githubusercontent.com/92353613/193960032-191b0993-2668-488d-ad2b-2348358f398a.png](https://user-images.githubusercontent.com/92353613/193960032-191b0993-2668-488d-ad2b-2348358f398a.png)

[mvc 모델 2]

![https://user-images.githubusercontent.com/92353613/193960172-cd44f511-1142-4f14-929f-5daafeba1f4b.png](https://user-images.githubusercontent.com/92353613/193960172-cd44f511-1142-4f14-929f-5daafeba1f4b.png)

**※ DTO(Data Transfer Object) : 데이터 전송을 위한 개체**

- 개발기간이 짧은 소규모 프로젝트나, 변경사항이나 요구사항이 적을경우 빠르게 개발할 수 있다는 장점이 있다.

---

### MVC 패턴이란

- 애플리케이션을 크게 Model, View, Controller의 세 영역으로 구분하여 영역 간의 결합도를 소화한 패턴이다. 주로 웹 애플리케이션에서 사용되며, 일반 애플리케이션에서도 사용된다.
- **MVC 패턴의 가장 중요한 장점 중 하나는 비즈니스 로직과 프리젠테이션 로직이 분리되었다는 것이다.**
- **즉, 디자이너와 개발자들의 영역이 분리됨으로써 서로 각자의 영역에 더 집중할 수 있다는 장점이 있다.**

MVC 패턴

> 잘 하는것만 해
> 

Model	: 데이터
View	: 화면
Control	: 조정 (제어)

# 3. 데이터베이스 모델링

---

### 개념

- 현실 세계의 업무적인 프로세서를 물리적으로 데이터베이스화 한 것.
- 설계의 단계에서 개념적 모델링을 하여 ER다이어그램을 도출하고 이를 이용하여 관계 스키마 모델을 도출하고 이를 물리적 모델링하여 관계 스키마를 도출해냅니다.

### 진행 과정

계획 - 분석 - 설계 - 구현 - 테스트 - 유지보수

### [3가지 모델링]

- 개념적 모델링: 개체와 개체들 간의 관계에서 ER다이어그램을 만드는 과정
- 논리적 모델링: ER다이어그램을 사용하여 관계 스키마 모델을 만드는 과정
- 물리적 모델링: 관계 스키마 모델의 물리적 구조를 정의하고 구현하는 과정

[ER-다이어그램]

![https://user-images.githubusercontent.com/92353613/194002234-df47da13-a4a9-4228-a193-11b2c90c1ee5.png](https://user-images.githubusercontent.com/92353613/194002234-df47da13-a4a9-4228-a193-11b2c90c1ee5.png)