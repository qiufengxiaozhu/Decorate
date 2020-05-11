package org.java.bean;

import java.util.Date;

/**  
 * @ClassName: Order  
 * @Description: 用户订单实体类  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午2:06:53    
 */ 
public class Order {

	
	/**  
	 * @Description id:{ 订单表id }
	 */ 
	private int id;
	
	/**  
	 * @Description orderNumber:{ 订单号 }
	 */ 
	private String orderNumber;
	
	/**  
	 * @Description account:{ 购买者账号 }
	 */ 
	private String account;
	
	/**  
	 * @Description decorateId:{ 购买的商品的id-外键 }
	 */ 
	private String decorateId;
	
	/**  
	 * @Description photo:{ 商品图片 }
	 */ 
	private String photo;
	
	/**  
	 * @Description decorateName:{ 商品名称 }
	 */ 
	private String decorateName;
	
	/**  
	 * @Description flag:{ 商品是否下架标志 }
	 */ 
	private String flag;
	
	/**  
	 * @Description number:{ 购买数量 }
	 */ 
	private String number;
	
	/**  
	 * @Description needTotal:{ 应付金额 }
	 */ 
	private String needTotal;
	
	/**  
	 * @Description discount:{ 会员折扣 }
	 */ 
	private String discount;
	
	/**  
	 * @Description actuallyTotal:{ 实付金额 }
	 */ 
	private String actuallyTotal;
	
	/**  
	 * @Description name:{ 收货人姓名 }
	 */ 
	private String name;
	
	/**  
	 * @Description tel:{ 收货人手机号 }
	 */ 
	private String tel;
	
	/**  
	 * @Description lng:{ 收货地址经度 }
	 */ 
	private String lng;
	
	/**  
	 * @Description lat:{ 收货地址纬度 }
	 */ 
	private String lat;
	
	/**  
	 * @Description address:{ 收货地址 }
	 */ 
	private String address;
	
	/**  
	 * @Description orderTime:{ 下单时间 }
	 */ 
	private Date orderTime;

	/**  
	  * 创建一个新的实例 Order.    
	 */
	public Order() {
		super();
	}


	/**  
	  * 创建一个新的实例 Order.  
	 * @param id
	 * @param orderNumber
	 * @param account
	 * @param decorateId
	 * @param photo
	 * @param decorateName
	 * @param flag
	 * @param number
	 * @param needTotal
	 * @param discount
	 * @param actuallyTotal
	 * @param name
	 * @param tel
	 * @param lng
	 * @param lat
	 * @param address
	 * @param orderTime  
	 */
	public Order(int id, String orderNumber, String account, String decorateId, String photo, String decorateName,
			String flag, String number, String needTotal, String discount, String actuallyTotal, String name,
			String tel, String lng, String lat, String address, Date orderTime) {
		super();
		this.id = id;
		this.orderNumber = orderNumber;
		this.account = account;
		this.decorateId = decorateId;
		this.photo = photo;
		this.decorateName = decorateName;
		this.flag = flag;
		this.number = number;
		this.needTotal = needTotal;
		this.discount = discount;
		this.actuallyTotal = actuallyTotal;
		this.name = name;
		this.tel = tel;
		this.lng = lng;
		this.lat = lat;
		this.address = address;
		this.orderTime = orderTime;
	}


	/**  
	  * 创建一个新的实例 Order.  
	 * @param orderNumber
	 * @param account
	 * @param decorateId
	 * @param number
	 * @param needTotal
	 * @param discount
	 * @param actuallyTotal
	 * @param name
	 * @param tel
	 * @param lng
	 * @param lat
	 * @param address  
	 */
	public Order(String orderNumber, String account, String decorateId, String number, String needTotal,
			String discount, String actuallyTotal, String name, String tel, String lng, String lat, String address) {
		super();
		this.orderNumber = orderNumber;
		this.account = account;
		this.decorateId = decorateId;
		this.number = number;
		this.needTotal = needTotal;
		this.discount = discount;
		this.actuallyTotal = actuallyTotal;
		this.name = name;
		this.tel = tel;
		this.lng = lng;
		this.lat = lat;
		this.address = address;
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
	 * @return the orderNumber
	 */
	public String getOrderNumber() {
		return orderNumber;
	}


	/**
	 * @param orderNumber the orderNumber to set
	 */
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
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
	 * @return the decorateName
	 */
	public String getDecorateName() {
		return decorateName;
	}


	/**
	 * @param decorateName the decorateName to set
	 */
	public void setDecorateName(String decorateName) {
		this.decorateName = decorateName;
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
	 * @return the number
	 */
	public String getNumber() {
		return number;
	}


	/**
	 * @param number the number to set
	 */
	public void setNumber(String number) {
		this.number = number;
	}


	/**
	 * @return the needTotal
	 */
	public String getNeedTotal() {
		return needTotal;
	}


	/**
	 * @param needTotal the needTotal to set
	 */
	public void setNeedTotal(String needTotal) {
		this.needTotal = needTotal;
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
	 * @return the actuallyTotal
	 */
	public String getActuallyTotal() {
		return actuallyTotal;
	}


	/**
	 * @param actuallyTotal the actuallyTotal to set
	 */
	public void setActuallyTotal(String actuallyTotal) {
		this.actuallyTotal = actuallyTotal;
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
	 * @return the tel
	 */
	public String getTel() {
		return tel;
	}


	/**
	 * @param tel the tel to set
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}


	/**
	 * @return the lng
	 */
	public String getLng() {
		return lng;
	}


	/**
	 * @param lng the lng to set
	 */
	public void setLng(String lng) {
		this.lng = lng;
	}


	/**
	 * @return the lat
	 */
	public String getLat() {
		return lat;
	}


	/**
	 * @param lat the lat to set
	 */
	public void setLat(String lat) {
		this.lat = lat;
	}


	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}


	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}


	/**
	 * @return the orderTime
	 */
	public Date getOrderTime() {
		return orderTime;
	}


	/**
	 * @param orderTime the orderTime to set
	 */
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}


	@Override
	public String toString() {
		return "Order [id=" + id + ", orderNumber=" + orderNumber + ", account=" + account + ", decorateId="
				+ decorateId + ", photo=" + photo + ", decorateName=" + decorateName + ", flag=" + flag + ", number="
				+ number + ", needTotal=" + needTotal + ", discount=" + discount + ", actuallyTotal=" + actuallyTotal
				+ ", name=" + name + ", tel=" + tel + ", lng=" + lng + ", lat=" + lat + ", address=" + address
				+ ", orderTime=" + orderTime + "]";
	}


}
