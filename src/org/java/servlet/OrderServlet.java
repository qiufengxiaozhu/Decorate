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
import org.java.dao.impl.UserDaoImpl;
import org.java.service.OrderService;
import org.java.service.impl.OrderServiceImpl;

/**  
 * @ClassName: OrderServlet  
 * @Description: 用户订单控制器  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 下午4:39:34    
 */ 
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

	private OrderService orderService = new OrderServiceImpl();
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(); 
		
		String flag = request.getParameter("flag");
		
		String orderTime = request.getParameter("orderTime");	//用户的下单时间
		
		if("0".equals(orderTime)) {
			
			//用户点击了搜索按钮，但值等于0代表用户忽略时间条件，全部查询!
			flag = "all";
			
			//清掉时间条件的session
			session.setAttribute("OrderTime", "");
		}
		if(orderTime != null && !orderTime.equals("") && !orderTime.equals("0") ) {
			
			//用户输入了具体的时间
			//系统帮用户记住这个时间，以免用户换页导致这个条件丢失			
			session.setAttribute("OrderTime", orderTime);
		}
		if(session.getAttribute("OrderTime") != null && !session.getAttribute("OrderTime").equals("")) {
			
			//如果不等于空，说明用户进行了时间条件查询
			flag = "time";
			
			//给下单时间赋值
			orderTime = session.getAttribute("OrderTime")+"";
		}
		
		//查询该用户所有订单
		if("all".equals(flag)) {
			
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
				session.setAttribute("PageSizeAll", pageSizeStr);
				pageSize = Integer.parseInt(pageSizeStr);
				pageNumber = 1;	//换了页面大小之后，初始化页数。
			}
			else if(session.getAttribute("PageSizeAll") != null && !session.getAttribute("PageSizeAll").equals("")) {
				//前台没传参数过来，所以要记住之前的页面大小，用session保存的值进行赋值
				pageSize = Integer.parseInt(session.getAttribute("PageSizeAll")+"");				
			}
			
			//将本页所有数据装载在page中
			Page page = orderService.sel_account(pageSize, pageNumber, UserDaoImpl.loginUser.getAccount());
			
			List<?> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).toString());
			}
			System.out.println("[当前页："+page.getPageNumber()+"] [当前页面大小："+page.getPageSize()+"] [总页数："+page.getTotal()+"]");
			
			request.setAttribute("PageInfo", page);
			
			request.getRequestDispatcher("page/order.jsp").forward(request, response);
		}
		
		//根据用户下单时间，查询该时间之后该用户所有订单
		if("time".equals(flag)) {
			
			
			
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
				session.setAttribute("PageSizeAll", pageSizeStr);
				pageSize = Integer.parseInt(pageSizeStr);
				pageNumber = 1;	//换了页面大小之后，初始化页数。
			}
			else if(session.getAttribute("PageSizeAll") != null && !session.getAttribute("PageSizeAll").equals("")) {
				//前台没传参数过来，所以要记住之前的页面大小，用session保存的值进行赋值
				pageSize = Integer.parseInt(session.getAttribute("PageSizeAll")+"");				
			}
			
			//将本页所有数据装载在page中
			Page page = orderService.sel_orderTime(pageSize, pageNumber, UserDaoImpl.loginUser.getAccount(), orderTime);
			
			List<?> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).toString());
			}
			System.out.println("[当前页："+page.getPageNumber()+"] [当前页面大小："+page.getPageSize()+"] [总页数："+page.getTotal()+"]");
			
			request.setAttribute("PageInfo", page);
			
			request.setAttribute("Time", orderTime);
			
			request.getRequestDispatcher("page/order.jsp").forward(request, response);
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
