package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.java.bean.Decorate;
import org.java.bean.Order;
import org.java.dao.OrderDao;
import org.java.util.MysqlUtil;

/**  
 * @ClassName: OrderDaoImpl  
 * @Description: 用户订单数据库连接层实现类  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午2:20:40    
 */ 
public class OrderDaoImpl implements OrderDao {

	/**
	 *	新增订单
	 */
	@Override
	public int add_order(Order order) {
		// TODO Auto-generated method stub
		String sql=" insert into orderform (id, order_number, account, decorate_id, number, need_total, discount, actually_total, "
				 + " name, tel, lng, lat, address, order_time )"
				 + " values"
				 + " (default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, Now() )";
		
		Connection conn = MysqlUtil.getConnection();
	    PreparedStatement pstmt = null;
	    int rows = 0;
		try {
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, order.getOrderNumber());
			pstmt.setString(2, order.getAccount());
			pstmt.setString(3, order.getDecorateId());
			pstmt.setString(4, order.getNumber());
			pstmt.setString(5, order.getNeedTotal());
			pstmt.setString(6, order.getDiscount());
			pstmt.setString(7, order.getActuallyTotal());
			pstmt.setString(8, order.getName());
			pstmt.setString(9, order.getTel());
			pstmt.setString(10, order.getLng());
			pstmt.setString(11, order.getLat());
			pstmt.setString(12, order.getAddress());
			
		    rows = pstmt.executeUpdate();	
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		MysqlUtil.closeAll(null, pstmt, conn);  
	
		return rows;
	}

	/**
	 *	通过用户账号分页查询该用户所有订单
	 */
	@Override
	public List<Order> sel_account(Map<String, Object> page, String account) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT					" + 
					"	o.id,				" + 
					"	o.order_number,		" + 
					"	o.account,			" + 
					"	o.decorate_id,		" + 
					"	d.photo,			" + 
					"	d.name,				" + 
					"	d.flag,				" + 
					"	o.number,			" + 
					"	o.need_total,		" + 
					"	o.discount,			" + 
					"	o.actually_total,	" + 
					"	o.name,				" + 
					"	o.tel,				" + 
					"	o.address,			" + 
					"	o.order_time 		" + 
					"FROM					" + 
					"	orderform o			" + 
					"	LEFT JOIN decorate d ON d.id = o.decorate_id 	" + 
					"WHERE					" + 
					"	o.account = ?	 	" + 
					"ORDER BY				" + 
					"	o.order_time DESC 	" + 
					"	LIMIT ?, ?			" ;
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList<Order>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			System.out.println("[pageStart:"+page.get("pageStart")+"] [pageSize:"+page.get("pageSize")+"]");
			pstmt.setObject(2, page.get("pageStart"));
			pstmt.setObject(3, page.get("pageSize"));

			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Order order = new Order();

				order.setId(rs.getInt("o.id"));
				order.setOrderNumber(rs.getString("o.order_number"));
				order.setAccount(rs.getString("o.account"));
				order.setDecorateId(rs.getString("o.decorate_id"));
				order.setPhoto(rs.getString("d.photo"));
				order.setDecorateName(rs.getString("d.name"));
				order.setFlag(rs.getString("d.flag"));
				order.setNumber(rs.getString("o.number"));
				order.setNeedTotal(rs.getString("o.need_total"));
				order.setDiscount(rs.getString("o.discount"));
				order.setActuallyTotal(rs.getString("o.actually_total"));
				order.setName(rs.getString("o.name"));
				order.setTel(rs.getString("o.tel"));
				order.setAddress(rs.getString("o.address"));
				order.setOrderTime(rs.getTimestamp("o.order_time"));
				
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}

	/**
	 *	统计该用户的所有订单能分成多少条
	 */
	@Override
	public int sel_pageAccount(String account) {
		// TODO Auto-generated method stub
		
		String sql = "select count(id) from orderform where account = ?";
		
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
	 *	通过用户账号分页查询该用户在某个下单时间之后的所有订单
	 */
	@Override
	public List<Order> sel_orderTime(Map<String, Object> page, String account, String orderTime) {
		// TODO Auto-generated method stub
		
		String sql ="SELECT						" + 
					"	o.id,					" + 
					"	o.order_number,			" + 
					"	o.account,				" + 
					"	o.decorate_id,			" + 
					"	d.photo,				" + 
					"	d.name,					" + 
					"	d.flag,					" + 
					"	o.number,				" + 
					"	o.need_total,			" + 
					"	o.discount,				" + 
					"	o.actually_total,		" + 
					"	o.name,					" + 
					"	o.tel,					" + 
					"	o.address,				" + 
					"	o.order_time 			" + 
					"FROM						" + 
					"	ORDERform o				" + 
					"	LEFT JOIN decorate d ON d.id = o.decorate_id 	" + 
					"WHERE						" + 
					"	o.account = ?	 		" + 
					"	AND o.order_time >= ?	" + 
					"ORDER BY					" + 
					"	o.order_time DESC 		" + 
					"	LIMIT ?, ?				" ;
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList<Order>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setString(2, orderTime);
			pstmt.setObject(3, page.get("pageStart"));
			pstmt.setObject(4, page.get("pageSize"));

			rs = pstmt.executeQuery();
			while(rs.next()) {	
				
				Order order = new Order();

				order.setId(rs.getInt("o.id"));
				order.setOrderNumber(rs.getString("o.order_number"));
				order.setAccount(rs.getString("o.account"));
				order.setDecorateId(rs.getString("o.decorate_id"));
				order.setPhoto(rs.getString("d.photo"));
				order.setDecorateName(rs.getString("d.name"));
				order.setFlag(rs.getString("d.flag"));
				order.setNumber(rs.getString("o.number"));
				order.setNeedTotal(rs.getString("o.need_total"));
				order.setDiscount(rs.getString("o.discount"));
				order.setActuallyTotal(rs.getString("o.actually_total"));
				order.setName(rs.getString("o.name"));
				order.setTel(rs.getString("o.tel"));
				order.setAddress(rs.getString("o.address"));
				order.setOrderTime(rs.getTimestamp("o.order_time"));
				
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MysqlUtil.closeAll(rs, pstmt, conn);
		
		return list;
	}

	/**
	 *	统计该用户的所有订单中，下单时间在此之后的记录有多少条
	 */
	@Override
	public int sel_pageOrderTime(String account, String orderTime) {
		// TODO Auto-generated method stub
		
		String sql = "select count(id) from orderform where account = ? and order_time >= ?";
		
		Connection conn = MysqlUtil.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0; //计算一共多少条符合条件的记录
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setString(2, orderTime);
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
