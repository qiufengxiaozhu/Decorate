/**
 * 
 */
package org.java.test;

import java.io.File;
import java.io.IOException;

import org.java.service.UserService;
import org.java.service.impl.UserServiceImpl;

/**  
* @ClassName: Test  
* @Description: 测试专用  
* @author 邱高强  
* @date 2020年3月2日    
*/
public class Test {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub

		UserService userService = new UserServiceImpl();
		
		
		//测试1:是否能查找用户
//		int loginSeccess = userService.sel_user("15179497032", "123456");
//		
//		if(loginSeccess > 0)
//			System.out.println(UserDaoImpl.loginName + "登录成功！！！" );
		
		//测试2：验证码
//		Random random=new Random();
//		char chs[]=new char[] {'a','b','c','F','H','中','m','d'};
//		StringBuilder rel=new StringBuilder("");
//		for(int i=0;i<4;i++) {
//			rel.append(chs[random.nextInt(chs.length)]);		
//		}
//		System.out.println("校验码是："+rel.toString());
		
		//测试3：截取字符串长度
//		String str1 = "D:/eclipse-workspace/Decorate/WebContent/files_uploads";
//		String str2 = str1.length() > 40 ? "hello world!".substring(6) : "thank you!".substring(6);
//		System.out.println(str2);
		
		//得到服务器根目录
		//request.getSession().getServletContext().getRealPath("/")得到“根”目录，再加 "webcontent" 就可以
		
		//获取工作空间的绝对路径
		File directory = new File("");// 参数为空
		String workspacePath = directory.getCanonicalPath(); //获取工作空间的绝对路径
		System.out.println(workspacePath);
		
		//String wokespacepath=directory.toString().substring(0, directory.toString().indexOf(".metadata"));
		//directory=new File(this.getClass().getResource("/../../").getPath());
		//System.out.println(directory);
		
		System.out.println(Thread.currentThread().getStackTrace()[1].getClassName());
	}

	
}
