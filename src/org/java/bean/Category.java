/**
 * 
 */
package org.java.bean;

/**  
* @ClassName: Category  
* @Description: 装饰品材料分类  
* @author 邱高强
* @date 2020年4月8日  
* @time 下午5:45:45   
*/
public class Category {

	
	/**  
	* @Description id:{ 编号 }
	*/ 
	private int id;
	
	
	/**  
	* @Description category:{ 装饰材料种类 }
	*/ 
	private String category;
	
	
	/**  
	* @Description descript:{ 装饰材料描述 }
	*/ 
	private String descript;

	/**  
	* 创建一个新的实例 Category.    
	*/ 
	public Category() {
		super();
	}

	/**  
	* 创建一个新的实例 Category.  
	* @param id
	* @param category
	* @param descript  
	*/ 
	public Category(int id, String category, String descript) {
		super();
		this.id = id;
		this.category = category;
		this.descript = descript;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", category=" + category + ", descript=" + descript + "]";
	}
	
	
}
