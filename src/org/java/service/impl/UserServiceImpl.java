/**
 * 
 */
package org.java.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.java.bean.Page;
import org.java.bean.User;
import org.java.dao.UserDao;
import org.java.dao.impl.UserDaoImpl;
import org.java.service.UserService;

/**  
* @ClassName: UserServiceImpl  
* @Description: 业务层  
* @author 邱高强  
* @date 2020年3月2日    
*/
public class UserServiceImpl implements UserService {

	private UserDao dao = new UserDaoImpl();
	Page page = new Page();
	
	/**
	  *  通过用户账号、密码查找用户，登录可用，可获取用户大部分信息
	 */
	@Override
	public int sel_user(String account, String password) {
		// TODO Auto-generated method stub
		
		int rows = dao.sel_user(account, password);
		
		return rows;
	}
	
	/**
	 *	查询所有用户列表
	 */
	@Override
	public Page sel_all(int pageSize, int pageNumber) {
		// TODO Auto-generated method stub
		
		Page page = new Page();
		
		//页面大小，每页显示多少条
		page.setPageSize(pageSize);
		//第几页
		page.setPageNumber(pageNumber);
		
		//总条数
		long count = dao.sel_page();
		
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
		page.setList(dao.sel_all(map));	
		
		//将总页数，第几页，每页显示多少条返回
		return page;
	}

	/**
	 *	通过账户查询用户信息
	 */
	@Override
	public User sel_one(String account) {
		// TODO Auto-generated method stub
		
		User user = dao.sel_one(account);
		
		return user;
	}
	
	/**
	  *  往数据库新增用户，注册可用
	 */
	@Override
	public int add_user(User user) {
		// TODO Auto-generated method stub
		
		int rows = dao.add_user(user);
		
		return rows;
	}

	/**
	  * 查询数据库中是否已存在此账号
	 */
	@Override
	public int sel_account(String newAccount) {
		// TODO Auto-generated method stub
		
		int rows = dao.sel_account(newAccount);
		
		return rows;
	}

	/**
	  *  查询数据库中此账号是否有此邮箱
	 */
	@Override
	public String sel_mail(String newAccount) {
		// TODO Auto-generated method stub
		
		String mail = dao.sel_mail(newAccount);
		
		return mail;
	}

	/**
	  * 通过账号修改密码
	 */
	@Override
	public int update_password(String account, String password) {
		// TODO Auto-generated method stub
		
		int rows = dao.update_password(account, password);
		
		return rows;
	}

	/**
	 * 通过账号修改头像
	 */
	@Override
	public int update_photo(String account, String photo) {
		// TODO Auto-generated method stub
		
		int rows = dao.update_photo(account, photo);
		
		return rows;
	}

	/**
	  * 通过账户修改用户信息
	 */
	@Override
	public int update_userInfo(String account, String username, String password, String mail) {
		// TODO Auto-generated method stub
		
		int rows = dao.update_userInfo(account, username, password, mail);
		
		return rows;
	}

}
