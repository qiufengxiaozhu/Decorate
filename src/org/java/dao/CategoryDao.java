/**
 * 
 */
package org.java.dao;

import java.util.List;

import org.java.bean.Category;

/**  
* @ClassName: CategoryDao  
* @Description: 装饰材料数据库连接层  
* @author 邱高强
* @date 2020年4月8日  
* @time 下午5:49:20   
*/
public interface CategoryDao {

	
	/**  
	* @Title: sel_all  
	* @Description: 查询所有材料分类
	* @return List<Category>
	*/
	public List<Category> sel_all();
}
