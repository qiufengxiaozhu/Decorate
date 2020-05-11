package org.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.service.UserService;
import org.java.service.impl.UserServiceImpl;

/**  
* @ClassName: Password  
* @Description: 找回密码控制器  
* @author 邱高强  
* @date 2020年3月10日    
*/  
@WebServlet("/PasswordServlet")
public class PasswordServlet extends HttpServlet {
	
	private UserService userService = new UserServiceImpl();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String flag = request.getParameter("flag");	
		System.out.println("flag:"+flag);
		
		if("account".equals(flag)) {
			System.out.println("执行AJAX--account");
			
			String newAccount = request.getParameter("newAccount");	
			int result = userService.sel_account(newAccount);
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(result);
			out.flush();
			out.close();
		}		
		
		else if("mail".equals(flag)) {
			System.out.println("执行AJAX--mail");
			
			String newMail = request.getParameter("newMail");	
			String newAccount = request.getParameter("newAccount");	
			String result = "0";
			System.out.println("新邮箱："+newMail+" 新账号："+newAccount);			
			if(newMail.equals(userService.sel_mail(newAccount)))
				result = "1";
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(result);
			out.flush();
			out.close();
		}		
		
		else {
			
			String account = request.getParameter("account");	
			String password = request.getParameter("password");	
			
			if(userService.update_password(account, password) > 0) {
				System.out.println("重置密码成功！");
				request.setAttribute("Success", "success");
				request.getRequestDispatcher("/page/password.jsp").forward(request, response);
			}
			else {
				System.out.println("重置密码失败！");
				request.setAttribute("Error", "error");
				request.getRequestDispatcher("/page/password.jsp").forward(request, response);
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
