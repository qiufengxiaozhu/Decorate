package org.java.service;

import org.java.bean.Order;
import org.java.bean.Page;

/**  
 * @ClassName: OrderService  
 * @Description: 用户订单业务层  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午3:08:39    
 */ 
public interface OrderService {

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
	 * @param pageSize
	 * @param pageNumber
	 * @param account
	 * @return Page
	 */
	public Page sel_account(int pageSize, int pageNumber, String account);
	
	/**  
	 * @Title: sel_orderTime  
	 * @Description: 通过用户账号分页查询该用户在某个下单时间之后的所有订单
	 * @param pageSize
	 * @param pageNumber
	 * @param account
	 * @param orderTime
	 * @return Page
	 */
	public Page sel_orderTime(int pageSize, int pageNumber, String account, String orderTime);

}
