# ๐ Day82_221214

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 12์ 14์ผ ์ค์  9:46
Status: ๐จ Published
Tags: Mybatis, Spring
Updated Time: 2022๋ 12์ 14์ผ ์คํ 9:49

# 1. Mybatis

## ****์ค์ฝํ(Scope) ์ ์๋ช์ฃผ๊ธฐ(Lifecycle)****

[MyBatis - ๋ง์ด๋ฐํฐ์ค 3 | ์์ํ๊ธฐ](https://mybatis.org/mybatis-3/ko/getting-started.html)

### **SqlSessionFactoryBuilder**

- ์ด ํด๋์ค๋ ์ธ์คํด์คํ๋์ด ์ฌ์ฉ๋๊ณ  ๋์ ธ์ง ์ ์๋ค. SqlSessionFactory ๋ฅผ ์์ฑํ ํ ์ ์งํ  ํ์๋ ์๋ค. ๊ทธ๋ฌ๋ฏ๋ก SqlSessionFactoryBuilder ์ธ์คํด์ค์ ๊ฐ์ฅ ์ข์ ์ค์ฝํ๋ ๋ฉ์๋ ์ค์ฝํ(์๋ฅผ๋ค๋ฉด ๋ฉ์๋ ์ง์ญ๋ณ์)์ด๋ค. ์ฌ๋ฌ๊ฐ์ SqlSessionFactory ์ธ์คํด์ค๋ฅผ ๋น๋ํ๊ธฐ ์ํด SqlSessionFactoryBuilder๋ฅผ ์ฌ์ฌ์ฉํ  ์๋ ์์ง๋ง ์ ์งํ์ง ์๋ ๊ฒ์ด ๊ฐ์ฅ ์ข๋ค.

### **SqlSessionFactory**

- ํ๋ฒ ๋ง๋ ๋ค SqlSessionFactory๋ ์ ํ๋ฆฌ์ผ์ด์์ ์คํํ๋ ๋์ ์กด์ฌํด์ผ๋ง ํ๋ค. ๊ทธ๋์ ์ญ์ ํ๊ฑฐ๋ ์ฌ์์ฑํ  ํ์๊ฐ ์๋ค. ์ ํ๋ฆฌ์ผ์ด์์ด ์คํ๋๋ ๋์ ์ฌ๋ฌ ์ฐจ๋ก SqlSessionFactory ๋ฅผ ๋ค์ ๋น๋ํ์ง ์๋ ๊ฒ์ด ๊ฐ์ฅ ์ข์ ํํ์ด๋ค. ์ฌ๋น๋ํ๋ ํํ๋ ๊ฒฐ๊ณผ์ ์ผ๋ก โ๋์๋์โ ๊ฐ ๋๋๋ก ํ๋ค. ๊ทธ๋ฌ๋ฏ๋ก SqlSessionFactory ์ ๊ฐ์ฅ ์ข์ ์ค์ฝํ๋ ์ ํ๋ฆฌ์ผ์ด์ ์ค์ฝํ์ด๋ค. ์ ํ๋ฆฌ์ผ์ด์ ์ค์ฝํ๋ก ์ ์งํ๊ธฐ ์ํ ๋ค์ํ ๋ฐฉ๋ฒ์ด ์กด์ฌํ๋ค. ๊ฐ์ฅ ๊ฐ๋จํ ๋ฐฉ๋ฒ์ ์ฑ๊ธํด ํจํด์ด๋ static ์ฑ๊ธํด ํจํด์ ์ฌ์ฉํ๋ ๊ฒ์ด๋ค. ๋๋ ๊ตฌ๊ธ ์ฅฌ์ค๋ ์คํ๋ง๊ณผ ๊ฐ์ ์์กด์ฑ ์ฝ์ ์ปจํ์ด๋๋ฅผ ์ ํธํ  ์๋ ์๋ค. ์ด๋ฌํ ํ๋ ์์ํฌ๋ SqlSessionFactory์ ์๋ช์ฃผ๊ธฐ๋ฅผ ์ฑ๊ธํด์ผ๋ก ๊ด๋ฆฌํ  ๊ฒ์ด๋ค.

### **SqlSession**

- ๊ฐ๊ฐ์ ์ฐ๋ ๋๋ ์์ฒด์ ์ผ๋ก SqlSession์ธ์คํด์ค๋ฅผ ๊ฐ์ ธ์ผ ํ๋ค. SqlSession์ธ์คํด์ค๋ ๊ณต์ ๋์ง ์๊ณ  ์ฐ๋ ๋์ ์์ ํ์ง๋ ์๋ค. ๊ทธ๋ฌ๋ฏ๋ก ๊ฐ์ฅ ์ข์ ์ค์ฝํ๋ ์์ฒญ ๋๋ ๋ฉ์๋ ์ค์ฝํ์ด๋ค. SqlSession ์ static ํ๋๋ ํด๋์ค์ ์ธ์คํด์ค ํ๋๋ก ์ง์ ํด์๋ ์๋๋ค. ๊ทธ๋ฆฌ๊ณ  ์๋ธ๋ฆฟ ํ๋ ์์ํฌ์ HttpSession ๊ณผ ๊ฐ์ ๊ด๋ฆฌ ์ค์ฝํ์ ๋ฌ์๋ ์๋๋ค. ์ด๋ ํ ์ข๋ฅ์ ์น ํ๋ ์์ํฌ๋ฅผ ์ฌ์ฉํ๋ค๋ฉด HTTP ์์ฒญ๊ณผ ์ ์ฌํ ์ค์ฝํ์ ๋๋ ๊ฒ์ผ๋ก ๊ณ ๋ คํด์ผ ํ๋ค. ๋ฌ๋ฆฌ ๋งํด์ HTTP ์์ฒญ์ ๋ฐ์๋๋ง๋ค ๋ง๋ค๊ณ  ์๋ต์ ๋ฆฌํดํ ๋๋ง๋ค SqlSession ์ ๋ซ์ ์ ์๋ค. SqlSession ์ ๋ซ๋ ๊ฒ์ ์ค์ํ๋ค. ์ธ์ ๋ finally ๋ธ๋ก์์ ๋ซ์์ผ๋ง ํ๋ค. ๋ค์์ SqlSession์ ๋ซ๋ ๊ฒ์ ํ์ธํ๋ ํ์ค์ ์ธ ํํ๋ค.

๋์๋์๊ฐ ๋๋ ์ฝ๋)

```java
๋์ ๋์๊ฐ ๋๋ ์ฝ๋  
public class SqlMapClient {
	private static SqlSession session;
	
	static {
		String resource = "SqlMapConfig.xml";
		try {
			  Reader reader =  Resources.getResourceAsReader(resource);
			  SqlSessionFactory factory=  new  SqlSessionFactoryBuilder().build(reader);
			  session = factory.openSession();
		}catch (Exception e) {
			
		}
	}
	public static SqlSession getSqlSession() {
		return session;
	}
	
}
```

์ข์๋์๊ฐ ๋๋ ์ฝ๋)

```java
public class SqlMapClient {
	private static SqlSessionFactory sqlsessionfactory;
	static {
		String resource = "SqlMapConfig.xml";
		try {
			 Reader reader = Resources.getResourceAsReader(resource);
			 sqlsessionfactory = new SqlSessionFactoryBuilder().build(reader);
			 
		}catch(Exception e) {
		}
	}
	 public static SqlSessionFactory getSqlSession(){
		  return sqlsessionfactory;
	  }	
}
```

---

```java
public int insert(GuestDTO guestobj){
		SqlSession session = null;
		try{
			//factory.openSession(true); autocommit
			//factory.openSession(); app (commit ,rollback)
					
			session = factory.openSession();//์์์ method ๋จ์
			
			int result = session.insert("GUEST.insertGuest",guestobj);
			session.commit();
			return result;
		}catch(Exception e){
			session.rollback();
			return 0;
		}finally{
			if(session != null){session.close();}
		}
		
	}
```

## Dynamic Query

### **foreach**

๋์  SQL ์์ ๊ณตํต์ ์ผ๋ก ํ์ํ ๊ฒ์ collection ์ ๋ํด ๋ฐ๋ณต์ฒ๋ฆฌ๋ฅผ ํ๋ ๊ฒ์ด๋ค. ์ข์ข IN ์กฐ๊ฑด์ ์ฌ์ฉํ๊ฒ ๋๋ค. ์๋ฅผ๋ค๋ฉด

```sql
<select id="selectPostIn" resultType="domain.blog.Post">
  SELECT *
  FROM POST P
  <where>
    <foreach item="item" index="index" collection="list"
        open="ID in (" separator="," close=")" nullable="true">
          #{item}
    </foreach>
  </where>
</select>
```

### ์์) ๋ค์ค ๊ฒ์ ๋ง๋ค๊ธฐ

![https://user-images.githubusercontent.com/92353613/207487753-724cbf79-3cc9-4825-bb74-86736dfa94d4.png](https://user-images.githubusercontent.com/92353613/207487753-724cbf79-3cc9-4825-bb74-86736dfa94d4.png)

Dao

```java
<select id="selectSearch" parameterType="hashMap" resultType="guest">
		select * from guest
		<if test="column != null">
			where ${column} like '%' || #{search} || '%' 
		</if>
		<!-- where 'name' like '%ํ๊ธธ๋%' -->
	</select>
```

view

```java
<h3>๋ค์ค๊ฒ์ํ๊ธฐ</h3>
	๊ฒ์: where name='kglim' or email='naver' or home='kosta'
	<form action="guest.do?cmd=search2" method="post">
		<input type="checkbox" name="name" value="name" checked>์์ฑ์
		<input type="checkbox" name="email" value="email" >๋ฉ์ผ
		<input type="checkbox" name="home" value="home" >ํํ์ด์ง
		<br>
		๊ฒ์์ด:<input type="text" name="keyvalue">
		<input type="submit" value="๊ฒ์">
	</form>
```

# [key point]

## Mybatis ์ฌ์ฉ ํ๋ก์ ํธ ์งํ์

1. mapper namespace ์ด๋ฆ : DAO ๊ฐ์ง๋ interface ์ด๋ฆ์ ๊ทธ๋๋ก
2. <select id="" ์ด๋ฆ์ interface ๊ฐ์ง๋ ํจ์๋ช๊ณผ ๋์ผ
result : interface ์ mapper ์์ผ๋ฉด ์คํ

```java
int insertBoard(BoardDTO dto);
int updateBoard(BoardDTO dto);
int deleteBoard(BoardDTO dto);

List<BoardDTO> getBoardList(HashMap map);
BoardDTO getBoard(int num);

void updateHit(int num); //์กฐํ์ ์ฆ๊ฐ
int getBoardCount(); //์ ์ฒด ๊ธ ์

void insertReply(BoardDTO dto); //๋ต๋ณ์ฒ๋ฆฌ
void updateSort(BoardDTO dto);  //๋ต๋ณ ์ฒ๋ฆฌ(step(sort) ๊ฐ ๋ณ๊ฒฝ)
```