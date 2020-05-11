package org.java.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.service.DecorateService;
import org.java.service.impl.DecorateServiceImpl;

/**  
 * @ClassName: DelGoodsServlet  
 * @Description: 下架指定商品控制器  
 * @author 邱高强 
 * @date 2020年4月10日 
 * @date 下午3:39:10    
 */ 
@WebServlet("/DelGoodsServlet")
public class DelGoodsServlet extends HttpServlet {
	
	private DecorateService decorateService = new DecorateServiceImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String flag = request.getParameter("flag");
	
		//单次删除
		if("one".equals(flag)) {
			
			String[] id = {request.getParameter("id")};
//			for (int i = 0; i < id.length; i++) {
//				System.out.println(id[i]);
//			}
			if(decorateService.delete_decorate(id) > 0) {
				System.out.println("下架成功！");
				response.sendRedirect("SelectGoodsServlet?flag=all");
			}
		}
		//批量删除
		if("batch".equals(flag)) {
			
			String[] id = request.getParameterValues("id");
//			String[] split = id[0].split(",");
//			for (int i = 0; i < split.length; i++) {
//				System.out.println(split[i]);
//			}
			if(decorateService.delete_decorate(id[0].split(",")) > 0) {
				
				System.out.println("所选商品下架成功！");
				
				response.sendRedirect("SelectGoodsServlet?flag=all");
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
