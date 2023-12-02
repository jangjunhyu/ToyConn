package model;

public class updateBoardDTO {
	int board_num;
	String title;
	String text_content;
	public updateBoardDTO(int board_num, String title, String text_content) {
		this.board_num = board_num;
		this.title = title;
		this.text_content = text_content;
	}
	public updateBoardDTO() {
		
	}
	public int getBoard_num() {
		return board_num;
	}
	public String getTitle() {
		return title;
	}
	public String getText_content() {
		return text_content;
	}
	
}
