package org.java.dao;

import org.java.bean.Member;

/**  
 * @ClassName: MemberDao  
 * @Description: 会员表数据库连接层  
 * @author 邱高强 
 * @date 2020年4月15日 
 * @date 下午5:42:00    
 */ 
public interface MemberDao {

	/**  
	 * @Title: add_member  
	 * @Description: 注册会员
	 * @param member
	 * @return int
	 */
	public int add_member(Member member);
	
	/**  
	 * @Title: sel_one  
	 * @Description: 通过用户账号获取会员信息
	 * @param account
	 * @return Member
	 */
	public Member sel_one(String account);
	
	/**  
	 * @Title: update_member  
	 * @Description: 修改会员信息
	 * @param member
	 * @return int
	 */
	public int update_member(Member member);
}
