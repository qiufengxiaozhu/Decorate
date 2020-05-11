package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.java.bean.Decorate;
import org.java.bean.Member;
import org.java.dao.MemberDao;
import org.java.util.MysqlUtil;

/**  
 * @ClassName: MemberDaoImpl  
 * @Description: 会员表数据库连接层实现类  
 * @author 邱高强 
 * @date 2020年4月15日 
 * @date 下午5:45:04    
 */ 
public class MemberDaoImpl implements MemberDao {

	/**
	 *	注册会员
	 */
	@Override
	public int add_member(Member member) {
		// TODO Auto-generated method stub
		
		String sql=" insert into member (id, account, total, grade_id)"
				 + " values"
				 + " (default, ?, '0', '1')";
		
		Connection conn = MysqlUtil.getConnection();
	    PreparedStatement pstmt = null;
	    int rows = 0;
		try {
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, member.getAccount());			
			
		    rows = pstmt.executeUpdate();	
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		MysqlUtil.closeAll(null, pstmt, conn);  
	
		return rows;
	}

	/**
	 *	通过用户账号获取会员信息
	 */
	@Override
	public Member sel_one(String account) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT            " + 
					"	m.id,          " + 
					"	m.account,     " + 
					"	m.total,       " + 
					"	m.grade_id,    " + 
					"	g.name,        " + 
					"	g.discount,    " + 
					"	g.score        " + 
					"FROM              " + 
					"	member m       " + 
					"	LEFT JOIN grade g ON g.id = m.grade_id  " + 
					"WHERE             " + 
					"	m.account = ?  " ;
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Member member = new Member();
		
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, account);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				
				member.setId(rs.getInt("m.id"));
				member.setAccount(rs.getString("m.account"));
				member.setTotal(rs.getString("m.total"));
				member.setGradeId(rs.getString("m.grade_id"));
				member.setName(rs.getString("g.name"));
				member.setDiscount(rs.getString("g.discount"));
				member.setScore(rs.getString("g.score"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return member;
	}

	/**
	 *	修改会员信息
	 */
	@Override
	public int update_member(Member member) {
		// TODO Auto-generated method stub
		
		String sql = "update member set total = ?, grade_id = ? where account = ? ";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rows = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getTotal());
			pstmt.setString(2, member.getGradeId());
			pstmt.setString(3, member.getAccount());
	
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return rows;
	}

}
