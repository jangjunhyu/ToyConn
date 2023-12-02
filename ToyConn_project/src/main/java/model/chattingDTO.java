package model;

public class chattingDTO {
	int chat_num;
	String sender;
	String recipient;
	String text_content;
	String chat_time;
	int p_num;
	public chattingDTO() {
		
	}
	public chattingDTO(int chat_num, String sender, String recipient, String text_content, String chat_time, int p_num) {
		this.chat_num = chat_num;
		this.sender = sender;
		this.recipient = recipient;
		this.text_content = text_content;
		this.chat_time = chat_time;
		this.p_num = p_num;
	}
	public chattingDTO(String sender, String recipient, String text_content, int p_num) {
		this.sender = sender;
		this.recipient = recipient;
		this.text_content = text_content;
		this.p_num = p_num;
	}
	public int getChat_num() {
		return chat_num;
	}
	public String getSender() {
		return sender;
	}
	public String getRecipient() {
		return recipient;
	}
	public String getText_content() {
		return text_content;
	}
	public String getChat_time() {
		return chat_time;
	}
	public int getP_num() {
		return p_num;
	}
	
}
