package org.java.service;

import org.java.bean.Car;
import org.java.bean.Page;

/**  
 * @ClassName: CarService  
 * @Description: 购物车业务层  
 * @author 邱高强 
 * @date 2020年4月13日 
 * @date 上午10:20:43    
 */ 
public interface CarService {

	/**  
	 * @Title: add_car  
	 * @Description: 商品加入购物车
	 * @param car
	 * @return int
	 */
	public int add_car(Car car);
	
	/**  
	 * @Title: del_car  
	 * @Description: 根据id将商品移出购物车
	 * @param id
	 * @return int
	 */
	public int del_car(String id);
	
	/**  
	 * @Title: sel_all  
	 * @Description: 通过用户账号分页查询该用户所有购物车列表
	 * @param pageSize
	 * @param pageNumber
	 * @param account
	 * @return Page
	 */
	public Page sel_all(int pageSize, int pageNumber, String account);
	
	/**  
	 * @Title: sel_one  
	 * @Description: 通过账号及商品id判断此用户是否重复将此商品加入购物车
	 * @param decorateId
	 * @param account
	 * @return int
	 */
	public int sel_one(String decorateId, String account);
}
