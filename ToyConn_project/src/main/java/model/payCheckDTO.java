package model;

public class payCheckDTO {
	int pc_num;
	String user_id;
	int p_num;
	String lender_id;
	String p_name;
	int price;
	String pay_choice;
	String toystate;
	String lend;
	public payCheckDTO(int pc_num, String lender_id, String user_id, int p_num, String p_name, int price, String pay_choice, String toystate, String lend) {
		this.pc_num = pc_num;
		this.lender_id = lender_id;
		this.user_id = user_id;
		this.p_num = p_num;
		this.p_name = p_name;
		this.price = price;
		this.pay_choice = pay_choice;
		this.toystate = toystate;
		this.lend = lend;
	}
	public payCheckDTO(String lender_id, String user_id, int p_num, String p_name, int price, String pay_choice) {
		this.lender_id = lender_id;
		this.user_id = user_id;
		this.p_num = p_num;
		this.p_name = p_name;
		this.price = price;
		this.pay_choice = pay_choice;
	}
	public payCheckDTO() {
	}
	public String getLender_id() {
		return lender_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public int getP_num() {
		return p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public int getPrice() {
		return price;
	}
	public String getPay_chocie() {
		return pay_choice;
	}
	public String getToystate() {
		return toystate;
	}
	public String getLend() {
		return lend;
	}
	public int getPc_num() {
		return pc_num;
	}
}
