/**
 * 
 */
package org.java.service;

import java.util.List;
import java.util.Map;

import org.java.bean.Decorate;
import org.java.bean.Page;

/**  
* @ClassName: DecorateService  
* @Description: 装饰品业务处理层 
* @author 邱高强
* @date 2020年4月8日  
* @time 下午3:27:47   
*/
public interface DecorateService {

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
	public int update_number(String id, String number);
	
	/**  
	* @Title: sel_one  
	* @Description: 通过装饰品id查找此装饰品所有信息
	* @param id
	* @return Decorate
	*/
	public Decorate sel_one(String id);
	
	
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
	* @return Page
	*/
	public Page sel_all(int pageSize, int pageNumber);
			
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
	* @param pageSize
	* @param pageNumber
	* @param category
	* @return Page
	*/
	public Page sel_category(int pageSize, int pageNumber,String category);
	
	/**  
	* @Title: sel_style  
	* @Description: 分页查询所有已上架的装饰品，且装饰品材料为category，且装饰风格为style
	* @param pageSize
	* @param pageNumber
	* @param category
	* @param style
	* @return Page
	*/
	public Page sel_style(int pageSize, int pageNumber,String category,String style);
	
}
