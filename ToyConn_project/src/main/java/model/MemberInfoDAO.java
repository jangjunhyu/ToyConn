package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class MemberInfoDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSession();
	
	SqlSession session = factory.openSession(true);
	
	String MemberInfoMapper = "database.MemberInfoMapper.";
	
	public MemberInfo firstJoinCheck(String user_id) {
		MemberInfo row = null;
		try {
			row = session.selectOne("database.MemberInfoMapper.firstJoinCheck", user_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		System.out.println(row);
		return row;
	}

	public int firstJoinAccount(MemberInfo memberInfo) {
		int row = 0;
		try {
			row = session.insert(MemberInfoMapper + "firstJoinAccount", memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		System.out.println(row);
		return row;
	}

	public int changeAccount(MemberInfo memberInfo) {
		int row = 0;
		try {
			row = session.update(MemberInfoMapper + "changeAccount", memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return row;
	}

	public int RemoveAccount(MemberInfo list) {
		int row = 0;
		try {
			row = session.delete(MemberInfoMapper + "deleteAccount", list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return row;
	}
	public String getAddress(String id) {
		String address = "";
		try {
			address = session.selectOne("database.MemberInfoMapper.getAddress", id);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			session.close();
		}
		return address;
	}
	public MemberInfo getMemberInfo(String id) {
		MemberInfo vo = null;
		try {
			vo = session.selectOne("getMemberInfo", id);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			session.close();
		}
		return vo;
	}
	public String getNick(String id) {
		String nick = "";
		try {
			nick = session.selectOne("database.MemberInfoMapper.getNick", id);
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			session.close();
		}
		return nick;
	}
}
