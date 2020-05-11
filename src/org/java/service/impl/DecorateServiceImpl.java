/**
 * 
 */
package org.java.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.java.bean.Category;
import org.java.bean.Decorate;
import org.java.bean.Page;
import org.java.dao.CategoryDao;
import org.java.dao.DecorateDao;
import org.java.dao.impl.CategoryDaoImpl;
import org.java.dao.impl.DecorateDaoImpl;
import org.java.service.DecorateService;

/**  
* @ClassName: DecorateServiceImpl  
* @Description: 装饰品业务处理层实现类  
* @author 邱高强
* @date 2020年4月8日  
* @time 下午3:29:04   
*/
public class DecorateServiceImpl implements DecorateService {

	private DecorateDao dao = new DecorateDaoImpl();
	private CategoryDao categoryDao = new CategoryDaoImpl();
	
	/**
	 *	新增装饰
	 */
	@Override
	public int add_decorate(Decorate decorate) {
		// TODO Auto-generated method stub
		
		int rows = dao.add_decorate(decorate);
		
		return rows;
	}

	/**
	 *	通过id下架指定装饰品
	 */
	@Override
	public int delete_decorate(String[] id) {
		// TODO Auto-generated method stub
		
		int rows = dao.delete_decorate(id);
		
		return rows;
	}

	/**
	 *  修改装饰品信息
	 */
	@Override
	public int update_one(Decorate decorate) {
		// TODO Auto-generated method stub
		
		int rows = dao.update_one(decorate);
		
		return rows;
	}
	
	/**
	 *	商品被购买时，相应的库存减少
	 */
	@Override
	public int update_number(String id, String number) {
		// TODO Auto-generated method stub
		
		int rows = dao.update_number(Integer.parseInt(id), number);
		
		return rows;
	}
	
	/**
	 *	查询末尾3条已上架的装饰品
	 */
	@Override
	public List<Decorate> sel_three() {
		// TODO Auto-generated method stub
		
		List<Decorate> list = dao.sel_three();
		
		return list;
	}

	/**
	 *	通过装饰品id查找此装饰品所有信息
	 */
	@Override
	public Decorate sel_one(String id) {
		// TODO Auto-generated method stub
		
		Decorate decorate = dao.sel_one(Integer.parseInt(id));
		
		return decorate;
	}

	/**
	 *	分页查询所有已上架的装饰品
	 */
	@Override
	public Page sel_all(int pageSize, int pageNumber) {
		// TODO Auto-generated method stub
		
		Page page = new Page();
		
		//页面大小，每页显示多少条
		page.setPageSize(pageSize);
		//第几页
		if(pageNumber > 0) {
			page.setPageNumber(pageNumber);			
		}
		else {
			pageNumber = 1;
			page.setPageNumber(pageNumber);
		}
		
		//总条数
		long count = dao.sel_page();
		
		//总页数
		page.setTotal(count%pageSize==0 ? count/pageSize : count/pageSize+1);
		
		//当有数据改动时（可能是被删除），判断总页数是不是已经小于当前页数
		if(page.getTotal() <= pageNumber && pageNumber > 0) {
			
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
	 *	查询末尾6条已上架的装饰品，且装饰品材料为category
	 */
	@Override
	public List<Decorate> sel_category(String category) {
		// TODO Auto-generated method stub
		
		List<Decorate> list = dao.sel_category(category);
		
		return list;
	}

	/**
	 *	分页查询所有已上架的装饰品，且装饰品材料为category
	 */
	@Override
	public Page sel_category(int pageSize, int pageNumber, String category) {
		// TODO Auto-generated method stub
				
		Page page = new Page();
		
		//页面大小，每页显示多少条
		page.setPageSize(pageSize);
		//第几页
		page.setPageNumber(pageNumber);
		
		//封装map
		Map<String,Object> map =new HashMap<>();
		map.put("pageStart",pageSize*(pageNumber-1));
		map.put("pageSize", pageSize);
		
		//将查询到的list集合赋值给page
		page.setList(dao.sel_category(map, category));	
		
		//总条数
		long count = dao.sel_pageCategory(category);
		//System.out.println("[count:"+count+"]");
		//总页数
		page.setTotal(count%pageSize==0 ? count/pageSize : count/pageSize+1);
		
		//将总页数，第几页，每页显示多少条返回
		return page;
	}

	/**
	 *	分页查询所有已上架的装饰品，且装饰品材料为category，且装饰风格为style
	 */
	@Override
	public Page sel_style(int pageSize, int pageNumber, String category, String style) {
		// TODO Auto-generated method stub
		
		Page page = new Page();
		
		//页面大小，每页显示多少条
		page.setPageSize(pageSize);
		//第几页
		page.setPageNumber(pageNumber);
		
		//封装map
		Map<String,Object> map =new HashMap<>();
		map.put("pageStart",pageSize*(pageNumber-1));
		map.put("pageSize", pageSize);
		
		//查询所有类别
		List<Category> list = categoryDao.sel_all();
		//将类别存放在数组中
		String[] arr = null;	
		
		//判断需要查询的是某一特定材料分类还是全部
		if("0".equals(category)) {
			String str = "" ;		//临时数组
			for (int i = 0; i < list.size(); i++) {
				if(i > 0)
					str += ",";
				str += list.get(i).getId();
			}		
			arr = str.split(",");
		}
		else {
			arr = new String[] {category};
		}
		
		//将查询到的list集合赋值给page
		page.setList(dao.sel_style(map, arr, style));	
		
		//总条数
		long count = dao.sel_pageStyle(arr, style);
		
		//总页数
		page.setTotal(count%pageSize==0 ? count/pageSize : count/pageSize+1);
		
		//将总页数，第几页，每页显示多少条返回
		return page;
	}

}
