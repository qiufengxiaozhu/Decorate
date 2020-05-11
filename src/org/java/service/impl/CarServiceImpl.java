package org.java.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.java.bean.Car;
import org.java.bean.Page;
import org.java.dao.CarDao;
import org.java.dao.impl.CarDaoImpl;
import org.java.service.CarService;

/**  
 * @ClassName: CarServiceImpl  
 * @Description: 购物车业务层实现类  
 * @author 邱高强 
 * @date 2020年4月13日 
 * @date 上午10:21:12    
 */ 
public class CarServiceImpl implements CarService {

	private CarDao dao = new CarDaoImpl();
	
	/**
	 *	商品加入购物车
	 */
	@Override
	public int add_car(Car car) {
		// TODO Auto-generated method stub
		
		int rows = dao.add_car(car);
		
		return rows;
	}

	/**
	 *	根据id将商品移出购物车
	 */
	@Override
	public int del_car(String id) {
		// TODO Auto-generated method stub
		
		int rows = dao.del_car(Integer.parseInt(id));
		
		return rows;
	}

	/**
	 *	通过用户账号分页查询该用户所有购物车列表
	 */
	@Override
	public Page sel_all(int pageSize, int pageNumber, String account) {
		// TODO Auto-generated method stub
		
		Page page = new Page();
		
		//页面大小，每页显示多少条
		page.setPageSize(pageSize);
		//第几页
		page.setPageNumber(pageNumber);
		
		//总条数
		long count = dao.sel_page(account);
		System.out.println("[count:"+count+"]");
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
		page.setList(dao.sel_all(map, account));	
				
		//将总页数，第几页，每页显示多少条返回
		return page;
	}

	/**
	 *	通过账号及商品id判断此用户是否重复将此商品加入购物车
	 */
	@Override
	public int sel_one(String decorateId, String account) {
		// TODO Auto-generated method stub
		
		int rows = dao.sel_one(decorateId, account);
		
		return rows;
	}

}
