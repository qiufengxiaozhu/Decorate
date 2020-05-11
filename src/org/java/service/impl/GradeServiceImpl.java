package org.java.service.impl;

import java.util.List;

import org.java.bean.Grade;
import org.java.dao.GradeDao;
import org.java.dao.impl.GradeDaoImpl;
import org.java.service.GradeService;

/**  
 * @ClassName: GradeServiceImpl  
 * @Description: 会员等级表业务层实现类  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午3:41:06    
 */ 
public class GradeServiceImpl implements GradeService {

	private GradeDao dao = new GradeDaoImpl();
	
	/**
	 *	查询所有会员信息
	 */
	@Override
	public List<Grade> sel_all() {
		// TODO Auto-generated method stub
		
		List<Grade> list = dao.sel_all();
		
		return list;
	}

}
