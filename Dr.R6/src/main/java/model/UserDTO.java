package model;

public class UserDTO {
	private String u_id;
	private String u_pw;
	private String u_email;
	private String u_name;
	private int u_sex;
	private int u_dang;
	private int u_go;
	private int u_we;
	private int u_ho;
//	private int u_no;
	
	public UserDTO(String u_id, String u_pw, String u_email, String u_name, int u_sex, int u_dang, int u_go, int u_we,
			int u_ho) {
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_email = u_email;
		this.u_name = u_name;
		this.u_sex = u_sex;
		this.u_dang = u_dang;
		this.u_go = u_go;
		this.u_we = u_we;
		this.u_ho = u_ho;
//		this.u_no = u_no;
	}

	public int getU_dang() {
		return u_dang;
	}

	public void setU_dang(int u_dang) {
		this.u_dang = u_dang;
	}

	public int getU_go() {
		return u_go;
	}

	public void setU_go(int u_go) {
		this.u_go = u_go;
	}

	public int getU_we() {
		return u_we;
	}

	public void setU_we(int u_we) {
		this.u_we = u_we;
	}

	public int getU_ho() {
		return u_ho;
	}

	public void setU_ho(int u_ho) {
		this.u_ho = u_ho;
	}

//	public int getU_no() {
//		return u_no;
//	}
//
//	public void setU_no(int u_no) {
//		this.u_no = u_no;
//	}

	public UserDTO(String u_id, String u_pw, String u_email, String u_name, int u_sex) {
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_email = u_email;
		this.u_name = u_name;
		this.u_sex = u_sex;
	}
	
	public UserDTO(String id, String pw) {
		this.u_id = u_id;
		this.u_pw = u_pw;
	}
	
	public UserDTO() {
	}
	
	
	
	

	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public int getU_sex() {
		return u_sex;
	}
	public void setU_sex(int u_sex) {
		this.u_sex = u_sex;
	}
	@Override
	public String toString() {
		return "UserDTO [u_id=" + u_id + ", u_pw=" + u_pw + ", u_email=" + u_email + ", u_name=" + u_name + ", u_sex="
				+ u_sex + ", u_dang=" + u_dang + ", u_go=" + u_go + ", u_we=" + u_we + ", u_ho=" + u_ho + ", u_no="
				+  "]";
	}
	
	
}
