package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.java.bean.Comment;
import org.java.bean.Decorate;
import org.java.dao.CommentDao;
import org.java.util.MysqlUtil;

/**  
 * @ClassName: CommentDaoImpl  
 * @Description: 用户评论数据库连接层实现类  
 * @author 邱高强 
 * @date 2020年4月17日 
 * @date 上午10:08:51    
 */ 
public class CommentDaoImpl implements CommentDao {

	/**
	 *	新增评论
	 */
	@Override
	public int add_comment(Comment comment) {
		// TODO Auto-generated method stub
		
		String sql = " insert into comment (id, account, decorate_id, comment, descript, quality, public_time)"
				   + " values"
				   + " (default, ?, ?, ?, ?, ?, Now())";
		
		Connection conn = MysqlUtil.getConnection();
	    PreparedStatement pstmt = null;
	    int rows = 0;
		try {
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, comment.getAccount());
			pstmt.setString(2, comment.getDecorateId());
			pstmt.setString(3, comment.getComment());
			pstmt.setString(4, comment.getDescript());
			pstmt.setString(5, comment.getQuality());
			
		    rows = pstmt.executeUpdate();	
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		MysqlUtil.closeAll(null, pstmt, conn);  
	
		return rows;
	}

	/**
	 *	分页查询该用户发布过的所有评论
	 */
	@Override
	public List<Comment> sel_account(Map<String, Object> page, String account) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT					" + 
					"	c.id,				" + 
					"	c.account,			" + 
					"	c.decorate_id,		" + 
					"	d.photo,			" + 
					"	d.name,				" + 
					"	d.flag,				" + 
					"	c.comment,			" + 
					"	c.descript,			" + 
					"	c.quality,			" + 
					"	c.public_time 		" + 
					"FROM					" + 
					"	COMMENT c			" + 
					"	LEFT JOIN decorate d ON d.id = c.decorate_id 	" + 
					"WHERE					" + 
					"	account = ?		 	" + 
					"ORDER BY				" + 
					"	c.public_time DESC	" +
					"	LIMIT ?, ?			" ;
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Comment> list = new ArrayList<Comment>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, account);
			pstmt.setObject(2, page.get("pageStart"));
			pstmt.setObject(3, page.get("pageSize"));

			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Comment comment = new Comment();
				
				comment.setId(rs.getInt("c.id"));
				comment.setAccount(rs.getString("c.account"));
				comment.setDecorateId(rs.getString("c.decorate_id"));
				comment.setPhoto(rs.getString("d.photo"));
				comment.setName(rs.getString("d.name"));
				comment.setFlag(rs.getString("d.flag"));
				comment.setComment(rs.getString("c.comment"));
				comment.setDescript(rs.getString("c.descript"));
				comment.setQuality(rs.getString("c.quality"));
				comment.setPublicTime(rs.getTimestamp("c.public_time"));
				
				list.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}
	
	/**
	 *	统计该用户的评论能分成多少页
	 */
	@Override
	public int sel_pageAccount(String account) {
		// TODO Auto-generated method stub

		String sql = "select count(id) from comment where account = ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0; //计算一共多少条符合条件的记录
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, account);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				
				total = rs.getInt(1);	//得到总条数					
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return total;
	}

	/**
	 *	查询该商品最近的三条评论
	 */
	@Override
	public List<Comment> sel_three(String decorateId) {
		// TODO Auto-generated method stub

		String sql ="SELECT					" + 
					"	c.id,				" + 
					"	c.account,			" + 
					"	c.decorate_id,		" + 
					"	c.comment,			" + 
					"	c.descript,			" + 
					"	c.quality,			" + 
					"	c.public_time 		" + 
					"FROM					" + 
					"	COMMENT c			" +  
					"WHERE					" + 
					"	c.decorate_id = ?	" + 
					"ORDER BY				" + 
					"	c.public_time DESC	" +
					"	LIMIT 3				" ;
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Comment> list = new ArrayList<Comment>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, decorateId);

			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Comment comment = new Comment();
				
				comment.setId(rs.getInt("c.id"));
				comment.setAccount(rs.getString("c.account"));
				comment.setDecorateId(rs.getString("c.decorate_id"));
				comment.setComment(rs.getString("c.comment"));
				comment.setDescript(rs.getString("c.descript"));
				comment.setQuality(rs.getString("c.quality"));
				comment.setPublicTime(rs.getTimestamp("c.public_time"));
				
				list.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}

	/**
	 *	分页查询该商品的所有评论
	 */
	@Override
	public List<Comment> sel_all(Map<String, Object> page, String decorateId) {
		// TODO Auto-generated method stub

		String sql ="SELECT					" + 
					"	id,					" + 
					"	account,			" + 
					"	decorate_id,		" + 
					"	comment,			" + 
					"	descript,			" + 
					"	quality,			" + 
					"	public_time 		" + 
					"FROM					" + 
					"	COMMENT 			" + 
					"WHERE					" + 
					"	decorate_id = ?		" + 
					"ORDER BY				" + 
					"	public_time DESC	" +
					"	LIMIT ?, ?			" ;
	
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Comment> list = new ArrayList<Comment>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, decorateId);
			pstmt.setObject(2, page.get("pageStart"));
			pstmt.setObject(3, page.get("pageSize"));
	
			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Comment comment = new Comment();
				
				comment.setId(rs.getInt("id"));
				comment.setAccount(rs.getString("account"));
				comment.setDecorateId(rs.getString("decorate_id"));
				comment.setComment(rs.getString("comment"));
				comment.setDescript(rs.getString("descript"));
				comment.setQuality(rs.getString("quality"));
				comment.setPublicTime(rs.getTimestamp("public_time"));
				
				list.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}

	/**
	 *	统计该商品的评论能分成多少页
	 */
	@Override
	public int sel_pageDecorateId(String decorateId) {
		// TODO Auto-generated method stub

		String sql = "select count(id) from comment where decorate_id = ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0; //计算一共多少条符合条件的记录
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, decorateId);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				
				total = rs.getInt(1);	//得到总条数					
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return total;
	}

}
