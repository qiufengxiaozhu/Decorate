/**
 * 
 */
package org.java.service.impl;

import java.util.List;

import org.java.bean.Category;
import org.java.dao.CategoryDao;
import org.java.dao.impl.CategoryDaoImpl;
import org.java.service.CategoryService;

/**  
* @ClassName: CategoryServiceImpl  
* @Description: 装饰品材料分类业务处理层实现类  
* @author 邱高强
* @date 2020年4月8日  
* @time 下午5:55:12   
*/
public class CategoryServiceImpl implements CategoryService {

	private CategoryDao dao = new CategoryDaoImpl();
	
	/**
	 *	查询所有材料分类
	 */
	@Override
	public List<Category> sel_all() {
		// TODO Auto-generated method stub
		
		List<Category> list = dao.sel_all();
		
		return list;
	}

}
