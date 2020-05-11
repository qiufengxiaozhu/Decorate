package org.java.dao;

import java.util.List;

import org.java.bean.Grade;

/**  
 * @ClassName: GradeDao  
 * @Description: 会员等级表数据库连接层  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午3:34:14    
 */ 
public interface GradeDao {

	/**  
	 * @Title: sel_all  
	 * @Description: 查询所有会员信息
	 * @return List<Grade>
	 */
	public List<Grade> sel_all();
}
