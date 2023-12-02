package model;

public class addressToyDTO {
	int p_num;
	String address;
	String user_id;
	String category;
	String p_name;
	int rent_price;
	String gender;
	String image_file;
	public addressToyDTO(int p_num, String address, String user_id, String category, String p_name, int rent_price, String gender, String image_file) {
		this.p_num = p_num;
		this.address = address;
		this.user_id = user_id;
		this.category = category;
		this.p_name = p_name;
		this.rent_price = rent_price;
		this.gender = gender;
		this.image_file = image_file;
	}
	public addressToyDTO() {
		
	}
	public int getP_num() {
		return p_num;
	}
	public String getAddress() {
		return address;
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
	public String getGender() {
		return gender;
	}
	public String getImage_file() {
		return image_file;
	}
	
}
