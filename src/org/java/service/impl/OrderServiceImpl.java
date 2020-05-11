package org.java.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.java.bean.Order;
import org.java.bean.Page;
import org.java.dao.OrderDao;
import org.java.dao.impl.OrderDaoImpl;
import org.java.service.OrderService;

/**  
 * @ClassName: OrderServiceImpl  
 * @Description: 用户订单业务层 实现类  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午3:11:27    
 */ 
public class OrderServiceImpl implements OrderService {

	private OrderDao dao = new OrderDaoImpl();
	private Page page = new Page();
	
	/**
	 *	新增订单
	 */
	@Override
	public int add_order(Order order) {
		// TODO Auto-generated method stub
		
		int rows = dao.add_order(order);
		
		return rows;
	}

	/**
	 *	通过用户账号分页查询该用户所有订单
	 */
	@Override
	public Page sel_account(int pageSize, int pageNumber, String account) {
		// TODO Auto-generated method stub
				
		//页面大小，每页显示多少条
		page.setPageSize(pageSize);
		//第几页
		System.out.println("选择第"+pageNumber+"页数据。");
		if(pageNumber > 0)
			page.setPageNumber(pageNumber);
		else {
			pageNumber = 1;
			page.setPageNumber(pageNumber);
		}
		
		//总条数
		long count = dao.sel_pageAccount(account);
		
		//总页数
		page.setTotal(count%pageSize==0 ? count/pageSize : count/pageSize+1);
		
		//当有数据改动时（可能是被删除），判断总页数是不是已经小于当前页数
//		if(page.getTotal() <= pageNumber && page.getTotal() > 0) {
//			
//			pageNumber = (int) page.getTotal();
//			page.setPageNumber(pageNumber);
//		}
		
		//封装map
		Map<String,Object> map =new HashMap<>();
		map.put("pageStart",pageSize*(pageNumber-1));
		map.put("pageSize", pageSize);
		
		//将查询到的list集合赋值给page
		page.setList(dao.sel_account(map, account));	
		
		//将总页数，第几页，每页显示多少条返回
		return page;
		
	}

	/**
	 *	通过用户账号分页查询该用户在某个下单时间之后的所有订单
	 */
	@Override
	public Page sel_orderTime(int pageSize, int pageNumber, String account, String orderTime) {
		// TODO Auto-generated method stub

		//页面大小，每页显示多少条
		page.setPageSize(pageSize);
		//第几页
		page.setPageNumber(pageNumber);
		
		//总条数
		long count = dao.sel_pageOrderTime(account, orderTime);
		
		//总页数
		page.setTotal(count%pageSize==0 ? count/pageSize : count/pageSize+1);
		
		//当有数据改动时（可能是被删除），判断总页数是不是已经小于当前页数
		if(page.getTotal() <= pageNumber) {
			
			pageNumber = (int) page.getTotal();
			page.setPageNumber(pageNumber);
		}
		
		//封装map
		Map<String,Object> map =new HashMap<>();
		map.put("pageStart",pageSize*(pageNumber-1));
		map.put("pageSize", pageSize);
		
		//将查询到的list集合赋值给page
		page.setList(dao.sel_orderTime(map, account, orderTime));	
		
		//将总页数，第几页，每页显示多少条返回
		return page;
	}

}
