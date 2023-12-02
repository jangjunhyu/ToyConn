package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;
import model.pcUpdateDTO;

public class payCheckDAO {
	SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
	
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public int setPayCheck(payCheckDTO vo){
		int cnt = 0;
		try {
			cnt = sqlSession.insert("database.ProductMapper.setPayCheck", vo);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}
	
	public List<payCheckDTO> getPayCheck(String user_id){
		List<payCheckDTO> list=null;
		try {
			list = sqlSession.selectList("database.ProductMapper.getPayCheck", user_id);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	public List<payCheckDTO> getUserlend(String user_id){
		List<payCheckDTO> list=null;
		try {
			list = sqlSession.selectList("database.ProductMapper.getUserlend", user_id);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}

	
	public int updatePayCheck(pcUpdateDTO vo) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("database.ProductMapper.updatePayCheck", vo);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return cnt;
	}
	public List<lenderPayCheckDTO> getLendPayCheck (String lender_id){
		List<lenderPayCheckDTO> li=null;
		try {
			li = sqlSession.selectList("getLendPayCheck", lender_id);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}

		return li;
	}
	public int updatePC(int pc_num) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("updatePC", pc_num);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}
}
