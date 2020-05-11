/**
 * 
 */
package org.java.service;

import java.util.List;

import org.java.bean.Category;

/**  
* @ClassName: CategoryService  
* @Description: 装饰品材料分类业务处理层  
* @author 邱高强
* @date 2020年4月8日  
* @time 下午5:54:22   
*/
public interface CategoryService {

	/**  
	* @Title: sel_all  
	* @Description: 查询所有材料分类
	* @return List<Category>
	*/
	public List<Category> sel_all();
}
