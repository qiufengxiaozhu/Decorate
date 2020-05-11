/**
 * 
 */
package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.java.bean.Category;
import org.java.bean.Decorate;
import org.java.dao.CategoryDao;
import org.java.util.MysqlUtil;

/**  
* @ClassName: CategoryDaoImpl  
* @Description: 装饰品材料分类数据库连接层实现类  
* @author 邱高强
* @date 2020年4月8日  
* @time 下午5:51:02   
*/
public class CategoryDaoImpl implements CategoryDao {

	/**
	 *	查询所有材料分类
	 */
	@Override
	public List<Category> sel_all() {
		// TODO Auto-generated method stub
		
		String sql = "select id,category,descript from category";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Category> list = new ArrayList<Category>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Category category = new Category();
				
				category.setId(rs.getInt("id"));
				category.setCategory(rs.getString("category"));
				category.setDescript(rs.getString("descript"));
				
				list.add(category);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
		
	}

}
