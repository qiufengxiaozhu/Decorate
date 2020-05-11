package org.java.bean;

/**  
 * @ClassName: Grade  
 * @Description: 会员等级表  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午3:31:08    
 */ 
public class Grade {

	/**  
	 * @Description id:{ 会员等级表id }
	 */ 
	private int id;
	
	/**  
	 * @Description name:{ 会员称号 }
	 */ 
	private String name;
	
	/**  
	 * @Description discount:{ 会员折扣 }
	 */ 
	private String discount;
	
	/**  
	 * @Description score:{ 会员积分临界值 }
	 */ 
	private String score;

	/**  
	  * 创建一个新的实例 Grade.    
	 */
	public Grade() {
		super();
	}

	/**  
	  * 创建一个新的实例 Grade.  
	 * @param id
	 * @param name
	 * @param discount
	 * @param score  
	 */
	public Grade(int id, String name, String discount, String score) {
		super();
		this.id = id;
		this.name = name;
		this.discount = discount;
		this.score = score;
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
	 * @return the discount
	 */
	public String getDiscount() {
		return discount;
	}

	/**
	 * @param discount the discount to set
	 */
	public void setDiscount(String discount) {
		this.discount = discount;
	}

	/**
	 * @return the score
	 */
	public String getScore() {
		return score;
	}

	/**
	 * @param score the score to set
	 */
	public void setScore(String score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Grade [id=" + id + ", name=" + name + ", discount=" + discount + ", score=" + score + "]";
	}
	
	
	
}
