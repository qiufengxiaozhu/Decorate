package org.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.bean.Car;
import org.java.bean.Page;
import org.java.dao.impl.UserDaoImpl;
import org.java.service.CarService;
import org.java.service.impl.CarServiceImpl;

/**  
 * @ClassName: CarServlet  
 * @Description: 购物车控制器  
 * @author 邱高强 
 * @date 2020年4月13日 
 * @date 上午10:40:34    
 */ 
@WebServlet("/CarServlet")
public class CarServlet extends HttpServlet {
	
	private CarService carService = new CarServiceImpl();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		
		String flag = request.getParameter("flag");
		
		//添加购物车
		if("add".equals(flag)) {
			
			String decorateId = request.getParameter("decorateId");
			
			int result = carService.add_car(new Car(UserDaoImpl.loginUser.getAccount(),decorateId));
			if( result > 0) {
				
				System.out.println("加入购物车成功！");
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println(0);
				out.flush();
				out.close();
			}
		}
		
		//移出购物车
		else if("del".equals(flag)) {
			
			//获取要删除的id
			String id = request.getParameter("id");
			
			//页数
			String pageNumber = request.getParameter("pageNumber");
			
			if(carService.del_car(id) > 0) {
				
				System.out.println("移出购物车成功！");
				response.sendRedirect("CarServlet?flag=select&pageNumber="+pageNumber);
			}
		}
		
		//查询购物车
		else if("select".equals(flag)) {
			
			//页数
			String pageNumberStr = request.getParameter("pageNumber");
			int pageNumber = 1;
			if(pageNumberStr != null && !pageNumberStr.equals("")){
				pageNumber = Integer.parseInt(pageNumberStr);
			}
			
			//页面大小,前台页面默认设置每页12条记录			 
			int pageSize = 12;			
			
			//查询本页所有数据
			Page page = carService.sel_all(pageSize, pageNumber, UserDaoImpl.loginUser.getAccount());
			
			//输出查看
			List<?> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).toString());
			}
			System.out.println("[当前页："+page.getPageNumber()+"] [当前页面大小："+page.getPageSize()+"] [总页数："+page.getTotal()+"]");
			
			request.setAttribute("PageInfo", page);
			
			request.getRequestDispatcher("page/car.jsp").forward(request, response);
		}
		
		//判断用户是否将同一商品重复加入购物车
		else if("one".equals(flag)) {
			
			String decorateId = request.getParameter("id");
			int result = carService.sel_one(decorateId, UserDaoImpl.loginUser.getAccount());
			if( result > 0) {
				
				System.out.println("商品重复加入购物车!");
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println(result);
				out.flush();
				out.close();
			}
			else {
				response.sendRedirect("CarServlet?flag=add&decorateId="+decorateId);
			}
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
