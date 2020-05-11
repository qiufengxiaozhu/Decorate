package org.java.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.java.bean.Category;
import org.java.bean.Comment;
import org.java.bean.Decorate;
import org.java.bean.Member;
import org.java.bean.Page;
import org.java.dao.impl.UserDaoImpl;
import org.java.service.CategoryService;
import org.java.service.CommentService;
import org.java.service.DecorateService;
import org.java.service.MemberService;
import org.java.service.impl.CategoryServiceImpl;
import org.java.service.impl.CommentServiceImpl;
import org.java.service.impl.DecorateServiceImpl;
import org.java.service.impl.MemberServiceImpl;

/**  
 * @ClassName: SelectGoodsServlet  
 * @Description: TODO  
 * @author 邱高强 
 * @date 2020年4月10日 
 * @date 上午10:08:35    
 */ 
@WebServlet("/SelectGoodsServlet")
public class SelectGoodsServlet extends HttpServlet {
	
	private CategoryService categoryService = new CategoryServiceImpl();
	private DecorateService decorateService = new DecorateServiceImpl();
	private CommentService commentService = new CommentServiceImpl();
	private MemberService memberService = new MemberServiceImpl();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String flag = request.getParameter("flag");
		
		if("all".equals(flag)) {
						
			//页数
			String pageNumberStr = request.getParameter("pageNumber");
			int pageNumber = 1;
			if(pageNumberStr != null && !pageNumberStr.equals("")){
				pageNumber = Integer.parseInt(pageNumberStr);
			}
			
			//页面大小
			String pageSizeStr = request.getParameter("pageSize");
			HttpSession session = request.getSession(); 
			int pageSize = 2;	//第一次访问的验证,如果没有传递参数,设置默认值			
			if(pageSizeStr != null && !pageSizeStr.equals("") ){
				//页面传了参数过来，证明更改了页面大小，给session重新赋值，重新初始化页数  
				session.setAttribute("PageSizeAll", pageSizeStr);
				pageSize = Integer.parseInt(pageSizeStr);
				pageNumber = 1;	//换了页面大小之后，初始化页数。
			}
			else if(session.getAttribute("PageSizeAll") != null && !session.getAttribute("PageSizeAll").equals("")) {
				//前台没传参数过来，所以要记住之前的页面大小，用session保存的值进行赋值
				pageSize = Integer.parseInt(session.getAttribute("PageSizeAll")+"");				
			}
			
			//将本页所有数据装载在page中
			Page page = decorateService.sel_all(pageSize, pageNumber);
			
			List<?> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).toString());
			}
			System.out.println("[当前页："+page.getPageNumber()+"] [当前页面大小："+page.getPageSize()+"] [总页数："+page.getTotal()+"]");
			
			request.setAttribute("PageInfo", page);
			
			request.getRequestDispatcher("/page/putaway.jsp").forward(request, response);
		}
		
		if("one".equals(flag)) {
			
			//单个商品详情
			String decorateId = request.getParameter("id");
			
			Decorate decorate = decorateService.sel_one(decorateId);
			
			//查询该商品最近三条评论
			List<Comment> list = commentService.sel_three(decorateId);
			/*
			 * for (int i = 0; i < list.size(); i++) {
			 * System.out.println(list.get(i).toString()); }
			 */
			
			request.setAttribute("Decorate", decorate);
			request.setAttribute("CommentList", list);
			
			request.getRequestDispatcher("page/details.jsp").forward(request, response);			
		}
		
		if("three".equals(flag)) {
			
			//给首页三个推荐商品赋值
			List<Decorate> list = decorateService.sel_three();
			   
			request.setAttribute("Decorate", list);
			request.setAttribute("Index", "1");
			
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		
		if("six".equals(flag)) {
			
			List<Decorate> decorateList = new ArrayList<Decorate>();
			decorateList.clear();
			//给装饰材料分类页面推荐商品赋值
			List<Category> categoryList = categoryService.sel_all();
			for (int i = 0; i < categoryList.size(); i++) {
				List<Decorate> list = decorateService.sel_category(categoryList.get(i).getId()+"");
				decorateList.addAll(list);
			}
			
//			for (int i = 0; i < decorateList.size(); i++) {
//				System.out.println(decorateList.get(i).toString());
//			}
			
			request.setAttribute("DecorateList", decorateList);
			request.setAttribute("CategoryList", categoryList);

			request.getRequestDispatcher("page/category.jsp").forward(request, response);
		}
		
		if("category".equals(flag)) {
			
			HttpSession session = request.getSession();
			
			//材料类别
			String categoryId = request.getParameter("categoryId");
			if(categoryId != null && !categoryId.equals("") ){
				//页面传了参数过来，存在session中，下次没传参数时，从session中获取  
				session.setAttribute("CategoryId", categoryId);
			}
			else if(session.getAttribute("CategoryId") != null && !session.getAttribute("CategoryId").equals("")) {
				//前台没传参数过来，所以要记住之前材料类别，用session保存的值进行赋值
				categoryId = (String) session.getAttribute("CategoryId");				
			}
			
			//页数
			String pageNumberStr = request.getParameter("pageNumber");
			int pageNumber = 1;
			if(pageNumberStr != null && !pageNumberStr.equals("")){
				pageNumber = Integer.parseInt(pageNumberStr);
			}
			
			//页面大小
			int pageSize = 12;	//第一次访问的验证,如果没有传递参数,设置默认值			
			
			//将本页所有数据装载在page中
			Page page = decorateService.sel_category(pageSize, pageNumber, categoryId);
			
			List<?> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).toString());
			}
			System.out.println("[当前页："+page.getPageNumber()+"] [当前页面大小："+page.getPageSize()+"] [总页数："+page.getTotal()+"]");
			
			List<Category> categoryList = categoryService.sel_all();
			
			request.setAttribute("PageInfo", page);
			request.setAttribute("CategoryId", categoryId);
			request.setAttribute("CategoryList", categoryList);
			
			request.getRequestDispatcher("page/goods.jsp").forward(request, response);
			
		}
		
		if("style".equals(flag)) {
			
			HttpSession session = request.getSession();
			
			//装饰风格
			String style = request.getParameter("style");
			if("1".equals(style)) {
				style = "现代简约风格";
				session.setAttribute("Style", style);
			}
			else if("2".equals(style)) {
				style = "田园风格";
				session.setAttribute("Style", style);
			}
			else if("3".equals(style)) {
				style = "中式风格";
				session.setAttribute("Style", style);
			}
			else {
				style = (String) session.getAttribute("Style");
			}
			
			//材料类别
			String categoryId = request.getParameter("categoryId");
			if(categoryId != null && !categoryId.equals("") ){
				//页面传了参数过来，存在session中，下次没传参数时，从session中获取  
				session.setAttribute("CategoryId", categoryId);
			}
			else if(session.getAttribute("CategoryId") != null && !session.getAttribute("CategoryId").equals("")) {
				//前台没传参数过来，所以要记住之前材料类别，用session保存的值进行赋值
				categoryId = (String) session.getAttribute("CategoryId");				
			}
			
			//页数
			String pageNumberStr = request.getParameter("pageNumber");
			int pageNumber = 1;
			if(pageNumberStr != null && !pageNumberStr.equals("")){
				pageNumber = Integer.parseInt(pageNumberStr);
			}
			
			//页面大小,前台页面默认设置每页12条记录			 
			int pageSize = 12;		

			//将本页所有数据装载在page中
			Page page = decorateService.sel_style(pageSize, pageNumber, categoryId, style);
			
			List<?> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).toString());
			}
			System.out.println("[当前页："+page.getPageNumber()+"] [当前页面大小："+page.getPageSize()+"] [总页数："+page.getTotal()+"]");
			
			List<Category> categoryList = categoryService.sel_all();
			
			request.setAttribute("PageInfo", page);
			request.setAttribute("CategoryId", categoryId);
			request.setAttribute("Style", style);
			request.setAttribute("CategoryList", categoryList);
			
			request.getRequestDispatcher("page/style.jsp").forward(request, response);
		}
		
		if("pay".equals(flag)) {
			
			//跳往支付页面
			
			//单个商品详情
			String decorateId = request.getParameter("id");
			
			//根据商品id查询该商品信息
			Decorate decorate = decorateService.sel_one(decorateId);
			
			//根据用户账号查询该用户会员信息
			Member member = memberService.sel_one(UserDaoImpl.loginUser.getAccount());
			System.out.println(member.toString());
			
			request.setAttribute("Decorate", decorate);
			request.setAttribute("Member", member);
			
			request.getRequestDispatcher("page/pay.jsp").forward(request, response);
			
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
