package kr.or.kosa.dto;

/*
CREATE TABLE memo(
    id VARCHAR2(20) not null,
    email VARCHAR2(20) not null,
    content VARCHAR2(100)
);
*/
public class Memo {
	private String id;
	private String email;
	private String content;
	
	public Memo() {}

	public Memo(String id, String email, String content) {
		super();
		this.id = id;
		this.email = email;
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Memo [id=" + id + ", email=" + email + ", content=" + content + "]";
	}
	
}
