package org.java.service.impl;

import org.java.bean.Member;
import org.java.dao.MemberDao;
import org.java.dao.impl.MemberDaoImpl;
import org.java.service.MemberService;

/**  
 * @ClassName: MemberServiceImpl  
 * @Description: 会员信息业务层实现类  
 * @author 邱高强 
 * @date 2020年4月15日 
 * @date 下午5:59:50    
 */ 
public class MemberServiceImpl implements MemberService {

	private MemberDao dao = new MemberDaoImpl();
	
	/**
	 *	注册会员
	 */
	@Override
	public int add_member(Member member) {
		// TODO Auto-generated method stub
		
		int rows = dao.add_member(member);
		
		return rows;
	}

	/**
	 *	通过用户账号获取会员信息
	 */
	@Override
	public Member sel_one(String account) {
		// TODO Auto-generated method stub
		
		Member member = dao.sel_one(account);
		
		return member;
	}

	/**
	 *	修改会员信息
	 */
	@Override
	public int update_member(Member member) {
		// TODO Auto-generated method stub
		
		int rows = dao.update_member(member);
		
		return rows;
	}

}
