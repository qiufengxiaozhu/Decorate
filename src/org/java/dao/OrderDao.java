package org.java.dao;

import java.util.List;
import java.util.Map;

import org.java.bean.Order;

/**  
 * @ClassName: OrderDao  
 * @Description: 用户订单数据库连接层  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午2:15:26    
 */ 
public interface OrderDao {

	/**  
	 * @Title: add_order  
	 * @Description: 新增订单
	 * @param order
	 * @return int
	 */
	public int add_order(Order order);
	
	/**  
	 * @Title: sel_account  
	 * @Description: 通过用户账号分页查询该用户所有订单
	 * @param page
	 * @param account
	 * @return List<Order>
	 */
	public List<Order> sel_account(Map<String,Object> page, String account);
	
	/**  
	 * @Title: sel_pageAccount  
	 * @Description: 统计该用户的所有订单能分成多少条
	 * @param account
	 * @return int
	 */
	public int sel_pageAccount(String account);
	
	/**  
	 * @Title: sel_orderTime  
	 * @Description: 通过用户账号分页查询该用户在某个下单时间之后的所有订单
	 * @param page
	 * @param account
	 * @param orderTime
	 * @return List<Order>
	 */
	public List<Order> sel_orderTime(Map<String,Object> page, String account, String orderTime);
	
	/**  
	 * @Title: sel_pageOrderTime  
	 * @Description: 统计该用户的所有订单中，下单时间在此之后的记录有多少条
	 * @param account
	 * @param orderTime
	 * @return int
	 */
	public int sel_pageOrderTime(String account, String orderTime);
}
