package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.java.bean.Grade;
import org.java.dao.GradeDao;
import org.java.util.MysqlUtil;

/**  
 * @ClassName: GradeDaoImpl  
 * @Description: 会员等级表数据库连接层  实现类  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午3:35:23    
 */ 
public class GradeDaoImpl implements GradeDao {

	/**
	 *	查询所有会员信息
	 */
	@Override
	public List<Grade> sel_all() {
		// TODO Auto-generated method stub
		
		String sql = "select id,name,discount,score from grade";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		
		List<Grade> list = new ArrayList<Grade>();
		
		try {
			pstmt = conn.prepareStatement(sql);			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Grade grade = new Grade();
				
				grade.setId(rs.getInt("id"));
				grade.setName(rs.getString("name"));
				grade.setDiscount(rs.getString("discount"));
				grade.setScore(rs.getString("score"));
				
				list.add(grade);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}

}
