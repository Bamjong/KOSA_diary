package DI_06_Spring;

//Oracle, Mysql이 사용하는 공통함수 (추상함수) 강제 구현
public interface ArticleDao {
	void insert(Article article);
}
