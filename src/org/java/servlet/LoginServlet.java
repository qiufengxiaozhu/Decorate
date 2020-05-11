package org.java.servlet;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.java.bean.Decorate;
import org.java.dao.impl.UserDaoImpl;
import org.java.service.DecorateService;
import org.java.service.UserService;
import org.java.service.impl.DecorateServiceImpl;
import org.java.service.impl.UserServiceImpl;

/**  
* @ClassName: LoginServlet  
* @Description: 登录控制器  
* @author 邱高强  
* @date 2020年3月2日    
*/  
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private UserService userService = new UserServiceImpl();
	private DecorateService decorateService = new DecorateServiceImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//测试路径
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";		
		System.out.println(path);		//   /Decorate
		System.out.println(basePath);	//   http://localhost:8080/Decorate/
		
		File directory = new File("");// 参数为空
		String workspacePath = directory.getCanonicalPath(); //获取工作空间的绝对路径
		System.out.println(workspacePath);	//D:\eclipse\eclipse
		
		directory=new File(this.getClass().getResource("/../../").getPath());
		System.out.println(directory);		//D:\Tomcat\apache-tomcat-9.0.27\webapps\Decorate

		System.out.println(request.getSession().getServletContext().getRealPath("/"));
		String property = System.getProperty("user.dir");
		System.out.println("0"+property);
		System.out.println("1"+Thread.currentThread().getContextClassLoader().getResource(""));
		System.out.println("2"+this.getClass().getResource(""));
		System.out.println("3"+this.getClass().getResource("/"));
		System.out.println("4"+this.getClass().getClassLoader().getResource(""));
		System.out.println("5"+new File("").getAbsolutePath());
		System.out.println("7"+ this.getClass().getClassLoader().getResource("").toString().replace("file:/", "").replace("%20", " "));
		System.out.println("8"+this.getServletContext().getRealPath("/"));
		
		/************************************************************************************/
		
		String flag = request.getParameter("flag"); 	//如果不为空，则用户选择退出登录
		
		if(!"exit".equals(flag)) {

			String account = request.getParameter("account");		//账号
			String password = request.getParameter("password");		//密码
			String loginCode = request.getParameter("loginCode");	//用户输入的验证码
			String autoLogin = request.getParameter("autoLogin");	//如果不为空，则用户勾选自动登录
			String codeSession = request.getSession().getAttribute("code").toString();	//自动生成的验证码
			
			System.out.println("账号："+account+" 密码："+password+" 验证码："+loginCode+" 校验码："+codeSession+" 自动登录："+autoLogin);
			
			//定义cookie
			Cookie accountCookie = null;
			Cookie passwordCookie = null;
			
			//判断验证码是否匹配
			if(codeSession.equals(loginCode)) {
				int loginSuccess = userService.sel_user(account, password);
				if(loginSuccess > 0) {
					System.out.println("登录成功！");
									
					if(autoLogin!=null){                 
						//编码是为了在cookie中存储汉字                
						String usernameCode = URLEncoder.encode(account, "utf-8");
						// 1、创建 cookie 对象，存储会话数据
						accountCookie = new Cookie("account",account);                
						passwordCookie = new Cookie("password",password); 
						
						//设置持久化时间  cookie.setMaxAge单位是秒，60*60*24*30应该是一个月时间               
						accountCookie.setMaxAge(60*60*2);                
						passwordCookie.setMaxAge(60*60*2); 
						
						// 2、设置 cookie 的有效路径。       
						// 有效路径指的是 cookie 的有效路径保存在哪里，那么浏览器在有效路径下访问服务器时        
						// 就会带着 cookie 信息，否则不带 cookie 信息。                
						accountCookie.setPath(request.getContextPath());                
						passwordCookie.setPath(request.getContextPath());                
						//发送cookie                
						response.addCookie(accountCookie);                
						response.addCookie(passwordCookie);            					
					}				
										
					//给用户信息赋值
					HttpSession session = request.getSession();   
					session.setAttribute("User", UserDaoImpl.loginUser);
					//从第9位之后开始截取
					String initPhoto = UserDaoImpl.loginUser.getPhoto();
					String userPhoto = initPhoto.length() < 80 ? initPhoto : initPhoto.substring(40);
					session.setAttribute("userPhoto", userPhoto);
					
					//response.sendRedirect("/SelectGoodsServlet?flag=three");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else {
					//System.out.println("登录失败！");
					request.setAttribute("ErrorAccount", "errorAccount");	
					request.getRequestDispatcher("page/login.jsp").forward(request, response);
				}
			}
			
			if(!codeSession.equals(loginCode)) {
				//System.out.println("验证码输入错误！");
				request.setAttribute("ErrorCode", "errorCode");		
				request.getRequestDispatcher("page/login.jsp").forward(request, response);
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
