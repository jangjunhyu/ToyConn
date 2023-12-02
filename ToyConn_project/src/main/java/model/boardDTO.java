package model;

public class boardDTO {
	int board_num;
	String user_id;
	String title;
	String text_content;
	String anonymous;
	String write_date;
	public boardDTO(int board_num, String user_id, String title, String text_content, String anonymous,
			String write_date) {

		this.board_num = board_num;
		this.user_id = user_id;
		this.title = title;
		this.text_content = text_content;
		this.anonymous = anonymous;
		this.write_date = write_date;
	}
	public boardDTO() {
		
	}
	public int getBoard_num() {
		return board_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getTitle() {
		return title;
	}
	public String getText_content() {
		return text_content;
	}
	public String getAnonymous() {
		return anonymous;
	}
	public String getWrite_date() {
		return write_date;
	}
	
	
}
