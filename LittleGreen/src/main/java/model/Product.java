package model;

import java.math.BigDecimal;

public class Product {
	private int id;
	private String name;
	private String description;
	private BigDecimal price;
	private String brand;
	private String fragranceType;
	private int volume;
	private String gender;
	private int launchYear;
	private int stockQuantity;
	private String imageUrl;

	public Product() {
		super();
	}

	public Product(int id, String name, String description, BigDecimal price, String brand, String fragranceType,
			int volume, String gender, int launchYear, int stockQuantity, String imageUrl) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.brand = brand;
		this.fragranceType = fragranceType;
		this.volume = volume;
		this.gender = gender;
		this.launchYear = launchYear;
		this.stockQuantity = stockQuantity;
		this.imageUrl = imageUrl;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getFragranceType() {
		return fragranceType;
	}

	public void setFragranceType(String fragranceType) {
		this.fragranceType = fragranceType;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getLaunchYear() {
		return launchYear;
	}

	public void setLaunchYear(int launchYear) {
		this.launchYear = launchYear;
	}

	public int getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
}
