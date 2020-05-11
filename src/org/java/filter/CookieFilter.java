package org.java.filter;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
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
 * Servlet Filter implementation class CookieFilter
 */
/**  
* @ClassName: CookieFilter  
* @Description: 用于自动登录的拦截器  
* @author 邱高强  
* @date 2020年3月4日    
*/  


@WebFilter("/*")
public class CookieFilter implements Filter {

	private UserService userService = new UserServiceImpl();
	private DecorateService decorateService = new DecorateServiceImpl();

    /**
     * Default constructor. 
     */
    public CookieFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;        
		HttpServletResponse resp = (HttpServletResponse) response;        
		HttpSession session = req.getSession();         
		// 获得cookie中用户名和密码 进行登录的操作       
		// 定义cookie_username        
		String cookie_username = null;        
		// 定义cookie_password        
		String cookie_password = null;        
		// 获得cookie       
		Cookie[] cookies = req.getCookies();        
		if (cookies != null) {            
			for (Cookie cookie : cookies) {                
				// 获得名字是cookie_username和cookie_password                
				if ("account".equals(cookie.getName())) {                    
					cookie_username = cookie.getValue();                    
					// 对cookie中的值解码                    
					cookie_username = URLDecoder.decode(cookie_username, "UTF-8");                
					}                
				if ("password".equals(cookie.getName())) {                    
					cookie_password = cookie.getValue();                
				}            
			}        
		}        
		
		//用户点击登录时，如果cookie不为空，则直接登录成功！
		if(cookie_username != null && cookie_password != null && "login".equals(request.getParameter("flag"))){            
			if(userService.sel_user(cookie_username, cookie_password) > 0){   
								  
				System.out.println("已从cookie中读出！");
				System.out.println("[账号："+cookie_username+"] [password："+cookie_password+"]");

				//给用户信息赋值
				session.setAttribute("User", UserDaoImpl.loginUser);
				//从第9位之后开始截取
				String initPhoto = UserDaoImpl.loginUser.getPhoto();
				String userPhoto = initPhoto.length() < 80 ? initPhoto : initPhoto.substring(40);
				session.setAttribute("userPhoto", userPhoto);
				
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}        
		}
		
		//用户选择退出登录
		if("exit".equals(request.getParameter("flag"))) {
			System.out.println("退出登录...");
			//清空Cookie操作 
			try { 
				for (Cookie cookie : cookies) {
		            cookie.setMaxAge(0);
		            cookie.setPath(req.getContextPath());//很关键，设置成跟写入cookies一样的，全路径共享Cookie
		            resp.addCookie(cookie);
		        }
			}catch(Exception e) { 
				e.printStackTrace();
				System.out.println("清空Cookies发生异常！"); 
			} 			
			
			session.setAttribute("User", "null");
			request.getRequestDispatcher("page/login.jsp").forward(request, response);
		}
				
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
