package model;

public class FoodDTO {

	private int food_code;
	private String food_name;
	private String food_content;
	private String food_image;
	private int food_month;
	private String food_good;
	
	public FoodDTO() {
		
	}
	
	public FoodDTO(int food_code, String food_name, String food_content, String food_image, int food_month,
			String food_good) {
		this.food_code = food_code;
		this.food_name = food_name;
		this.food_content = food_content;
		this.food_image = food_image;
		this.food_month = food_month;
		this.food_good = food_good;
	}
	
	public FoodDTO(int food_code, String food_name, String food_image, String food_good) {
		this.food_code = food_code;
		this.food_name = food_name;
		this.food_image = food_image;
		this.food_good = food_good;
	}

	

	public FoodDTO(String food_name, String food_content, String food_image, String food_good) {
		this.food_name = food_name;
		this.food_content = food_content;
		this.food_image = food_image;
		this.food_good = food_good;
	}

	
	

	public int getFood_code() {
		return food_code;
	}
	public void setFood_code(int food_code) {
		this.food_code = food_code;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getFood_content() {
		return food_content;
	}
	public void setFood_content(String food_content) {
		this.food_content = food_content;
	}
	public String getFood_image() {
		return food_image;
	}
	public void setFood_image(String food_image) {
		this.food_image = food_image;
	}
	public int getFood_month() {
		return food_month;
	}
	public void setFood_month(int food_month) {
		this.food_month = food_month;
	}
	public String getFood_good() {
		return food_good;
	}
	public void setFood_good(String food_good) {
		this.food_good = food_good;
	}
	@Override
	public String toString() {
		return "FoodDTO [food_code=" + food_code + ", food_name=" + food_name + ", food_content=" + food_content
				+ ", food_image=" + food_image + ", food_month=" + food_month + ", food_good=" + food_good + "]";
	}
	
	
	
}
