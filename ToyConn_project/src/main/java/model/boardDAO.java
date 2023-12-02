package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class boardDAO {
	SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
	
	// Factory를 사용해서 세션 생성(DB연결, close(), sql 실행)
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public List<boardDTO> getBoardList(){
		List<boardDTO> list = null;
		try {
			list = sqlSession.selectList("getBoardList");
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		System.out.println(list);
		return list;
	}
	public boardDTO getThisBoard(int board_num){
		boardDTO vo = null;
		try {
			vo = sqlSession.selectOne("getThisBoard", board_num);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		return vo;
	}
	public int updateBoard(updateBoardDTO vo) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("updateBoard", vo);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return cnt;
	}
	public int setBoard(setBoardDTO vo) {
		int cnt = 0;
		try {
			cnt = sqlSession.insert("setBoard", vo);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return cnt;
	}
}
