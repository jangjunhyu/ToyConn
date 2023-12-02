package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class ProductDAO {

	static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int registerProduct(setToyDTO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = 0;
		try {
			cnt = sqlSession.insert("database.ProductMapper.registerProduct", vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();

		}
		return cnt;

	}

}
