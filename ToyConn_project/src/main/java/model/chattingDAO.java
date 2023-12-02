package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class chattingDAO {
	SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
	
	// Factory를 사용해서 세션 생성(DB연결, close(), sql 실행)
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	public int setChatting(chattingOneDTO vo) {
		int cnt = 0;
		try {
			cnt = sqlSession.insert("database.chattingMapper.setChatting", vo);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}
	public List<chattingDTO> getChatToyList(String id) {
		List<chattingDTO> list = null;
		try {
			list = sqlSession.selectList("database.chattingMapper.getChatToyList", id);
		} catch (Exception e) {
			e.getStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}
	public List<chattingDTO> getChattingList(chattingListDTO vo) {
		List<chattingDTO> list = null;
		try {
			list = sqlSession.selectList("database.chattingMapper.getChattingList", vo);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
}
