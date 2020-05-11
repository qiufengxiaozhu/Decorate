/**
 * 
 */
package org.java.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**  
* @ClassName: MysqlUtil  
* @Description: 数据库连接工具类  
* @author 邱高强  
* @date 2020年3月1日    
*/
public class MysqlUtil {

	public static final String DRIVER = "com.mysql.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/decorate?useUnicode=true&characterEncoding=UTF8";
	public static final String USER = "root";
	public static final String PASSWORD = "123456";
	
	
	/**  
	* @Title: getConnection  
	* @Description: 连接数据库
	* @return Connection
	*/
	public static Connection getConnection() {
		
		Connection conn = null;
		
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
		return conn;
	}
	
	/**  
	* @Title: closeAll  
	* @Description: 断开数据库连接
	* @param rs
	* @param pstmt
	* @param conn void
	*/
	public static void closeAll(ResultSet rs,PreparedStatement pstmt,Connection conn) {
		
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
}
