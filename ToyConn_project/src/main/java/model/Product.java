package model;

public class Product {
	 private String category;
	 private String user_id;
	 private String p_name;
	 int rent_price;
	 private String p_quality;
	private String p_content;
	 String p_status = "대여가능";
		String r_status = "대야가능";
	private String gender;
	private String image_file;
	public String getCategory() {
		return category;
	}
	public String getUser_id() {
		return user_id;
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
	public String getP_status() {
		return p_status;
	}
	public String getR_status() {
		return r_status;
	}
	public String getGender() {
		return gender;
	}
	public String getImage_file() {
		return image_file;
	}
	public Product(String category, String user_id, String p_name, int rent_price, String p_quality, String p_content,
			String p_status, String r_status, String gender, String image_file) {
		super();
		this.category = category;
		this.user_id = user_id;
		this.p_name = p_name;
		this.rent_price = rent_price;
		this.p_quality = p_quality;
		this.p_content = p_content;
		this.p_status = p_status;
		this.r_status = r_status;
		this.gender = gender;
		this.image_file = image_file;
	}

}
