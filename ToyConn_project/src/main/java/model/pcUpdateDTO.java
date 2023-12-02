package model;

public class pcUpdateDTO {
	int p_num;
	String lender_id;
	int pc_num;
	public pcUpdateDTO(int p_num, String lender_id, int pc_num) {
		this.p_num = p_num;
		this.lender_id = lender_id;
		this.pc_num = pc_num;
	}
	public pcUpdateDTO() {

	}
	public int getP_num() {
		return p_num;
	}
	public String getLender_id() {
		return lender_id;
	}
	public int getPc_num() {
		return pc_num;
	}
	
}
