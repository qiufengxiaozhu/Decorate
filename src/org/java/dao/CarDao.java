package org.java.dao;

import java.util.List;
import java.util.Map;

import org.java.bean.Car;

/**  
 * @ClassName: CarDao  
 * @Description: 购物车数据库连接层  
 * @author 邱高强 
 * @date 2020年4月13日 
 * @date 上午9:48:05    
 */ 
public interface CarDao {

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
	public int del_car(int id);
	
	/**  
	 * @Title: sel_all  
	 * @Description: 通过用户账号分页查询该用户所有购物车列表
	 * @param page
	 * @param account
	 * @return List<Car>
	 */
	public List<Car> sel_all(Map<String,Object> page, String account);
	
	/**  
	 * @Title: sel_page  
	 * @Description: 统计该用户收藏的商品能分成多少页
	 * @param account
	 * @return int
	 */
	public int sel_page(String account);
	
	/**  
	 * @Title: sel_one  
	 * @Description: 通过账号及商品id判断此用户是否重复将此商品加入购物车
	 * @param decorateId
	 * @param account
	 * @return int
	 */
	public int sel_one(String decorateId, String account);
}
