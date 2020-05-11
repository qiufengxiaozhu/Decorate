/**
 * 
 */
package org.java.bean;

/**  
* @ClassName: decorate  
* @Description: 装饰品实体类  
* @author 邱高强
* @date 2020年4月8日  
* @time 上午11:09:32   
*/
public class Decorate {

	
	/**  
	* @Description id:{ 装饰品id }
	*/ 
	private int id;
	
	/**  
	* @Description photo:{ 装饰品图片 }
	*/ 
	private String photo;
	
	/**  
	* @Description name:{ 装饰品名称 }
	*/ 
	private String name;
	
	/**  
	* @Description descript:{ 装饰品描述 }
	*/ 
	private String descript;
	
	/**  
	* @Description categoryId:{ 装饰品材料分类id }
	*/ 
	private String categoryId;
	
	/**  
	* @Description category:{ 装饰品材料种类 }
	*/ 
	private String category;
	
	/**  
	* @Description style:{ 装饰风格 }
	*/ 
	private String style;
	
	/**  
	* @Description price:{ 单价 }
	*/ 
	private double price;
	
	/**  
	* @Description number:{ 库存 }
	*/ 
	private String number;
	
	/**  
	* @Description flag:{ 是否下架的标志位：0->已下架，1->正在售卖 }
	*/ 
	private String flag;
	
	
	/**  
	* 创建一个新的实例 decorate.    
	*/ 
	public Decorate() {
		super();
	}

	/**  
	* 创建一个新的实例 decorate.  
	* @param id
	* @param photo
	* @param name
	* @param descript
	* @param categoryId
	* @param category
	* @param style
	* @param price
	* @param number
	* @param flag  
	*/ 
	public Decorate(int id, String photo, String name, String descript, String categoryId, String category,
			String style, double price, String number, String flag) {
		super();
		this.id = id;
		this.photo = photo;
		this.name = name;
		this.descript = descript;
		this.categoryId = categoryId;
		this.category = category;
		this.style = style;
		this.price = price;
		this.number = number;
		this.flag = flag;
	}

	/**  
	* 创建一个新的实例 decorate.  新增装饰使用
	* @param photo
	* @param name
	* @param descript
	* @param categoryId
	* @param style
	* @param price
	* @param number  
	*/ 
	public Decorate(String photo, String name, String descript, String categoryId, String style, double price,
			String number) {
		super();
		this.photo = photo;
		this.name = name;
		this.descript = descript;
		this.categoryId = categoryId;
		this.style = style;
		this.price = price;
		this.number = number;
	}

	/**
	 * @param id
	 * @param photo
	 * @param name
	 * @param descript
	 * @param categoryId
	 * @param style
	 * @param price
	 * @param number
	 */
	public Decorate(int id, String photo, String name, String descript, String categoryId, String style, double price,
			String number) {
		super();
		this.id = id;
		this.photo = photo;
		this.name = name;
		this.descript = descript;
		this.categoryId = categoryId;
		this.style = style;
		this.price = price;
		this.number = number;
	}

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getPhoto() {
		return photo;
	}



	public void setPhoto(String photo) {
		this.photo = photo;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getDescript() {
		return descript;
	}



	public void setDescript(String descript) {
		this.descript = descript;
	}



	public String getCategoryId() {
		return categoryId;
	}



	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getStyle() {
		return style;
	}



	public void setStyle(String style) {
		this.style = style;
	}



	public double getPrice() {
		return price;
	}



	public void setPrice(double price) {
		this.price = price;
	}



	public String getNumber() {
		return number;
	}



	public void setNumber(String number) {
		this.number = number;
	}



	public String getFlag() {
		return flag;
	}



	public void setFlag(String flag) {
		this.flag = flag;
	}



	@Override
	public String toString() {
		return "decorate [id=" + id + ", photo=" + photo + ", name=" + name + ", descript=" + descript + ", categoryId="
				+ categoryId + ", category=" + category + ", style=" + style + ", price=" + price + ", number=" + number
				+ ", flag=" + flag + "]";
	}

	
	
	
	
}
