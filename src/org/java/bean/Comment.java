package org.java.bean;

import java.util.Date;

/**  
 * @ClassName: Comment  
 * @Description: 用户评论  
 * @author 邱高强 
 * @date 2020年4月17日 
 * @date 上午9:55:47    
 */ 
public class Comment {

	/**  
	 * @Description id:{ 用户评论表id }
	 */ 
	private int id;
	
	/**  
	 * @Description account:{ 评论用户的账号 }
	 */ 
	private String account;
	
	/**  
	 * @Description decorateId:{ 评论的商品id-外键 }
	 */ 
	private String decorateId;
	
	/**  
	 * @Description photo:{ 评论的商品的图片 }
	 */ 
	private String photo;
	
	/**  
	 * @Description name:{ 评论的商品的名称 }
	 */ 
	private String name;
	
	/**  
	 * @Description flag:{ 评论的商品的是否下架标志 }
	 */ 
	private String flag;
	
	/**  
	 * @Description comment:{ 评论内容 }
	 */ 
	private String comment;
	
	/**  
	 * @Description descript:{ 收到的产品是否与产品描述一致打分 }
	 */ 
	private String descript;
	
	/**  
	 * @Description quality:{ 产品质量是否达标打分 }
	 */ 
	private String quality;
	
	/**  
	 * @Description publicTime:{ 发表时间 }
	 */ 
	private Date publicTime;

	/**  
	  * 创建一个新的实例 Comment.    
	 */
	public Comment() {
		super();
	}


	/**  
	  * 创建一个新的实例 Comment.  
	 * @param id
	 * @param account
	 * @param decorateId
	 * @param photo
	 * @param name
	 * @param flag
	 * @param comment
	 * @param descript
	 * @param quality
	 * @param publicTime  
	 */
	public Comment(int id, String account, String decorateId, String photo, String name, String flag, String comment,
			String descript, String quality, Date publicTime) {
		super();
		this.id = id;
		this.account = account;
		this.decorateId = decorateId;
		this.photo = photo;
		this.name = name;
		this.flag = flag;
		this.comment = comment;
		this.descript = descript;
		this.quality = quality;
		this.publicTime = publicTime;
	}


	/**  
	  * 创建一个新的实例 Comment.  
	 * @param account
	 * @param decorateId
	 * @param comment
	 * @param descript
	 * @param quality  
	 */
	public Comment(String account, String decorateId, String comment, String descript, String quality) {
		super();
		this.account = account;
		this.decorateId = decorateId;
		this.comment = comment;
		this.descript = descript;
		this.quality = quality;
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


	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}


	/**
	 * @param comment the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}


	/**
	 * @return the descript
	 */
	public String getDescript() {
		return descript;
	}


	/**
	 * @param descript the descript to set
	 */
	public void setDescript(String descript) {
		this.descript = descript;
	}


	/**
	 * @return the quality
	 */
	public String getQuality() {
		return quality;
	}


	/**
	 * @param quality the quality to set
	 */
	public void setQuality(String quality) {
		this.quality = quality;
	}


	/**
	 * @return the publicTime
	 */
	public Date getPublicTime() {
		return publicTime;
	}


	/**
	 * @param publicTime the publicTime to set
	 */
	public void setPublicTime(Date publicTime) {
		this.publicTime = publicTime;
	}


	@Override
	public String toString() {
		return "Comment [id=" + id + ", account=" + account + ", decorateId=" + decorateId + ", photo=" + photo
				+ ", name=" + name + ", flag=" + flag + ", comment=" + comment + ", descript=" + descript + ", quality="
				+ quality + ", publicTime=" + publicTime + "]";
	}


}
