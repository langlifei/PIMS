package com.zz.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zz.entity.PagingVO;
import com.zz.entity.User;
import com.zz.service.Service;


/**
 * 
 * @author allen
 * 对控制层的CURD冗余代码进行封装
 */
public class Universal {
	public static Map<String,Object> query(Service service,String object,Integer currentPageNo,int userId)
	{
		List<Object> list = null;
        //页码对象
        PagingVO pagingVO = new PagingVO();
        //设置总页数
        Map<String,Object> result = new HashMap<String,Object>();
        pagingVO.setTotalCount(service.getCount(object,userId));
        if (currentPageNo == null || currentPageNo == 0)
            pagingVO.setToPageNo(1);
        else
            pagingVO.setToPageNo(currentPageNo);
        list = service.findByPaging(object,pagingVO,userId);
        result.put("list", list);
        result.put("pagingVO", pagingVO);
        return result;
	}
	
	public static Map<String,String> insert(Service service,Object object)
	{
		Map<String,String> result = new HashMap<String,String>();
		String flag;
		if(service.insert(object))
			flag = "添加成功!";
		else 
			flag = "添加失败!";
		result.put("flag",flag);
		return result;
	}
	
	public static Map<String,String> delete(Service service,Integer Id)
	{
		String flag;
		Map<String,String> result = new HashMap<String,String>();
		if(service.delete(Id))
			flag="删除成功";
		else
			flag="删除失败";
		result.put("flag", flag);
		return result;
	}
	
	public static Map<String,String> update(Service service, Object object)
	{
		String flag;
		//将uerId添加上去,避免修改错误.
		Map<String,String> result = new HashMap<String,String>();
		if(service.update(object))
			flag="修改成功";
		else
			flag="修改失败";
		result.put("flag", flag);
		return result;
	}
	
	public static int getUserId(HttpServletRequest request){
		HttpSession  session = request.getSession();
		User user = (User)session.getAttribute("User");
		return user.getUserId();
	}
	
	//获取用户文件夹路径
	public static String getUserPath(HttpServletRequest request){
//		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		String realPath = "D:/upload";
		User user = (User)request.getSession().getAttribute("User");//获取用户对象
		realPath = realPath+"/"+user.getUserName();//创建用户文件夹;
		return realPath;
	}
	
	//返回错误
	public static Map<String,String> returnString(String flag){
		Map<String,String> result = new HashMap<String,String>();
		result.put("flag", flag);
		return result;
	}
}
