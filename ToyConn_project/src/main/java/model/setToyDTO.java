package model;

public class setToyDTO {
	String user_id;
	String category;
	String p_name;
	int rent_price;
	String p_quality;
	String p_content;
	String gender;
	String image_file;
	public setToyDTO(String id, String categori, String p_name, int rent_price, String p_quality, String p_content,
			String gender, String image_file) {
		this.user_id = id;
		this.category = categori;
		this.p_name = p_name;
		this.rent_price = rent_price;
		this.p_quality = p_quality;
		this.p_content = p_content;
		this.gender = gender;
		this.image_file = image_file;
	}
	public setToyDTO() {
		
	}
	public String getUser_id() {
		return user_id;
	}
	public String getCategory() {
		return category;
	}
	public String getP_name() {
		return p_name;
	}
	public int getRent_price() {
		return rent_price;
	}
	public String getP_quality() {
		return p_quality;
	}
	public String getP_content() {
		return p_content;
	}
	public String getGender() {
		return gender;
	}
	public String getImage_file() {
		return image_file;
	}
	
}
