package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.java.bean.Car;
import org.java.bean.Decorate;
import org.java.dao.CarDao;
import org.java.util.MysqlUtil;

/**  
 * @ClassName: CarDaoImpl  
 * @Description: 购物车数据库连接层实现类  
 * @author 邱高强 
 * @date 2020年4月13日 
 * @date 上午9:54:59    
 */ 
public class CarDaoImpl implements CarDao {

	/**
	  *  商品加入购物车
	 */
	@Override
	public int add_car(Car car) {
		// TODO Auto-generated method stub
		
		String sql  = "insert into car (id, account, decorate_id)"
					+ "values"
					+ "(default, ?, ?)";
		
		Connection conn = MysqlUtil.getConnection();
		
	    PreparedStatement pstmt = null;
	    int rows = 0;
		try {
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, car.getAccount());
			pstmt.setString(2, car.getDecorateId());				
	
		    rows = pstmt.executeUpdate();	
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		MysqlUtil.closeAll(null, pstmt, conn);  
	
		return rows;
	}

	/**
	 *	根据id将商品移出购物车
	 */
	@Override
	public int del_car(int id) {
		// TODO Auto-generated method stub
		
		String sql = "delete from car where id = ?";
		
		Connection conn = MysqlUtil.getConnection();
		
	    PreparedStatement pstmt = null;
	    int rows = 0;
		try {
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, id);				
	
		    rows = pstmt.executeUpdate();	
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		MysqlUtil.closeAll(null, pstmt, conn);  
	
		return rows;
	}

	/**
	 *	通过用户账号分页查询该用户所有购物车列表
	 */
	@Override
	public List<Car> sel_all(Map<String, Object> page, String account) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT            " + 
					"	c.id,          " + 
					"	c.account,     " + 
					"	c.decorate_id,  " + 
					"	d.photo,       " + 
					"	d.name,        " + 
					"	d.price,        " + 
					"	d.flag        " + 
					"FROM              " + 
					"	car c          " + 
					"	LEFT JOIN decorate d ON d.id = c.decorate_id  " + 
					"WHERE             " + 
					"	c.account = ?  " + 
					"ORDER BY          " + 
					"	c.id DESC      " +
					"	LIMIT ?, ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Car> list = new ArrayList<Car>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, account);
			pstmt.setObject(2, page.get("pageStart"));
			pstmt.setObject(3, page.get("pageSize"));

			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Car car = new Car();
				
				car.setId(rs.getInt("c.id"));
				car.setAccount(rs.getString("c.account"));
				car.setDecorateId(rs.getString("c.decorate_id"));
				car.setPhoto(rs.getString("d.photo"));
				car.setName(rs.getString("d.name"));
				car.setPrice(rs.getDouble("d.price"));
				car.setFlag(rs.getString("d.flag"));
				
				list.add(car);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}
	
	/**
	 *	统计该用户收藏的商品能分成多少页
	 */
	@Override
	public int sel_page(String account) {
		// TODO Auto-generated method stub
		
		String sql = "select count(id) from car where account = ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0; //计算一共多少条符合条件的记录
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			
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
	 *	通过账号及商品id判断此用户是否重复将此商品加入购物车
	 */
	@Override
	public int sel_one(String decorateId, String account) {
		// TODO Auto-generated method stub
		
		String sql = "select id from car where account = ? and decorate_id = ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rows = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setString(2, decorateId);
			
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

}
