package org.java.bean;

import java.util.Date;

/**  
* @ClassName: User  
* @Description: 登录用户实体类  
* @author 邱高强  
* @date 2020年3月1日    
*/  
public class User {
	
	/**  
	* @Description id:{ 用户id }
	*/ 
	private int id;			
	
	/**  
	* @Description name:{ 用户姓名 }
	*/ 
	private String name;	
	
	/**  
	* @Description account:{ 用户账号 }
	*/ 
	private String account;	
	
	/**  
	* @Description password:{ 用户密码 }
	*/ 
	private String password;
	
	/**  
	* @Description sex:{ 用户性别 }
	*/ 
	private String sex;		
	
	/**  
	* @Description mail:{ 用户邮箱 }
	*/ 
	private String mail;	
	
	/**  
	* @Description photo:{ 用户头像 }
	*/ 
	private String photo;
	
	/**  
	 * @Description total:{ 总消费 }
	 */ 
	private String total;
	
	/**  
	 * @Description member:{ 会员等级 }
	 */ 
	private String member;
	
	/**  
	* @Description createTime:{ 注册日期 }
	*/ 
	private Date createTime;
	
	/**  
	 * @Description role:{ 用户身份，此为中文，不仅是数字，方便读取 }
	 */ 
	private String role;
	
	/**  
	* @Description userType:{ 用户身份,默认值为0；说明：0->普通用户，1->管理员 ，2->超级管理员}
	*/ 
	private int userType;			
	
	
	/**  
	* 创建一个新的实例 User.    
	*/ 
	public User() {
		super();
	}

	/**  
	  * 创建一个新的实例 User.  
	 * @param id
	 * @param name
	 * @param account
	 * @param password
	 * @param sex
	 * @param mail
	 * @param photo
	 * @param total
	 * @param member
	 * @param createTime
	 * @param role
	 * @param userType  
	 */
	public User(int id, String name, String account, String password, String sex, String mail, String photo,
			String total, String member, Date createTime, String role, int userType) {
		super();
		this.id = id;
		this.name = name;
		this.account = account;
		this.password = password;
		this.sex = sex;
		this.mail = mail;
		this.photo = photo;
		this.total = total;
		this.member = member;
		this.createTime = createTime;
		this.role = role;
		this.userType = userType;
	}

	/**  
	* 创建一个新的实例 User.  
	* @param name
	* @param account
	* @param password
	* @param sex
	* @param mail  
	*/ 
	public User(String account, String name, String password, String sex, String mail) {
		super();
		this.name = name;
		this.account = account;
		this.password = password;
		this.sex = sex;
		this.mail = mail;
	}
	
	/**  
	* 创建一个新的实例 User.  
	* @param id
	* @param name
	* @param account
	* @param password
	* @param sex
	* @param mail
	* @param photo  
	*/ 
	public User(String account, String name, String password, String sex, String mail, String photo) {
		super();
		this.name = name;
		this.account = account;
		this.password = password;
		this.sex = sex;
		this.mail = mail;
		this.photo = photo;
	}
	
	/**  
	* 创建一个新的实例 User.  
	* @param name
	* @param account
	* @param password
	* @param sex
	* @param mail
	* @param photo
	* @param userType  
	*/ 
	public User(int id, String account, String name, String password, String sex, String mail, String photo, int userType) {
		super();
		this.id = id;
		this.name = name;
		this.account = account;
		this.password = password;
		this.sex = sex;
		this.mail = mail;
		this.photo = photo;
		this.userType = userType;
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
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the mail
	 */
	public String getMail() {
		return mail;
	}

	/**
	 * @param mail the mail to set
	 */
	public void setMail(String mail) {
		this.mail = mail;
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
	 * @return the member
	 */
	public String getMember() {
		return member;
	}

	/**
	 * @param member the member to set
	 */
	public void setMember(String member) {
		this.member = member;
	}

	/**
	 * @return the createTime
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}

	/**
	 * @return the userType
	 */
	public int getUserType() {
		return userType;
	}

	/**
	 * @param userType the userType to set
	 */
	public void setUserType(int userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", account=" + account + ", password=" + password + ", sex=" + sex
				+ ", mail=" + mail + ", photo=" + photo + ", total=" + total + ", member=" + member + ", createTime="
				+ createTime + ", role=" + role + ", userType=" + userType + "]";
	}

}
