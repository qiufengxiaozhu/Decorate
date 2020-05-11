package org.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.java.bean.Page;
import org.java.bean.User;
import org.java.service.UserService;
import org.java.service.impl.UserServiceImpl;

/**  
 * @ClassName: UserListServlet  
 * @Description: 用户列表控制器  
 * @author 邱高强 
 * @date 2020年4月17日 
 * @date 下午4:39:17    
 */ 
@WebServlet("/UserListServlet")
public class UserListServlet extends HttpServlet {
	
	private UserService userService = new UserServiceImpl();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String flag = request.getParameter("flag");
		
		if("all".equals(flag)) {
			
			//所有用户信息列表
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
			Page page = userService.sel_all(pageSize, pageNumber);
			
			List<?> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).toString());
			}
			System.out.println("[当前页："+page.getPageNumber()+"] [当前页面大小："+page.getPageSize()+"] [总页数："+page.getTotal()+"]");
			
			request.setAttribute("PageInfo", page);
			
			request.getRequestDispatcher("page/userList.jsp").forward(request, response);	
		}
		
		if("one".equals(flag)) {
			
			//单个用户信息详情
			String account = request.getParameter("account");
			
			User user = userService.sel_one(account);
			System.out.println(user.toString());
			
			request.setAttribute("UserDetails", user);
			
			request.getRequestDispatcher("page/userDetails.jsp").forward(request, response);
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
