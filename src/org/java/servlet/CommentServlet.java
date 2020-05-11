package org.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.java.bean.Comment;
import org.java.bean.Decorate;
import org.java.bean.Page;
import org.java.dao.impl.UserDaoImpl;
import org.java.service.CommentService;
import org.java.service.DecorateService;
import org.java.service.impl.CommentServiceImpl;
import org.java.service.impl.DecorateServiceImpl;

/**  
 * @ClassName: CommentServlet  
 * @Description: 用户评论控制器  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午9:20:50    
 */ 
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	
	private DecorateService decorateService = new DecorateServiceImpl();
	private CommentService commentService = new CommentServiceImpl();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession(); 
		
		String flag = request.getParameter("flag");
	
		if("edit".equals(flag)) {
			
			//跳往评论页面
			String id = request.getParameter("id");
			
			Decorate decorate = decorateService.sel_one(id);
			
			request.setAttribute("Decorate", decorate);
			
			request.getRequestDispatcher("page/addComment.jsp").forward(request, response);
		}
		
		if("add".equals(flag)) {
			
			//新增评论
			
			String decorateId = request.getParameter("id");				//商品id
			String comment = request.getParameter("comment").trim();			//评论内容
			String descript = request.getParameter("comment-descript");	//产品描述是否一致打分
			String quality = request.getParameter("comment-quality");	//产品质量是否达标打分
			
			if(commentService.add_comment(new Comment(UserDaoImpl.loginUser.getAccount(), decorateId, comment, descript, quality)) > 0 ) {
				
				System.out.println("评论发布成功！");
			}
			
			//跳往用户评论页面
			response.sendRedirect("CommentServlet?flag=select");
			
		}		
		
		if("select".equals(flag)) {
			
			//查询该用户所有评论
			
			//页数
			String pageNumberStr = request.getParameter("pageNumber");
			int pageNumber = 1;
			if(pageNumberStr != null && !pageNumberStr.equals("")){
				pageNumber = Integer.parseInt(pageNumberStr);
			}
			
			//页面大小
			String pageSizeStr = request.getParameter("pageSize");
			
			int pageSize = 2;	//第一次访问的验证,如果没有传递参数,设置默认值			
			if(pageSizeStr != null && !pageSizeStr.equals("") ){
				//页面传了参数过来，证明更改了页面大小，给session重新赋值，重新初始化页数  
				session.setAttribute("AccountComment", pageSizeStr);
				pageSize = Integer.parseInt(pageSizeStr);
				pageNumber = 1;	//换了页面大小之后，初始化页数。
			}
			else if(session.getAttribute("AccountComment") != null && !session.getAttribute("AccountComment").equals("")) {
				//前台没传参数过来，所以要记住之前的页面大小，用session保存的值进行赋值
				pageSize = Integer.parseInt(session.getAttribute("AccountComment")+"");				
			}
			
			//将本页所有数据装载在page中
			Page page = commentService.sel_account(pageSize, pageNumber, UserDaoImpl.loginUser.getAccount());
			
			List<?> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).toString());
			}
			System.out.println("[当前页："+page.getPageNumber()+"] [当前页面大小："+page.getPageSize()+"] [总页数："+page.getTotal()+"]");
			
			request.setAttribute("PageInfo", page);
			
			request.getRequestDispatcher("page/comment.jsp").forward(request, response);
		}
		
		if("all".equals(flag)) {
			
			//查询该商品所有评论
			String id = request.getParameter("id");
			if(id != null && !id.equals("")) {
				
				//页面第一次传了参数过来，之后所有的评论都是基于这件商品
				session.setAttribute("DecorateId", id);
			}
			else if(session.getAttribute("DecorateId") != null && !session.getAttribute("DecorateId").equals("")) {
				//前台没传参数过来，所以要记住要查询的是哪件商品，用session保存的值进行赋值
				id = session.getAttribute("DecorateId")+"";				
			}
			
			//页数
			String pageNumberStr = request.getParameter("pageNumber");
			int pageNumber = 1;
			if(pageNumberStr != null && !pageNumberStr.equals("")){
				pageNumber = Integer.parseInt(pageNumberStr);
			}
			
			//页面大小
			String pageSizeStr = request.getParameter("pageSize");
			
			int pageSize = 2;	//第一次访问的验证,如果没有传递参数,设置默认值			
			if(pageSizeStr != null && !pageSizeStr.equals("") ){
				//页面传了参数过来，证明更改了页面大小，给session重新赋值，重新初始化页数  
				session.setAttribute("AllComment", pageSizeStr);
				pageSize = Integer.parseInt(pageSizeStr);
				pageNumber = 1;	//换了页面大小之后，初始化页数。
			}
			else if(session.getAttribute("AllComment") != null && !session.getAttribute("AllComment").equals("")) {
				//前台没传参数过来，所以要记住之前的页面大小，用session保存的值进行赋值
				pageSize = Integer.parseInt(session.getAttribute("AllComment")+"");				
			}
			
			//将本页所有数据装载在page中
			Page page = commentService.sel_all(pageSize, pageNumber, id);
			
			List<?> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).toString());
			}
			System.out.println("[当前页："+page.getPageNumber()+"] [当前页面大小："+page.getPageSize()+"] [总页数："+page.getTotal()+"]");
			
			Decorate decorate = decorateService.sel_one(id);
			
			request.setAttribute("Decorate", decorate);
			request.setAttribute("PageInfo", page);
			
			request.getRequestDispatcher("page/moreComment.jsp").forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
