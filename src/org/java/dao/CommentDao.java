package org.java.dao;

import java.util.List;
import java.util.Map;

import org.java.bean.Comment;

/**  
 * @ClassName: CommentDao  
 * @Description: 用户评论数据库连接层  
 * @author 邱高强 
 * @date 2020年4月17日 
 * @date 上午10:01:40    
 */ 
public interface CommentDao {

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
	 * @param page
	 * @param account
	 * @return List<Comment>
	 */
	public List<Comment> sel_account(Map<String,Object> page, String account);
	
	/**  
	 * @Title: sel_pageAccount  
	 * @Description: 统计该用户的评论能分成多少页
	 * @param account
	 * @return int
	 */
	public int sel_pageAccount(String account);
	
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
	 * @param page
	 * @param decorateId
	 * @return List<Comment>
	 */
	public List<Comment> sel_all(Map<String,Object> page, String decorateId);
	
	/**  
	 * @Title: sel_pageDecorateId  
	 * @Description: 统计该商品的评论能分成多少页
	 * @param decorateId
	 * @return int
	 */
	public int sel_pageDecorateId(String decorateId);
}
