package org.java.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.java.bean.Comment;
import org.java.bean.Page;
import org.java.dao.CommentDao;
import org.java.dao.impl.CommentDaoImpl;
import org.java.service.CommentService;

/**  
 * @ClassName: CommentServiceImpl  
 * @Description: 用户评论业务层实现类  
 * @author 邱高强 
 * @date 2020年4月17日 
 * @date 上午10:20:55    
 */ 
public class CommentServiceImpl implements CommentService {

	private CommentDao dao = new CommentDaoImpl();
	
	Page page = new Page();
	
	/**
	 *	新增评论
	 */
	@Override
	public int add_comment(Comment comment) {
		// TODO Auto-generated method stub
		
		int rows = dao.add_comment(comment);
		
		return rows;
	}

	/**
	 *	分页查询该用户发布过的所有评论
	 */
	@Override
	public Page sel_account(int pageSize, int pageNumber, String account) {
		// TODO Auto-generated method stub

		//页面大小，每页显示多少条
		page.setPageSize(pageSize);
		//第几页
		page.setPageNumber(pageNumber);
		
		//总条数
		long count = dao.sel_pageAccount(account);
		
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
		page.setList(dao.sel_account(map, account));	
		
		//将总页数，第几页，每页显示多少条返回
		return page;
	}

	/**
	 *	查询该商品最近的三条评论
	 */
	@Override
	public List<Comment> sel_three(String decorateId) {
		// TODO Auto-generated method stub
		
		List<Comment> list = dao.sel_three(decorateId);
		
		return list;
	}

	/**
	 *	分页查询该商品的所有评论
	 */
	@Override
	public Page sel_all(int pageSize, int pageNumber, String decorateId) {
		// TODO Auto-generated method stub

		//页面大小，每页显示多少条
		page.setPageSize(pageSize);
		//第几页
		page.setPageNumber(pageNumber);
		
		//总条数
		long count = dao.sel_pageDecorateId(decorateId);
		
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
		page.setList(dao.sel_all(map, decorateId));	
		
		//将总页数，第几页，每页显示多少条返回
		return page;
	}

}
