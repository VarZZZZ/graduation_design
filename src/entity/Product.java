package entity;

public class Product {
	private int id;
	private String code;
	private String name;
	private float price;
	private int cbid;
	private String color;
	private String description;
	private String imageurl;
	private CategoryA categoryA;
	private CategoryB categoryB;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getCbid() {
		return cbid;
	}
	public void setCbid(int cbid) {
		this.cbid = cbid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}


    public CategoryA getCategoryA() {
        return categoryA;
    }

    public void setCategoryA(CategoryA categoryA) {
        this.categoryA = categoryA;
    }

    public CategoryB getCategoryB() {
        return categoryB;
    }

    public void setCategoryB(CategoryB categoryB) {
        this.categoryB = categoryB;
    }

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
}
