package org.java.bean;

/**  
 * @ClassName: Car  
 * @Description: 购物车实体类  
 * @author 邱高强 
 * @date 2020年4月13日 
 * @date 上午9:38:36    
 */ 
public class Car {

	/**  
	 * @Description id:{ 购物车id }
	 */ 
	private int id;
	
	/**  
	 * @Description account:{ 预购者账号 }
	 */ 
	private String account;
	
	/**  
	 * @Description decorateId:{ 商品id }
	 */ 
	private String decorateId;
	
	/**  
	 * @Description photo:{ 商品图片 }
	 */ 
	private String photo;
	
	/**  
	 * @Description name:{ 商品名称 }
	 */ 
	private String name;
	
	/**  
	 * @Description price:{ 商品单价 }
	 */ 
	private double price;
	
	/**  
	 * @Description flag:{ 商品是否下架 }
	 */ 
	private String flag;

	/**  
	  * 创建一个新的实例 Car.    
	 */
	public Car() {
		super();
	}

	/**  
	  * 创建一个新的实例 Car.  
	 * @param id
	 * @param account
	 * @param decorateId
	 * @param photo
	 * @param name
	 * @param price
	 * @param flag  
	 */
	public Car(int id, String account, String decorateId, String photo, String name, double price, String flag) {
		super();
		this.id = id;
		this.account = account;
		this.decorateId = decorateId;
		this.photo = photo;
		this.name = name;
		this.price = price;
		this.flag = flag;
	}

	/**  
	  * 创建一个新的实例 Car.  
	 * @param id
	 * @param account
	 * @param decorateId  
	 */
	public Car(String account, String decorateId) {
		super();
		this.account = account;
		this.decorateId = decorateId;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the account
	 */
	public String getAccount() {
		return account;
	}

	/**
	 * @param account the account to set
	 */
	public void setAccount(String account) {
		this.account = account;
	}

	/**
	 * @return the decorateId
	 */
	public String getDecorateId() {
		return decorateId;
	}

	/**
	 * @param decorateId the decorateId to set
	 */
	public void setDecorateId(String decorateId) {
		this.decorateId = decorateId;
	}

	/**
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}

	/**
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * @return the flag
	 */
	public String getFlag() {
		return flag;
	}

	/**
	 * @param flag the flag to set
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "Car [id=" + id + ", account=" + account + ", decorateId=" + decorateId + ", photo=" + photo + ", name="
				+ name + ", price=" + price + ", flag=" + flag + "]";
	}


	
}
