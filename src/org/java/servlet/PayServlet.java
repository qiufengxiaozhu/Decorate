package org.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.bean.Grade;
import org.java.bean.Member;
import org.java.bean.Order;
import org.java.dao.impl.UserDaoImpl;
import org.java.service.DecorateService;
import org.java.service.GradeService;
import org.java.service.MemberService;
import org.java.service.OrderService;
import org.java.service.impl.DecorateServiceImpl;
import org.java.service.impl.GradeServiceImpl;
import org.java.service.impl.MemberServiceImpl;
import org.java.service.impl.OrderServiceImpl;

/**  
 * @ClassName: PayServlet  
 * @Description: 支付订单控制器  
 * @author 邱高强 
 * @date 2020年4月16日 
 * @date 上午11:40:30    
 */ 
@WebServlet("/PayServlet")
public class PayServlet extends HttpServlet {
	
	private OrderService orderService = new OrderServiceImpl();
	private MemberService memberService = new MemberServiceImpl();
	private GradeService gradeService = new GradeServiceImpl();
	private DecorateService decorateService = new DecorateServiceImpl();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String decorateId = request.getParameter("id");					//装饰品id
		String order = request.getParameter("order");					//订单号
		String username = request.getParameter("username");				//收货人姓名
		String tel = request.getParameter("tel");						//收货人手机号
		String lng = request.getParameter("lng");						//收货地址经度
		String lat = request.getParameter("lat");						//收货地址纬度
		String address = request.getParameter("address");				//收货地址
		String number = request.getParameter("quantity");				//购买数量
		String needTotal = request.getParameter("needTotal");			//应付金额
		needTotal = needTotal.substring(0, needTotal.length()-2);   	//截掉后两位(后两位包括一个空格以及中文字符‘元’)
		//needTotal = String.format("%.2f", Double.parseDouble(needTotal));		//保留小数点后两位
		String rate = request.getParameter("rate");						//会员折扣
		String actuallyTotal = request.getParameter("actuallyTotal");	//实付金额
		actuallyTotal = actuallyTotal.substring(0, actuallyTotal.length()-2);   //截掉后两位
		
		
		System.out.println("[decorateId:"+decorateId+"] [order:"+order+"] [username:"+username+"] [tel:"+tel+"] [lng:"+lng+"] [lat:"+lat+"]"
				+ " [address:"+address+"] [number:"+number+"] [needTotal:"+needTotal+"] [rate:"+rate+"] [actuallyTotal:"+actuallyTotal+"]");
		
		String account = UserDaoImpl.loginUser.getAccount();
		Order bean = new Order(order,account,decorateId,number,needTotal,rate,actuallyTotal,username,tel,lng,lat,address);
	
		if(orderService.add_order(bean) > 0) {
			
			System.out.println("新增订单成功");
			
			//当商品被购买时，该商品库存也应该相应减少
			int count = Integer.parseInt(decorateService.sel_one(decorateId).getNumber());
			count = count - Integer.parseInt(number);
			
			if(decorateService.update_number(decorateId, count+"") > 0) {
				System.out.println("商品库存减少了！");
			}
			
			//查询该用户在此之前一共消费了多少
			double price = Double.parseDouble(memberService.sel_one(account).getTotal());
			//将该用户之前的消费与此次消费金额相加，判断其有没有达到会员升级的临界值
			price += Double.parseDouble(actuallyTotal);
			
			System.out.println("当前总消费："+price);
			List<Grade> gradeList = gradeService.sel_all();
			for (int i = 0; i < gradeList.size(); i++) {
				
				//如果目前总消费超过会员升级临界值，则让用户会员等级增长
				if( price >= Double.parseDouble(gradeList.get(i).getScore()) && price < Double.parseDouble(gradeList.get(i+1).getScore()) ) {
					
					if(memberService.update_member(new Member(account, price+"", i+1+"")) > 0 ) {
						
						System.out.println("用户会员等级为："+(i+1));
					}
				}
				System.out.println(gradeList.get(i).toString());
			}
		}
		
		//跳转至用户订单页面
		response.sendRedirect("OrderServlet?flag=all");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
