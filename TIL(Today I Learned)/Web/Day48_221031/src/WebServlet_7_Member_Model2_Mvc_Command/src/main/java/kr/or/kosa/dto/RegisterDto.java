package kr.or.kosa.dto;

/*
이름    널?       유형           
----- -------- ------------ 
ID    NOT NULL NUMBER       
PWD   NOT NULL VARCHAR2(20) 
EMAIL NOT NULL VARCHAR2(50) 
 */

public class RegisterDto {
	private int id;
	private String pwd;
	private String email;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "RegisterDto [id=" + id + ", pwd=" + pwd + ", email=" + email + "]";
	}
	
	
}
