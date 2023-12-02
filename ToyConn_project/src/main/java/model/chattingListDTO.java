package model;

public class chattingListDTO {
	String user_id;
	int p_num;
	public chattingListDTO(String user_id, int p_num) {
		this.user_id = user_id;
		this.p_num = p_num;
	}
	public chattingListDTO() {
	}
	public String getUser_id() {
		return user_id;
	}
	public int getP_num() {
		return p_num;
	}
	
}
