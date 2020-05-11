package org.java.service;

import java.util.List;

import org.java.bean.Comment;
import org.java.bean.Page;

/**  
 * @ClassName: CommentService  
 * @Description: 用户评论业务层  
 * @author 邱高强 
 * @date 2020年4月17日 
 * @date 上午10:14:10    
 */ 
public interface CommentService {

	/**  
	 * @Title: add_comment  
	 * @Description: 新增评论
	 * @param comment
	 * @return int
	 */
	public int add_comment(Comment comment);
	
	/**  
	 * @Title: sel_account  
	 * @Description: 分页查询该用户发布过的所有评论
	 * @param pageSize
	 * @param pageNumber
	 * @param account
	 * @return Page
	 */
	public Page sel_account(int pageSize, int pageNumber, String account);
	
	/**  
	 * @Title: sel_three  
	 * @Description: 查询该商品最近的三条评论
	 * @param decorateId
	 * @return List<Comment>
	 */
	public List<Comment> sel_three(String decorateId);
	
	/**  
	 * @Title: sel_all  
	 * @Description: 分页查询该商品的所有评论
	 * @param pageSize
	 * @param pageNumber
	 * @param decorateId
	 * @return Page
	 */
	public Page sel_all(int pageSize, int pageNumber, String decorateId);
}
