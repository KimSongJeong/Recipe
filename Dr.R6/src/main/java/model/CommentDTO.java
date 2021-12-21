package model;

public class CommentDTO {

	private int cmt_code;
	private String cmt_content;
	private String cmt_time;
	private int cmt_recipe;
	private String cmt_id;

	public CommentDTO(int cmt_code, String cmt_content, String cmt_time, int cmt_recipe, String cmt_id) {
		this.cmt_code = cmt_code;
		this.cmt_content = cmt_content;
		this.cmt_time = cmt_time;
		this.cmt_recipe = cmt_recipe;
		this.cmt_id = cmt_id;
	}

	

	public CommentDTO(String cmt_content, int cmt_recipe, String cmt_id) {
		this.cmt_content = cmt_content;
		this.cmt_recipe = cmt_recipe;
		this.cmt_id = cmt_id;
	}



	public CommentDTO(String cmt_content, String cmt_time, String cmt_id) {
		this.cmt_content = cmt_content;
		this.cmt_time = cmt_time;
		this.cmt_id = cmt_id;
	}
	
	public CommentDTO() {
		
	}

	
	
	


	public int getCmt_code() {
		return cmt_code;
	}

	public void setCmt_code(int cmt_code) {
		this.cmt_code = cmt_code;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public String getCmt_time() {
		return cmt_time;
	}

	public void setCmt_time(String cmt_time) {
		this.cmt_time = cmt_time;
	}

	public int getCmt_recipe() {
		return cmt_recipe;
	}

	public void setCmt_recipe(int cmt_recipe) {
		this.cmt_recipe = cmt_recipe;
	}

	public String getCmt_id() {
		return cmt_id;
	}

	public void setCmt_id(String cmt_id) {
		this.cmt_id = cmt_id;
	}

	@Override
	public String toString() {
		return "CommentDTO [cmt_code=" + cmt_code + ", cmt_content=" + cmt_content + ", cmt_time=" + cmt_time
				+ ", cmt_recipe=" + cmt_recipe + ", cmt_id=" + cmt_id + "]";
	}
	
	
	
}
