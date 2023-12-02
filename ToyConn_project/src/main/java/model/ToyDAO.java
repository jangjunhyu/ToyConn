package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class ToyDAO {
	SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
	
	// Factory를 사용해서 세션 생성(DB연결, close(), sql 실행)
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	public List<ToyDTO> getToyInfo(String id) {
		List<ToyDTO> list = null;
		try {
			list = sqlSession.selectList("getToyInfo", id);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}
	
	public ToyDTO getToyInfo(int p_num) {
		ToyDTO vo = null;
		try {
			vo = sqlSession.selectOne("getToy", p_num);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return vo;
	}
	
	public List<addressToyDTO> getAddressToys(){
		List<addressToyDTO> list = null;
		try {
			list = sqlSession.selectList("getAddressToys");
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	
	public int updateGiveState(int p_num) {
		int cnt=0;
		try {
			cnt = sqlSession.update("database.ProductMapper.updateGiveState", p_num);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}

	public int updateTakeState(int p_num) {
		int cnt=0;
		try {
			cnt = sqlSession.update("updateTakeState", p_num);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}
	public String getToyAddress(int p_num) {
		String address = "";
		try {
			address = sqlSession.selectOne("getToyAddress", p_num);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return address;
	}
	
}
