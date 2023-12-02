package model;

public class ToyDTO {
	int p_num;
	String user_id;
	String category;
	String p_name;
	int rent_price;
	String p_quality;
	String p_content;
	String p_status;
	String r_status;
	String genter;
	String image_file;
	public ToyDTO(int p_num, String user_id, String category, String p_name, int rent_price, String p_quality,
			String p_content, String p_status, String r_status, String genter, String image_file) {

		this.p_num = p_num;
		this.user_id = user_id;
		this.category = category;
		this.p_name = p_name;
		this.rent_price = rent_price;
		this.p_quality = p_quality;
		this.p_content = p_content;
		this.p_status = p_status;
		this.r_status = r_status;
		this.genter = genter;
		this.image_file = image_file;
	}
	public ToyDTO() {
		
	}
	public int getP_num() {
		return p_num;
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
	public String getP_contenct() {
		return p_content;
	}
	public String getP_status() {
		return p_status;
	}
	public String getR_status() {
		return r_status;
	}
	public String getGenter() {
		return genter;
	}
	public String getImage_file() {
		return image_file;
	}
	
	
}
