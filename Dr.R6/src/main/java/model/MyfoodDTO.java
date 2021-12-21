package model;

public class MyfoodDTO {

	private String myfood_id;
	private String myfood_ref1;
	private String myfood_ref2;
	private String myfood_ref3;
	private String myfood_ref4;
	private String myfood_ref5;
	private String myfood_not1;
	private String myfood_not2;
	private String myfood_not3;
	private String myfood_not4;
	private String myfood_not5;
	
	public MyfoodDTO(String myfood_id, String myfood_ref1, String myfood_ref2, String myfood_ref3, String myfood_ref4,
			String myfood_ref5, String myfood_not1, String myfood_not2, String myfood_not3, String myfood_not4,
			String myfood_not5) {
		this.myfood_id = myfood_id;
		this.myfood_ref1 = myfood_ref1;
		this.myfood_ref2 = myfood_ref2;
		this.myfood_ref3 = myfood_ref3;
		this.myfood_ref4 = myfood_ref4;
		this.myfood_ref5 = myfood_ref5;
		this.myfood_not1 = myfood_not1;
		this.myfood_not2 = myfood_not2;
		this.myfood_not3 = myfood_not3;
		this.myfood_not4 = myfood_not4;
		this.myfood_not5 = myfood_not5;
	}
	
	public MyfoodDTO(String myfood_id, String myfood_not1, String myfood_not2, String myfood_not3, String myfood_not4,
			String myfood_not5) {
		this.myfood_id = myfood_id;
		this.myfood_not1 = myfood_not1;
		this.myfood_not2 = myfood_not2;
		this.myfood_not3 = myfood_not3;
		this.myfood_not4 = myfood_not4;
		this.myfood_not5 = myfood_not5;
	}

	public String getMyfood_id() {
		return myfood_id;
	}

	public void setMyfood_id(String myfood_id) {
		this.myfood_id = myfood_id;
	}

	public String getMyfood_ref1() {
		return myfood_ref1;
	}

	public void setMyfood_ref1(String myfood_ref1) {
		this.myfood_ref1 = myfood_ref1;
	}

	public String getMyfood_ref2() {
		return myfood_ref2;
	}

	public void setMyfood_ref2(String myfood_ref2) {
		this.myfood_ref2 = myfood_ref2;
	}

	public String getMyfood_ref3() {
		return myfood_ref3;
	}

	public void setMyfood_ref3(String myfood_ref3) {
		this.myfood_ref3 = myfood_ref3;
	}

	public String getMyfood_ref4() {
		return myfood_ref4;
	}

	public void setMyfood_ref4(String myfood_ref4) {
		this.myfood_ref4 = myfood_ref4;
	}

	public String getMyfood_ref5() {
		return myfood_ref5;
	}

	public void setMyfood_ref5(String myfood_ref5) {
		this.myfood_ref5 = myfood_ref5;
	}

	public String getMyfood_not1() {
		return myfood_not1;
	}

	public void setMyfood_not1(String myfood_not1) {
		this.myfood_not1 = myfood_not1;
	}

	public String getMyfood_not2() {
		return myfood_not2;
	}

	public void setMyfood_not2(String myfood_not2) {
		this.myfood_not2 = myfood_not2;
	}

	public String getMyfood_not3() {
		return myfood_not3;
	}

	public void setMyfood_not3(String myfood_not3) {
		this.myfood_not3 = myfood_not3;
	}

	public String getMyfood_not4() {
		return myfood_not4;
	}

	public void setMyfood_not4(String myfood_not4) {
		this.myfood_not4 = myfood_not4;
	}

	public String getMyfood_not5() {
		return myfood_not5;
	}

	public void setMyfood_not5(String myfood_not5) {
		this.myfood_not5 = myfood_not5;
	}

	@Override
	public String toString() {
		return "MyfoodDTO [myfood_id=" + myfood_id + ", myfood_ref1=" + myfood_ref1 + ", myfood_ref2=" + myfood_ref2
				+ ", myfood_ref3=" + myfood_ref3 + ", myfood_ref4=" + myfood_ref4 + ", myfood_ref5=" + myfood_ref5
				+ ", myfood_not1=" + myfood_not1 + ", myfood_not2=" + myfood_not2 + ", myfood_not3=" + myfood_not3
				+ ", myfood_not4=" + myfood_not4 + ", myfood_not5=" + myfood_not5 + "]";
	}
	
	
	
}
