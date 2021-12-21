package model;

public class RecipeDTO {

	private int recipe_code;
	private String recipe_name;
	private String recipe_method;
	private String recipe_food;
	private String recipe_img;
	private String recipe_cook1;
	private String recipe_cook2;

	public RecipeDTO(int recipe_code, String recipe_name, String recipe_method, String recipe_food, String recipe_img,
			String recipe_cook1, String recipe_cook2) {
		this.recipe_code = recipe_code;
		this.recipe_name = recipe_name;
		this.recipe_method = recipe_method;
		this.recipe_food = recipe_food;
		this.recipe_img = recipe_img;
		this.recipe_cook1 = recipe_cook1;
		this.recipe_cook2 = recipe_cook2;
	}

	
	
	public RecipeDTO(int recipe_code, String recipe_name, String recipe_method, String recipe_img) {
		super();
		this.recipe_code = recipe_code;
		this.recipe_name = recipe_name;
		this.recipe_method = recipe_method;
		this.recipe_img = recipe_img;
	}



	public RecipeDTO() {
	}

	public int getRecipe_code() {
		return recipe_code;
	}

	public void setRecipe_code(int recipe_code) {
		this.recipe_code = recipe_code;
	}

	public String getRecipe_name() {
		return recipe_name;
	}

	public void setRecipe_name(String recipe_name) {			
		this.recipe_name = recipe_name;
	}

	public String getRecipe_method() {
		return recipe_method;
	}

	public void setRecipe_method(String recipe_method) {
		this.recipe_method = recipe_method;
	}

	public String getRecipe_food() {
		return recipe_food;
	}

	public void setRecipe_food(String recipe_food) {
		this.recipe_food = recipe_food;
	}

	public String getRecipe_img() {
		return recipe_img;
	}

	public void setRecipe_img(String recipe_img) {
		this.recipe_img = recipe_img;
	}

	public String getRecipe_cook1() {
		return recipe_cook1;
	}

	public void setRecipe_cook1(String recipe_cook1) {
		this.recipe_cook1 = recipe_cook1;
	}

	public String getRecipe_cook2() {
		return recipe_cook2;
	}

	public void setRecipe_cook2(String recipe_cook2) {
		this.recipe_cook2 = recipe_cook2;
	}

	@Override
	public String toString() {
		return "RecipeDTO [recipe_code=" + recipe_code + ", recipe_name=" + recipe_name + ", recipe_method="
				+ recipe_method + ", recipe_food=" + recipe_food + ", recipe_img=" + recipe_img + ", recipe_cook1="
				+ recipe_cook1 + ", recipe_cook2=" + recipe_cook2 + "]";
	}
	
	
	
}
