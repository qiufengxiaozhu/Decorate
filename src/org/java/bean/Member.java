package org.java.bean;

/**  
 * @ClassName: Member  
 * @Description: 会员表  
 * @author 邱高强 
 * @date 2020年4月15日 
 * @date 下午5:36:18    
 */ 
public class Member {

	/**  
	 * @Description id:{ 会员id }
	 */ 
	private int id;
	
	/**  
	 * @Description account:{ 会员账号 }
	 */ 
	private String account;
	
	/**  
	 * @Description total:{ 会员总消费 }
	 */ 
	private String total;
	
	/**  
	 * @Description gradeId:{ 会员等级表id }
	 */ 
	private String gradeId;
	
	/**  
	 * @Description name:{ 会员名称 }
	 */ 
	private String name;
	
	/**  
	 * @Description discount:{ 会员折扣 }
	 */ 
	private String discount;
	
	/**  
	 * @Description score:{ 会员积分 }
	 */ 
	private String score;

	/**  
	  * 创建一个新的实例 Member.    
	 */
	public Member() {
		super();
	}

	/**  
	  * 创建一个新的实例 Member.  
	 * @param id
	 * @param account
	 * @param total
	 * @param gradeId
	 * @param name
	 * @param discount
	 * @param score  
	 */
	public Member(int id, String account, String total, String gradeId, String name, String discount, String score) {
		super();
		this.id = id;
		this.account = account;
		this.total = total;
		this.gradeId = gradeId;
		this.name = name;
		this.discount = discount;
		this.score = score;
	}

	/**  
	  * 创建一个新的实例 Member.  
	 * @param id
	 * @param account
	 * @param total
	 * @param gradeId  
	 */
	public Member(int id, String account, String total, String gradeId) {
		super();
		this.id = id;
		this.account = account;
		this.total = total;
		this.gradeId = gradeId;
	}
	
	/**  
	  * 创建一个新的实例 Member.  
	 * @param account
	 * @param total
	 * @param gradeId  
	 */
	public Member(String account, String total, String gradeId) {
		super();
		this.account = account;
		this.total = total;
		this.gradeId = gradeId;
	}

	
	
	/**  
	  * 创建一个新的实例 Member.  
	 * @param account  
	 */
	public Member(String account) {
		super();
		this.account = account;
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
	 * @return the total
	 */
	public String getTotal() {
		return total;
	}

	/**
	 * @param total the total to set
	 */
	public void setTotal(String total) {
		this.total = total;
	}

	/**
	 * @return the gradeId
	 */
	public String getGradeId() {
		return gradeId;
	}

	/**
	 * @param gradeId the gradeId to set
	 */
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
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
		return "Member [id=" + id + ", account=" + account + ", total=" + total + ", gradeId=" + gradeId + ", name="
				+ name + ", discount=" + discount + ", score=" + score + "]";
	}
	
	
}
