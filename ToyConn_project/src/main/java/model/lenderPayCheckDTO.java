package model;

public class lenderPayCheckDTO {
	int p_num;
	String user_id;
	String lender_id;
	String p_name;
	int price;
	String toystate;
	String lend;
	String image_file;
	public lenderPayCheckDTO(int p_num, String user_id, String lender_id, String p_name, int price, String toystate,
			String lend, String image_file) {
		this.p_num = p_num;
		this.user_id = user_id;
		this.lender_id = lender_id;
		this.p_name = p_name;
		this.price = price;
		this.toystate = toystate;
		this.lend = lend;
		this.image_file = image_file;
	}
	public lenderPayCheckDTO() {
		
	}
	public int getP_num() {
		return p_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getLender_id() {
		return lender_id;
	}
	public String getP_name() {
		return p_name;
	}
	public int getPrice() {
		return price;
	}
	public String getToystate() {
		return toystate;
	}
	public String getLend() {
		return lend;
	}
	public String getImage_file() {
		return image_file;
	}
	
	
}
