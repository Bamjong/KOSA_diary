# π Day31_221005

Author: κ³ λ²μ’
Created Time: 2022λ 10μ 5μΌ μ€μ  9:16
Status: π¨ Published
Updated Time: 2022λ 10μ 5μΌ μ€ν 8:10

# 1. JDBC

---

JDBC_Ex07_Transaction.java

## **νλμ DBμλ²λ₯Ό κ³΅μ ν΄μ μ¬μ©ν  κ²½μ° μκΈ°λ λ¬Έμ μ  ?**

- DML μμμ νκ³  Commit μ νμ§ μμ κ²½μ°
    
    νλμ DB μλ²λ₯Ό μ¬μ©ν  κ²½μ°
    νλͺμ μ¬μ©μκ° DML μμμ ν κ²½μ° λ°λμ   Commit , rollback  μ ν΅ν΄μ μμμ μλ£νμ
    κ·Έλ μ§ μμΌλ©΄ λ€λ₯Έ μ¬μ©μλ  DML μμ λΆκ° ....
    

## setAutoCommit

JDBC >> default(dml)) >> autocommit >> μ€λ°μ
JDBC >> autocommit >> κ°λ°μ >> false >> λ°λμ >> commit, rollback (κ°μ μ± λΆμ¬)

- κΈ°λ³Έμ μΌλ‘ JDBCλ₯Ό μ¬μ©ν κ²½μ° DMLμμμ ν λ μλμ μΌλ‘ commitμ΄ λλ€.
νμ§λ§ βsetAutoCommit(false)β μμμ ν΅ν΄ λ§μλλ€λ©΄ κ°μ λ‘ commit or rollbackμ μ¬μ©νμ¬μΌ νλ€.

- μμ μ½λ (Ex07_Transaction.java)
    
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
    			 //λλ€ μ±κ³΅ μλλ©΄ λλ€ μ€ν¨ (νλμ λΌλ¦¬μ  λ¨μ)
    			 conn.setAutoCommit(false); //JDBC κ°λ°μ (commit or rollback)
    			 //begin tran
    			  pstmt = conn.prepareStatement(sql);
    			  pstmt.executeQuery();
    			 
    			  pstmt2 = conn.prepareStatement(sql2);
    			  pstmt2.executeQuery();
    			 //end tran
    			 conn.commit(); //λλ€ μ μμ μΌλ‘ μ€νλκ³  μμΈκ° λ°μλμ§ μμΌλ©΄ :commit
    			 
    		} catch (Exception e) {
    			System.out.println("λ¬Έμ λ°μ : " + e.getMessage());
    			try {
    				conn.rollback(); //λλ€ μ·¨μ
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
    
    **Data Access Object**Β 
    
    λ°μ΄ν°λ² μ΄μ€μ dataμ μ κ·ΌνκΈ° μν κ°μ²΄μλλ€.Β **DataBaseμ μ κ·Ό νκΈ° μν λ‘μ§ & λΉμ§λμ€ λ‘μ§**μ λΆλ¦¬νκΈ° μν΄ μ¬μ©ν©λλ€.
    
    > DAO ν΄λμ€ μ€κ³νκΈ°
    Data Acesse Object
    > 
    > 1. DBμ°κ²°
    > 2. CRUD κ΅¬ν
    > 3. κΈ°λ³Έμ μΌλ‘ ν¨μ 5κ°λ₯Ό λ§λ¬ (νλμ νμ΄λΈμ λν΄μ)
    > 3.1 μ μ²΄μ‘°ν, μ‘°κ±΄μ‘°ν, μ½μ, μμ , μ­μ  κΈ°λ₯
    
- **DTO**
    
    **Data Transfer Object**
    
    κ³μΈ΅ κ° λ°μ΄ν° κ΅νμ νκΈ° μν΄ μ¬μ©νλ κ°μ²΄λ‘, DTOλ λ‘μ§μ κ°μ§μ§ μλ μμν λ°μ΄ν° κ°μ²΄(getter & setter λ§ κ°μ§ ν΄λμ€)μλλ€.
    
    ν΄λΉ DTOλ₯Ό λ°μ μλ²κ° DAOλ₯Ό μ΄μ©νμ¬ λ°μ΄ν°λ² μ΄μ€λ‘ λ°μ΄ν°λ₯Ό μ§μ΄λ£μ΅λλ€.
    
    > DTO(VO), DOMAIN ν΄λμ€
    λ°μ΄ν°λ₯Ό 1κ±΄ λ΄μ μ μλ ν΄λμ€
    DB νμ΄λΈκ³Ό 1:1 λ§€νκ΅¬μ‘°
    DBμ dept νμ΄λΈμ 1κ±΄ row λ΄μ μ μλ ν΄λμ€
    > 
    
- **VO**
    
    **Value Object**
    
    κ° μ€λΈμ νΈλ‘μ¨ κ°μ μν΄ μ°μλλ€.
    
    DTOμ μ μ¬νμ§λ§ DTOλ setterλ₯Ό κ°μ§κ³  μμ΄ κ°μ΄ λ³ν  μ μμ΅λλ€.
    

## JDBC μ΄κΈμ κ³Όμ 

JDBC_Tier (Program_Emp.java, EmpDao.java, Emp.java, SingletonHelper.java)

[λ¬Έμ ]

```
create table sdept
as
   select * from dept;

sdept νμ΄λΈμ λν΄μ
μ μ²΄μ‘°ν
μ‘°κ±΄μ‘°ν
μ½μ
μ­μ 
μμ 
μ μμ νμλ©΄ λ©λλ€
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
    MVC ν¨ν΄
    >>μνλ κ²λ§ ν΄ 
    
    Model  : λ°μ΄ν° java
    View   : νλ©΄   >> jsp
    Controller: μ‘°μ  (μ μ΄) >> servlet
    
    jsp ,servlet , java .....
    
    Model : dto(vo) , dao  >> java
    View  : java (console)
    ...
    
    */
    public class Program_Emp {
    
    	public static void main(String[] args) {
    		//main ν¨μ (View) μμ­
    		
    		//DAOκ°μ²΄ μμ²­
    		EmpDao dao = new EmpDao(); //6κ°μ ν¨μ
    		Date nowDate = new Date();
    		int row = 0;
    		
    		Calendar cal = Calendar.getInstance();
    		
    		
    		
    		System.out.println("[μ μ²΄μ‘°ν]*******");
    		List<Emp> emplist =dao.getEmpAllList();
    		//νλ©΄κ΅¬μ±
    		if(emplist != null) {
    			empPrint(emplist);
    		}
    		//μ‘°κ±΄μ‘°ν
    		System.out.println("[μ‘°κ±΄μ‘°ν]*******");
    		Emp emp =dao.getEmpListByEmpno(7934);
    		if(emp != null) {
    			empPrint(emp);
    		}else {
    			//.....
    		}
    		
    		System.out.println("[λ°μ΄ν° μ½μ]*******");
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
    		
    		System.out.println("[λ°©κΈμ  insert λ°μ΄ν° μ μ²΄μ‘°ν]*******");
    		emplist =dao.getEmpAllList();
    		//νλ©΄κ΅¬μ±
    		if(emplist != null) {
    			empPrint(emplist);
    		}
    		
    		System.out.println("[λ°©κΈμ  insert λ°μ΄ν° μμ νκΈ°]*******");
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
    		
    		System.out.println("[λ°©κΈμ  update λ°μ΄ν° μ μ²΄μ‘°ν]*******");
    		emplist =dao.getEmpAllList();
    		//νλ©΄κ΅¬μ±
    		if(emplist != null) {
    			empPrint(emplist);
    		}
    		
    //		System.out.println("[λ°©κΈμ  update λ°μ΄ν° μ­μ νκΈ°]*******");
    //		row = dao.deleteEmp(555);
    //		if(row > 0) {
    //			System.out.println("delete rowcount : " + row);
    //		}
    		
    		System.out.println("[λ°©κΈμ  delete λ°μ΄ν° μ μ²΄μ‘°ν]*******");
    		emplist =dao.getEmpAllList();
    		//νλ©΄κ΅¬μ±
    		if(emplist != null) {
    			empPrint(emplist);
    		}
    		
    		System.out.println("[like] λΌμ΄ν¬γ‘γ‘μΌ");
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
    	
    	//μ μ²΄μ‘°ν
    	public List<Emp> getEmpAllList(){
    		PreparedStatement pstmt = null;
    		ResultSet rs = null;
    		
    		//Point
    		List<Emp> emplist = new ArrayList<Emp>();
    	    
    		try {
    	           String sql="select * from emp";
    	           pstmt = conn.prepareStatement(sql);
    	           rs = pstmt.executeQuery();
    	            
    	           if (rs.next()) { //μ΅μ 1κ±΄
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
    	            	
    	            	
    	            	
    	            	emplist.add(emp); // λ°°μ΄μ κ°μ²΄ λ΄κΈ°
    					} while (rs.next());
    	        	   
    	         }else { System.out.println("μ‘°νλ λ°μ΄ν°κ° μμ΅λλ€."); }
    
    	         } catch (Exception e) {
    	            
    	         }finally {
    	            SingletonHelper.close(rs);
    	            SingletonHelper.close(pstmt);
    	         }
    		     
    	       return emplist;
    	}
    	
    	//μ‘°κ±΄μ‘°ν
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
    	
    	//λ°μ΄ν° μ½μ
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
    	
    	
    	//λ°μ΄ν° μ­μ 
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
    	
    	//λ°μ΄ν° μμ 
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
    	
    	//like μ΄λ¦κ²μ
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
    	            System.out.println("μ‘°ν λ°μ΄ν° μμ");
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
    

java build path μ‘μμ€μΌν¨!

[SingletonHelper.java](http://SingletonHelper.java)λ₯Ό μ΄μ©νμμ

νΉμλͺ¨λ₯Ό μμ€μΆκ°

- [SingletonHelper.java]
    
    ```java
    package UTILS;
    
    import java.sql.Connection;
    import java.sql.DriverManager;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.sql.Statement;
    
    //μ‘°λ³ λ¬Έμ 
    //ConnectionHelper μ½λλ singletonμΌλ‘ λ°κΎΈμΈμ ^^
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
    				 conn.close();//μ°κ²°ν΄μ  (DB μ°κ²° λκΈ°)
    				 conn = null; //μ°Έμ‘°λ₯Ό  null λ§λλ€  
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
    

# 2. MVC ν¨ν΄

[mvc λͺ¨λΈ 1]

![https://user-images.githubusercontent.com/92353613/193960032-191b0993-2668-488d-ad2b-2348358f398a.png](https://user-images.githubusercontent.com/92353613/193960032-191b0993-2668-488d-ad2b-2348358f398a.png)

[mvc λͺ¨λΈ 2]

![https://user-images.githubusercontent.com/92353613/193960172-cd44f511-1142-4f14-929f-5daafeba1f4b.png](https://user-images.githubusercontent.com/92353613/193960172-cd44f511-1142-4f14-929f-5daafeba1f4b.png)

**β» DTO(Data Transfer Object) : λ°μ΄ν° μ μ‘μ μν κ°μ²΄**

- κ°λ°κΈ°κ°μ΄ μ§§μ μκ·λͺ¨ νλ‘μ νΈλ, λ³κ²½μ¬ν­μ΄λ μκ΅¬μ¬ν­μ΄ μ μκ²½μ° λΉ λ₯΄κ² κ°λ°ν  μ μλ€λ μ₯μ μ΄ μλ€.

---

### MVC ν¨ν΄μ΄λ

- μ νλ¦¬μΌμ΄μμ ν¬κ² Model, View, Controllerμ μΈ μμ­μΌλ‘ κ΅¬λΆνμ¬ μμ­ κ°μ κ²°ν©λλ₯Ό μνν ν¨ν΄μ΄λ€. μ£Όλ‘ μΉ μ νλ¦¬μΌμ΄μμμ μ¬μ©λλ©°, μΌλ° μ νλ¦¬μΌμ΄μμμλ μ¬μ©λλ€.
- **MVC ν¨ν΄μ κ°μ₯ μ€μν μ₯μ  μ€ νλλ λΉμ¦λμ€ λ‘μ§κ³Ό νλ¦¬μ  νμ΄μ λ‘μ§μ΄ λΆλ¦¬λμλ€λ κ²μ΄λ€.**
- **μ¦, λμμ΄λμ κ°λ°μλ€μ μμ­μ΄ λΆλ¦¬λ¨μΌλ‘μ¨ μλ‘ κ°μμ μμ­μ λ μ§μ€ν  μ μλ€λ μ₯μ μ΄ μλ€.**

MVC ν¨ν΄

> μ νλκ²λ§ ν΄
> 

Model	: λ°μ΄ν°
View	: νλ©΄
Control	: μ‘°μ  (μ μ΄)

# 3. λ°μ΄ν°λ² μ΄μ€ λͺ¨λΈλ§

---

### κ°λ

- νμ€ μΈκ³μ μλ¬΄μ μΈ νλ‘μΈμλ₯Ό λ¬Όλ¦¬μ μΌλ‘ λ°μ΄ν°λ² μ΄μ€ν ν κ².
- μ€κ³μ λ¨κ³μμ κ°λμ Β λͺ¨λΈλ§μ νμ¬ ERλ€μ΄μ΄κ·Έλ¨μ λμΆνκ³  μ΄λ₯Ό μ΄μ©νμ¬ κ΄κ³ μ€ν€λ§ λͺ¨λΈμ λμΆνκ³  μ΄λ₯Ό λ¬Όλ¦¬μ  λͺ¨λΈλ§νμ¬ κ΄κ³ μ€ν€λ§λ₯Ό λμΆν΄λλλ€.

### μ§ν κ³Όμ 

κ³ν - λΆμ - μ€κ³ - κ΅¬ν - νμ€νΈ - μ μ§λ³΄μ

### [3κ°μ§ λͺ¨λΈλ§]

- κ°λμ  λͺ¨λΈλ§: κ°μ²΄μ κ°μ²΄λ€ κ°μ κ΄κ³μμ ERλ€μ΄μ΄κ·Έλ¨μ λ§λλ κ³Όμ 
- λΌλ¦¬μ  λͺ¨λΈλ§: ERλ€μ΄μ΄κ·Έλ¨μ μ¬μ©νμ¬ κ΄κ³ μ€ν€λ§ λͺ¨λΈμ λ§λλ κ³Όμ 
- λ¬Όλ¦¬μ  λͺ¨λΈλ§: κ΄κ³ μ€ν€λ§ λͺ¨λΈμ λ¬Όλ¦¬μ  κ΅¬μ‘°λ₯Ό μ μνκ³  κ΅¬ννλ κ³Όμ 

[ER-λ€μ΄μ΄κ·Έλ¨]

![https://user-images.githubusercontent.com/92353613/194002234-df47da13-a4a9-4228-a193-11b2c90c1ee5.png](https://user-images.githubusercontent.com/92353613/194002234-df47da13-a4a9-4228-a193-11b2c90c1ee5.png)