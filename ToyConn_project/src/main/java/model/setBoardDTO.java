package model;

public class setBoardDTO {
	String user_id;
	String title;
	String text_content;
	String anonymous;
	public setBoardDTO(String user_id, String title, String text_content, String anonymous) {
		this.user_id = user_id;
		this.title = title;
		this.text_content = text_content;
		this.anonymous = anonymous;
	}
	public setBoardDTO() {
		
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
	
}
