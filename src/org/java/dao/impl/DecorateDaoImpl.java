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

import org.java.bean.Decorate;
import org.java.dao.DecorateDao;
import org.java.util.MysqlUtil;

/**  
* @ClassName: DecorateDaoImpl  
* @Description: 装饰品数据库连接层实现类  
* @author 邱高强
* @date 2020年4月8日  
* @time 下午12:45:08   
*/
public class DecorateDaoImpl implements DecorateDao {

	/**
	 *	新增装饰
	 */
	@Override
	public int add_decorate(Decorate decorate) {
		// TODO Auto-generated method stub
		
		String sql=" insert into decorate (id, photo, name, descript, category_id, style, price, number, flag)"
				 + " values"
				 + " (default, ?, ?, ?, ?, ?, ?, ?, '1')";
		
		Connection conn = MysqlUtil.getConnection();
	    PreparedStatement pstmt = null;
	    int rows = 0;
		try {
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, decorate.getPhoto());
			pstmt.setString(2, decorate.getName());
			pstmt.setString(3, decorate.getDescript());
			pstmt.setString(4, decorate.getCategoryId());
			pstmt.setString(5, decorate.getStyle());			
			pstmt.setDouble(6, decorate.getPrice());			
			pstmt.setString(7, decorate.getNumber());			
			
		    rows = pstmt.executeUpdate();	
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		MysqlUtil.closeAll(null, pstmt, conn);  
	
		return rows;
		
	}

	/**
	 *	通过id下架指定装饰品
	 */
	@Override
	public int delete_decorate(String[] id) {
		// TODO Auto-generated method stub
		
		String query = "update decorate set flag = 0 where id in (";
		
		StringBuilder sql = new StringBuilder(query);
		
		for (int i = 0; i < id.length; i++) {
			if (i > 0) {
				sql.append(",");
			}
			sql.append("?");
		}
		sql.append(")");
		
		Connection conn = MysqlUtil.getConnection();

	    PreparedStatement pstmt = null;
	    int rows = 0;
		try {
			
			pstmt = conn.prepareStatement(sql.toString());	
			for (int i = 0; i < id.length; i++) {
				pstmt.setString(i+1, id[i]);
			}
			
		    rows = pstmt.executeUpdate();	
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(null, pstmt, conn);  

		return rows;
		
	}

	/**
	 *  修改装饰品信息
	 */
	@Override
	public int update_one(Decorate decorate) {
		// TODO Auto-generated method stub
		
		String sql = "update decorate set photo=?, name=?, descript=?, category_id=?, style=?, price=?, number=? where id=?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rows = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, decorate.getPhoto());
			pstmt.setString(2, decorate.getName());
			pstmt.setString(3,decorate.getDescript());
			pstmt.setString(4, decorate.getCategoryId());
			pstmt.setString(5, decorate.getStyle());			
			pstmt.setDouble(6, decorate.getPrice());			
			pstmt.setString(7, decorate.getNumber());			
			pstmt.setInt(8, decorate.getId());	
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return rows;
	}
	
	/**
	 *	商品被购买时，相应的库存减少
	 */
	@Override
	public int update_number(int id, String number) {
		// TODO Auto-generated method stub
		
		String sql = "update decorate set number = ? where id = ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rows = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, number);
			pstmt.setInt(2, id);
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return rows;
	}
	
	/**
	 *	查询末尾3条已上架的装饰品
	 */
	@Override
	public List<Decorate> sel_three() {
		// TODO Auto-generated method stub
		
		String sql = "select id,photo,name,descript,price from decorate order by id desc limit 3";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Decorate> list = new ArrayList<Decorate>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Decorate decorate = new Decorate();
				
				decorate.setId(rs.getInt("id"));
				decorate.setPhoto(rs.getString("photo"));
				decorate.setName(rs.getString("name"));
				decorate.setDescript(rs.getString("descript"));
				decorate.setPrice(rs.getDouble("price"));
				
				list.add(decorate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}

	/**
	 *	通过装饰品id查找此装饰品所有信息
	 */
	@Override
	public Decorate sel_one(int id) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT            " + 
					"	d.id,          " + 
					"	d.photo,       " + 
					"	d.name,        " + 
					"	d.descript,    " + 
					"	d.category_id, " + 
					"	c.category,    " + 
					"	d.style,       " + 
					"	d.price,       " + 
					"	d.number       " + 
					"FROM              " + 
					"	decorate d     " + 
					"	LEFT JOIN category c ON d.category_id = c.id  " + 
					"WHERE             " + 
					"	d.id = ?       " + 
					"	AND d.flag = 1 " + 
					"ORDER BY          " + 
					"	d.id DESC";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Decorate decorate = new Decorate();
		
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				
				decorate.setId(rs.getInt("d.id"));
				decorate.setPhoto(rs.getString("d.photo"));
				decorate.setName(rs.getString("d.name"));
				decorate.setDescript(rs.getString("d.descript"));
				decorate.setCategoryId(rs.getString("d.category_id"));
				decorate.setCategory(rs.getString("c.category"));
				decorate.setStyle(rs.getString("d.style"));
				decorate.setPrice(rs.getDouble("d.price"));
				decorate.setNumber(rs.getString("d.number"));			
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return decorate;
	}

	/**
	 *	分页查询所有已上架的装饰品
	 */
	@Override
	public List<Decorate> sel_all(Map<String, Object> page) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT            " + 
					"	d.id,          " + 
					"	d.photo,       " + 
					"	d.name,        " + 
					"	d.descript,    " + 
					"	d.category_id, " + 
					"	c.category,    " + 
					"	d.style,       " + 
					"	d.price,       " + 
					"	d.number       " + 
					"FROM              " + 
					"	decorate d     " + 
					"	LEFT JOIN category c ON d.category_id = c.id  " + 
					"WHERE             " + 
					"	d.flag = 1     " + 
					"ORDER BY          " + 
					"	d.id DESC      " +
					"	LIMIT ?, ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Decorate> list = new ArrayList<Decorate>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, page.get("pageStart"));
			pstmt.setObject(2, page.get("pageSize"));

			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Decorate decorate = new Decorate();
				
				decorate.setId(rs.getInt("d.id"));
				decorate.setPhoto(rs.getString("d.photo"));
				decorate.setName(rs.getString("d.name"));
				decorate.setDescript(rs.getString("d.descript"));
				decorate.setCategoryId(rs.getString("d.category_id"));
				decorate.setCategory(rs.getString("c.category"));
				decorate.setStyle(rs.getString("d.style"));
				decorate.setPrice(rs.getDouble("d.price"));
				decorate.setNumber(rs.getString("d.number"));
				
				list.add(decorate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}

	/**
	 *	统计已上架商品能分成多少页
	 */
	@Override
	public int sel_page() {
		// TODO Auto-generated method stub
		
		String sql = "select count(id) from decorate where flag =1";
		
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
	 *	查询末尾6条已上架的装饰品，且装饰品材料为category
	 */
	@Override
	public List<Decorate> sel_category(String category) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT 				" + 
					"	d.id, 				" + 
					"	d.photo, 			" + 
					"	d.NAME, 			" + 
					"	d.descript, 		" + 
					"	d.category_id,		" + 
					"	c.category,			" + 
					"	d.style,			" + 
					"	d.price,			" + 
					"	d.number 			" + 
					"FROM					" + 
					"	decorate d			" + 
					"	LEFT JOIN category c ON d.category_id = c.id 	" + 
					"WHERE					" + 
					"	d.category_id = ? 	" + 
					"	AND d.flag = 1 		" + 
					"ORDER BY				" + 
					"	d.id DESC 			" + 
					"	LIMIT 6				";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Decorate> list = new ArrayList<Decorate>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, category);

			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Decorate decorate = new Decorate();
				
				decorate.setId(rs.getInt("d.id"));
				decorate.setPhoto(rs.getString("d.photo"));
				decorate.setName(rs.getString("d.name"));
				decorate.setDescript(rs.getString("d.descript"));
				decorate.setCategoryId(rs.getString("d.category_id"));
				decorate.setCategory(rs.getString("c.category"));
				decorate.setStyle(rs.getString("d.style"));
				decorate.setPrice(rs.getDouble("d.price"));
				decorate.setNumber(rs.getString("d.number"));
				
				list.add(decorate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}

	/**
	 *	分页查询所有已上架的装饰品，且装饰品材料为category
	 */
	@Override
	public List<Decorate> sel_category(Map<String, Object> page, String category) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT            			" + 
					"	d.id,          			" + 
					"	d.photo,       			" + 
					"	d.name,        			" + 
					"	d.descript,    			" + 
					"	d.category_id, 			" + 
					"	c.category,    			" + 
					"	d.style,       			" + 
					"	d.price,       			" + 
					"	d.number       			" + 
					"FROM              			" + 
					"	decorate d     			" + 
					"	LEFT JOIN category c ON d.category_id = c.id  " + 
					"WHERE             			" + 
					"	d.flag = 1     			" + 
					"	AND d.category_id = ?   " + 
					"ORDER BY          			" + 
					"	d.id DESC      			" +
					"	LIMIT ?, ?				" ;
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Decorate> list = new ArrayList<Decorate>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setObject(2, page.get("pageStart"));
			pstmt.setObject(3, page.get("pageSize"));

			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Decorate decorate = new Decorate();
				
				decorate.setId(rs.getInt("d.id"));
				decorate.setPhoto(rs.getString("d.photo"));
				decorate.setName(rs.getString("d.name"));
				decorate.setDescript(rs.getString("d.descript"));
				decorate.setCategoryId(rs.getString("d.category_id"));
				decorate.setCategory(rs.getString("c.category"));
				decorate.setStyle(rs.getString("d.style"));
				decorate.setPrice(rs.getDouble("d.price"));
				decorate.setNumber(rs.getString("d.number"));
				
				list.add(decorate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;		
		
	}

	/**
	 *	统计已上架商品能分成多少页,且装饰品材料为category
	 */
	@Override
	public int sel_pageCategory(String category) {
		// TODO Auto-generated method stub
		
		String sql = "select count(id) from decorate where flag = 1 and category_id = ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0; //计算一共多少条符合条件的记录
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
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
	 *	分页查询所有已上架的装饰品，且装饰品材料为category，且装饰风格为style
	 */
	@Override
	public List<Decorate> sel_style(Map<String, Object> page, String[] category, String style) {
		// TODO Auto-generated method stub
		
		String query ="SELECT            			" + 
					"	d.id,          			" + 
					"	d.photo,       			" + 
					"	d.name,        			" + 
					"	d.descript,    			" + 
					"	d.category_id, 			" + 
					"	c.category,    			" + 
					"	d.style,       			" + 
					"	d.price,       			" + 
					"	d.number       			" + 
					"FROM              			" + 
					"	decorate d     			" + 
					"	LEFT JOIN category c ON d.category_id = c.id  " + 
					"WHERE             			" + 
					"	d.flag = 1     			" + 					
					"	AND d.style = ?   		" + 
					"	AND d.category_id in (  " ; 		
		
		StringBuilder sql = new StringBuilder(query);
		
		for (int i = 0; i < category.length; i++) {
			if (i > 0) {
				sql.append(",");
			}
			sql.append("?");
		}
		sql.append(") ORDER BY d.id DESC LIMIT ?, ? ");
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Decorate> list = new ArrayList<Decorate>();
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, style);
			for (int i = 1; i <= category.length; i++) {
				pstmt.setString(i+1, category[i-1]);				 
			}
			pstmt.setObject(2+category.length, page.get("pageStart"));
			pstmt.setObject(3+category.length, page.get("pageSize"));

			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Decorate decorate = new Decorate();
				
				decorate.setId(rs.getInt("d.id"));
				decorate.setPhoto(rs.getString("d.photo"));
				decorate.setName(rs.getString("d.name"));
				decorate.setDescript(rs.getString("d.descript"));
				decorate.setCategoryId(rs.getString("d.category_id"));
				decorate.setCategory(rs.getString("c.category"));
				decorate.setStyle(rs.getString("d.style"));
				decorate.setPrice(rs.getDouble("d.price"));
				decorate.setNumber(rs.getString("d.number"));
				
				list.add(decorate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;		
	}

	/**
	 *	统计已上架商品能分成多少页,且装饰品材料为category,且装饰风格为style
	 */
	@Override
	public int sel_pageStyle(String[] category, String style) {
		// TODO Auto-generated method stub

		String query = "select count(id) from decorate where flag = 1 and style = ? and category_id in (";
		
		StringBuilder sql = new StringBuilder(query);
		
		for (int i = 0; i < category.length; i++) {
			if (i > 0) {
				sql.append(",");
			}
			sql.append("?");
		}
		sql.append(")");
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0; //计算一共多少条符合条件的记录
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, style);
			for (int i = 1; i <= category.length; i++) {
				pstmt.setString(i+1, category[i-1]);
			}
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
