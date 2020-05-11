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
import java.util.Map;

import org.java.bean.User;
import org.java.dao.UserDao;
import org.java.util.MysqlUtil;

/**  
* @ClassName: UserDaoImpl  
* @Description: 登录用户持久层的实现  
* @author 邱高强  
* @date 2020年3月1日    
*/
public class UserDaoImpl implements UserDao {

	
	/**  
	* @Description loginType:{ 登录用户 }
	*/ 
	public static User loginUser = null;

	
	/**
	 *	通过用户账号、密码查找用户，登录可用，可获取用户大部分信息
	 */
	@Override
	public int sel_user(String account, String password) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT					" + 
					"	u.id,				" + 
					"	u.name,				" + 
					"	u.account,			" + 
					"	u.password,			" + 
					"	u.sex,				" + 
					"	u.mail,				" + 
					"	u.photo,			" + 
					"	m.total,			" + 
					"	g.name,				" + 
					"	u.create_time,		" + 
					"	r.name,				" + 
					"	u.user_type			" + 
					"FROM					" + 
					"	USER u				" + 
					"	LEFT JOIN member m ON m.account = u.account		" + 
					"	LEFT JOIN grade g ON g.id = m.grade_id			" + 
					"	LEFT JOIN role r ON r.role = u.user_type 		" + 
					"WHERE					" + 
					"	u.account = ?		" + 
					"	AND u.password = ?	" ;

		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rows = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				
				loginUser = new User();
				
				loginUser.setId(rs.getInt("u.id"));
				loginUser.setName(rs.getString("u.name"));
				loginUser.setAccount(rs.getString("u.account"));
				loginUser.setPassword(rs.getString("u.password"));
				loginUser.setSex(rs.getString("u.sex"));
				loginUser.setMail(rs.getString("u.mail"));
				loginUser.setPhoto(rs.getString("u.photo").trim());
				loginUser.setTotal(rs.getString("m.total"));
				loginUser.setMember(rs.getString("g.name"));
				loginUser.setCreateTime(rs.getTimestamp("u.create_time"));
				loginUser.setRole(rs.getString("r.name"));
				loginUser.setUserType(rs.getInt("u.user_type"));
				
				rows = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return rows;	

	}
	

	/**
	 *	分页查询所有用户列表
	 */
	@Override
	public List<User> sel_all(Map<String, Object> page) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT					" + 
					"	u.id,				" + 
					"	u.name,				" + 
					"	u.account,			" + 
					"	u.password,			" + 
					"	u.sex,				" + 
					"	u.mail,				" + 
					"	u.photo,			" + 
					"	m.total,			" + 
					"	g.name,				" + 
					"	u.create_time,		" + 
					"	r.name,				" + 
					"	u.user_type			" + 
					"FROM					" + 
					"	USER u				" + 
					"	LEFT JOIN member m ON m.account = u.account		" + 
					"	LEFT JOIN grade g ON g.id = m.grade_id			" + 
					"	LEFT JOIN role r ON r.role = u.user_type 		" + 
					"order by				" + 
					"	u.create_time desc	" +
					"	LIMIT ?, ?			" ;

		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<User> list = new ArrayList<User>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, page.get("pageStart"));
			pstmt.setObject(2, page.get("pageSize"));
			
			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				User user = new User();
				
				user.setId(rs.getInt("u.id"));
				user.setName(rs.getString("u.name"));
				user.setAccount(rs.getString("u.account"));
				user.setPassword(rs.getString("u.password"));
				user.setSex(rs.getString("u.sex"));
				user.setMail(rs.getString("u.mail"));
				user.setPhoto(rs.getString("u.photo").trim());
				user.setTotal(rs.getString("m.total"));
				user.setMember(rs.getString("g.name"));
				user.setCreateTime(rs.getTimestamp("u.create_time"));
				user.setRole(rs.getString("r.name"));
				user.setUserType(rs.getInt("u.user_type"));

				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}

	/**
	 *	通过账户查询用户信息
	 */
	@Override
	public User sel_one(String account) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT					" + 
				"	u.id,				" + 
				"	u.name,				" + 
				"	u.account,			" + 
				"	u.password,			" + 
				"	u.sex,				" + 
				"	u.mail,				" + 
				"	u.photo,			" + 
				"	m.total,			" + 
				"	g.name,				" + 
				"	u.create_time,		" + 
				"	r.name,				" + 
				"	u.user_type			" + 
				"FROM					" + 
				"	USER u				" + 
				"	LEFT JOIN member m ON m.account = u.account		" + 
				"	LEFT JOIN grade g ON g.id = m.grade_id			" + 
				"	LEFT JOIN role r ON r.role = u.user_type 		" + 
				"WHERE					" + 
				"	u.account = ?		" ;

		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				
				user = new User();
				
				user.setId(rs.getInt("u.id"));
				user.setName(rs.getString("u.name"));
				user.setAccount(rs.getString("u.account"));
				user.setPassword(rs.getString("u.password"));
				user.setSex(rs.getString("u.sex"));
				user.setMail(rs.getString("u.mail"));
				user.setPhoto(rs.getString("u.photo").trim());
				user.setTotal(rs.getString("m.total"));
				user.setMember(rs.getString("g.name"));
				user.setCreateTime(rs.getTimestamp("u.create_time"));
				user.setRole(rs.getString("r.name"));
				user.setUserType(rs.getInt("u.user_type"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return user;	
	}
	
	/**
	 *	统计已上架商品能分成多少页
	 */
	@Override
	public int sel_page() {
		// TODO Auto-generated method stub

		String sql = "select count(id) from user ";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0; //计算一共多少条符合条件的记录
		
		try {
			pstmt = conn.prepareStatement(sql);
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
	  *  往数据库新增用户，注册可用
	 */
	@Override
	public int add_user(User user) {
		// TODO Auto-generated method stub
		
		String sql = "insert into user(id,account,name,password,sex,mail,photo,create_time,user_type) "
					+ "values "
					+ "(default,?,?,?,?,?,?,Now(),'0')";
		
		Connection conn = MysqlUtil.getConnection();

	    PreparedStatement pstmt = null;
	    int rows = 0;
		try {
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, user.getAccount());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getSex());
			pstmt.setString(5, user.getMail());
			pstmt.setString(6, user.getPhoto());			
	
		    rows = pstmt.executeUpdate();	
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(null, pstmt, conn);  

		return rows;
	}

	/**
	  * 查询数据库中是否已存在此账号
	 */
	@Override
	public int sel_account(String newAccount) {
		// TODO Auto-generated method stub
		
		String sql = "select account from user where account = ?";

		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rows = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newAccount);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				
				rows = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return rows;	

	}
	
	/**
	  * 查询数据库中此账号是否有此邮箱
	 */
	@Override
	public String sel_mail(String newAccount) {
		// TODO Auto-generated method stub
		
		String sql = "select mail from user where account = ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String mail = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newAccount);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				
				mail = rs.getString("mail");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return mail;
	}

	/**
	  * 通过账号修改密码
	 */
	@Override
	public int update_password(String account, String password) {
		// TODO Auto-generated method stub
		
		String sql = "update user set password = ? where account = ? ";
		
		Connection conn = MysqlUtil.getConnection();

	    PreparedStatement pstmt = null;
	    int rows = 0;
		try {
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, password);
			pstmt.setString(2, account);
			
		    rows = pstmt.executeUpdate();	
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(null, pstmt, conn);  

		return rows;
		
	}

	/**
	 * 通过账号修改头像
	 */
	@Override
	public int update_photo(String account, String photo) {
		// TODO Auto-generated method stub
		
		String sql = "update user set photo = ? where account = ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rows = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, photo);
			pstmt.setString(2, account);
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return rows;
	}

	/**
	  * 通过账户修改用户信息
	 */
	@Override
	public int update_userInfo(String account, String username, String password, String mail) {
		// TODO Auto-generated method stub
		
		String sql = "update user set name = ?, password = ?, mail = ? where account = ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rows = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, mail);
			pstmt.setString(4, account);
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return rows;
	}



}
