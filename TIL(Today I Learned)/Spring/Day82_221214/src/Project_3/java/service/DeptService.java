package service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.DeptDao;
import vo.Dept;

@Service
public class DeptService {
	//Mybatis 작업
		private SqlSession sqlsession;

		@Autowired
		public void setSqlsession(SqlSession sqlsession) {
			this.sqlsession = sqlsession;
		}
		//글목록보기 서비스 (DB)
		public List<Dept> depts() {
			//DAO 작업
			List<Dept> list = null;
			try {
					//동기화/////////////////////////////////////////////////////
				 	DeptDao deptdao = sqlsession.getMapper(DeptDao.class);
					///////////////////////////////////////////////////////////
				 	list = deptdao.getDepts();
			} catch (ClassNotFoundException e) {
						e.printStackTrace();
			} catch (SQLException e) {
						e.printStackTrace();
			}
			return list;
		}
		
		//글쓰기 서비스
		public int setWrite(Dept dept) {
		
			try {
					//동기화/////////////////////////////////////////////////////
				 	DeptDao deptdao = sqlsession.getMapper(DeptDao.class);
					///////////////////////////////////////////////////////////
				 	deptdao.insert(dept);
			} catch (ClassNotFoundException e) {
						e.printStackTrace();
			} catch (SQLException e) {
						e.printStackTrace();
			}
			return 0;
		}
}
