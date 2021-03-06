/**
 * 
 */
package org.java.dao;

import java.util.List;
import java.util.Map;

import org.java.bean.User;

/**  
* @ClassName: UserDao  
* @Description: 登录用户持久层  
* @author 邱高强  
* @date 2020年3月1日    
*/  
public interface UserDao {
   
	/**  
	* @Title: sel_user  
	* @Description: 通过用户账号、密码查找用户，登录可用，可获取用户大部分信息
	* @param account
	* @param password
	* @return int
	*/
	public int sel_user(String account,String password);
	
	/**  
	 * @Title: sel_all  
	 * @Description: 分页查询所有用户列表
	 * @param page
	 * @return List<User>
	 */
	public List<User> sel_all(Map<String,Object> page);
	
	/**  
	 * @Title: sel_one  
	 * @Description: 通过账户查询用户信息
	 * @param account
	 * @return User
	 */
	public User sel_one(String account);
	
	/**  
	* @Title: sel_page  
	* @Description: 统计已上架商品能分成多少页
	* @return int
	*/
	public int sel_page();	
	
	/**  
	* @Title: add_user  
	* @Description: 往数据库新增用户，注册可用
	* @param user
	* @return int
	*/
	public int add_user(User user);
	
	
	/**  
	* @Title: sel_account  
	* @Description: 查询数据库中是否已存在此账号
	* @param newAccount
	* @return int
	*/
	public int sel_account(String newAccount);
	

	/**  
	* @Title: sel_mail  
	* @Description: 查询数据库中此账号是否有此邮箱
	* @param newAccount
	* @return String
	*/
	public String sel_mail(String newAccount);
	

	/**  
	* @Title: update_password  
	* @Description: 通过账号修改密码
	* @param account
	* @param password
	* @return int
	*/
	public int update_password(String account, String password);
	
	
	/**  
	* @Title: update_photo  
	* @Description: 通过账号修改头像
	* @param account
	* @param photo
	* @return int
	*/
	public int update_photo(String account, String photo);
	
	
	/**  
	* @Title: update_userInfo  
	* @Description: 通过账户修改用户信息
	* @param account
	* @param username
	* @param password
	* @param mail
	* @return int
	*/
	public int update_userInfo(String account, String username, String password, String mail);
}
