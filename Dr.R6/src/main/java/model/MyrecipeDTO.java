package model;

public class MyrecipeDTO {

	private String myrecipe_id;
	private int myrecipe_no1;
	private int myrecipe_no2;
	private int myrecipe_no3;
	private int myrecipe_no4;
	private int myrecipe_no5;
	
	public MyrecipeDTO(String myrecipe_id, int myrecipe_no1, int myrecipe_no2, int myrecipe_no3, int myrecipe_no4,
			int myrecipe_no5) {
		this.myrecipe_id = myrecipe_id;
		this.myrecipe_no1 = myrecipe_no1;
		this.myrecipe_no2 = myrecipe_no2;
		this.myrecipe_no3 = myrecipe_no3;
		this.myrecipe_no4 = myrecipe_no4;
		this.myrecipe_no5 = myrecipe_no5;
	}

	public String getMyrecipe_id() {
		return myrecipe_id;
	}

	public void setMyrecipe_id(String myrecipe_id) {
		this.myrecipe_id = myrecipe_id;
	}

	public int getMyrecipe_no1() {
		return myrecipe_no1;
	}

	public void setMyrecipe_no1(int myrecipe_no1) {
		this.myrecipe_no1 = myrecipe_no1;
	}

	public int getMyrecipe_no2() {
		return myrecipe_no2;
	}

	public void setMyrecipe_no2(int myrecipe_no2) {
		this.myrecipe_no2 = myrecipe_no2;
	}

	public int getMyrecipe_no3() {
		return myrecipe_no3;
	}

	public void setMyrecipe_no3(int myrecipe_no3) {
		this.myrecipe_no3 = myrecipe_no3;
	}

	public int getMyrecipe_no4() {
		return myrecipe_no4;
	}

	public void setMyrecipe_no4(int myrecipe_no4) {
		this.myrecipe_no4 = myrecipe_no4;
	}

	public int getMyrecipe_no5() {
		return myrecipe_no5;
	}

	public void setMyrecipe_no5(int myrecipe_no5) {
		this.myrecipe_no5 = myrecipe_no5;
	}

	@Override
	public String toString() {
		return "MyrecipeDTO [myrecipe_id=" + myrecipe_id + ", myrecipe_no1=" + myrecipe_no1 + ", myrecipe_no2="
				+ myrecipe_no2 + ", myrecipe_no3=" + myrecipe_no3 + ", myrecipe_no4=" + myrecipe_no4 + ", myrecipe_no5="
				+ myrecipe_no5 + "]";
	}
	
	
	
	
}
