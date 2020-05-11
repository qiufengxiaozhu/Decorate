package org.java.service;

import java.util.List;

import org.java.bean.Grade;

/**  
 * @ClassName: GradeService  
 * @Description: 会员等级表业务层  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午3:40:30    
 */ 
public interface GradeService {

	/**  
	 * @Title: sel_all  
	 * @Description: 查询所有会员信息
	 * @return List<Grade>
	 */
	public List<Grade> sel_all();
}
