package model;

public class chattingOneDTO {
	String sender;
	String recipient;
	String text_content;
	int p_num;
	public chattingOneDTO(String sender, String recipient, String text_content, int p_num) {
		this.sender = sender;
		this.recipient = recipient;
		this.text_content = text_content;
		this.p_num = p_num;
	}
	public chattingOneDTO() {
		
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
	public int getP_num() {
		return p_num;
	}
}
