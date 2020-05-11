/**
 * 
 */
package org.java.dao;

import java.util.List;
import java.util.Map;

import org.java.bean.Decorate;

/**  
* @ClassName: DecorateDao  
* @Description: 装饰品数据库连接层  
* @author 邱高强
* @date 2020年4月8日  
* @time 上午11:25:03   
*/
public interface DecorateDao {

	
	/**  
	* @Title: add_decorate  
	* @Description: 新增装饰
	* @param decorate
	* @return int
	*/
	public int add_decorate(Decorate decorate);
	
	/**  
	* @Title: delete_decorate  
	* @Description: 通过id下架指定装饰品
	* @param id
	* @return int
	*/
	public int delete_decorate(String[] id);
	
	/**  
	* @Title: update_one  
	* @Description: 修改装饰品信息
	* @param decorate
	* @return int
	*/
	public int update_one(Decorate decorate);
	
	/**  
	 * @Title: update_number  
	 * @Description: 商品被购买时，相应的库存减少
	 * @param id
	 * @param number
	 * @return int
	 */
	public int update_number(int id, String number);
	
	/**  
	* @Title: sel_one  
	* @Description: 通过装饰品id查找此装饰品所有信息
	* @param id
	* @return Decorate
	*/
	public Decorate sel_one(int id);
	
	
	/**  
	* @Title: sel_three  
	* @Description: 查询末尾3条已上架的装饰品
	* @return List<Decorate>
	*/
	public List<Decorate> sel_three();
	
	/**  
	* @Title: sel_all  
	* @Description: 分页查询所有已上架的装饰品
	* @param page
	* @return List<Decorate>
	*/
	public List<Decorate> sel_all(Map<String,Object> page);
		
	/**  
	* @Title: sel_page  
	* @Description: 统计已上架商品能分成多少页
	* @return int
	*/
	public int sel_page();
			
	/**  
	* @Title: sel_category  
	* @Description: 查询末尾6条已上架的装饰品，且装饰品材料为category
	* @param category
	* @return List<Decorate>
	*/
	public List<Decorate> sel_category(String category);
	
	/**  
	* @Title: sel_category  
	* @Description: 分页查询所有已上架的装饰品，且装饰品材料为category
	* @param page
	* @param category
	* @return List<Decorate>
	*/
	public List<Decorate> sel_category(Map<String,Object> page,String category);
		
	/**  
	* @Title: sel_pageCategory  
	* @Description: 统计已上架商品能分成多少页,且装饰品材料为category
	* @param category
	* @return int
	*/
	public int sel_pageCategory(String category);
	
	/**  
	* @Title: sel_style  
	* @Description: 分页查询所有已上架的装饰品，且装饰品材料为category，且装饰风格为style
	* @param page
	* @param category
	* @param style
	* @return List<Decorate>
	*/
	public List<Decorate> sel_style(Map<String,Object> page,String[] category,String style);
	
	/**  
	* @Title: sel_pageStyle  
	* @Description: 统计已上架商品能分成多少页,且装饰品材料为category,且装饰风格为style
	* @param category
	* @param style
	* @return int
	*/
	public int sel_pageStyle(String[] category,String style);
	
}
