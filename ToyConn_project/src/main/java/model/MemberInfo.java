package model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class MemberInfo {
	
	protected String user_id;
	protected String nick;
	protected String address;
	protected BigDecimal score;
	protected Timestamp join_date;
	
	public MemberInfo(String user_id, String nick) {
		this.user_id = user_id;
		this.nick = nick;
	}
	
	public MemberInfo(String user_id, String nick, String address) {
		this.user_id = user_id;
		this.nick = nick;
		this.address = address;
	}

	public MemberInfo(String user_id, String nick, String address, BigDecimal score) {
		this.user_id = user_id;
		this.nick = nick;
		this.address = address;
		this.score = score;
	}
	
	public MemberInfo(String user_id, String nick, String address, BigDecimal score, Timestamp join_date) {
		this.user_id = user_id;
		this.nick = nick;
		this.address = address;
		this.score = score;
		this.join_date = join_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getNick() {
		return nick;
	}

	public String getAddress() {
		return address;
	}

	public BigDecimal getScore() {
		return score;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	@Override
	public String toString() {
		return "AccountList [user_id=" + user_id + ", nick=" + nick + ", address=" + address + ", score=" + score
				+ ", join_date=" + join_date + "]";
	}
	
}
