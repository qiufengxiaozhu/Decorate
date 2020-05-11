/**
 * 
 */
package org.java.bean;

import java.util.List;

/**  
* @ClassName: Page  
* @Description: Page类用于存放分页信息：  
* @author 邱高强
* @date 2020年3月30日  
* @time 下午5:27:42   
*/
public class Page {

	/**  
	* @Description pageSize:{ 每页显示个数 }
	*/ 
	private int pageSize;
	
	/**  
	* @Description pageNumber:{ 当前第几页 }
	*/ 
	private int pageNumber;
	
	/**  
	* @Description total:{ 总页数 }
	*/ 
	private long total;
	
	/**  
	* @Description list:{ 当前页显示的数据 }
	*/ 
	private List<?> list;	//此处使用了泛型，？代表任何类型

	
	/**  
	* 创建一个新的实例 Page.    
	*/ 
	public Page() {
		super();
	}

	/**  
	* 创建一个新的实例 Page.  
	* @param pageSize
	* @param pageNumber
	* @param total
	* @param list  
	*/ 
	public Page(int pageSize, int pageNumber, long total, List<?> list) {
		super();
		this.pageSize = pageSize;
		this.pageNumber = pageNumber;
		this.total = total;
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Page [pageSize=" + pageSize + ", pageNumber=" + pageNumber + ", total=" + total + ", list=" + list
				+ "]";
	}
	
	
		
}
