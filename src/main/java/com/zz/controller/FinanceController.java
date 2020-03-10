package com.zz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zz.entity.PagingVO;
import com.zz.entity.User;
import com.zz.service.FinanceService;
import com.zz.util.Universal;
@Controller
public class FinanceController {

	@Autowired
	private FinanceService financeService;
	
	@RequestMapping("queryType")
	public @ResponseBody Map<String,Object> queryTypes(String tName)
	{
		List<Object> list = financeService.queryTypes(tName);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("list", list);
		return result;
	}
	
	@RequestMapping("insertAccounts")
	public @ResponseBody Map<String,String> insertAccounts(HttpServletRequest request)
	{
		String jsonStr = request.getParameter("params");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("User");
		Map<String,String> result = new HashMap<String,String>();
		String flag;
		int num = financeService.insertAccounts(jsonStr,user.getUserId());
		if(num >0)
			flag = "添加成功!";
		else 
			flag = "添加失败!";
		result.put("flag",flag);
		result.put("num",""+num);
		return result;
	}
	
	@RequestMapping("queryFinance")
	public @ResponseBody Map<String,Object> queryFinance(String beginTime,String endTime,Integer flag,Integer currentPageNo,HttpServletRequest request){
		int userId = Universal.getUserId(request);
		List<Object> list = null;
        //页码对象
        PagingVO pagingVO = new PagingVO();
        //设置总页数
        Map<String,Object> result = new HashMap<String,Object>();
        pagingVO.setTotalCount(financeService.getCount(beginTime,endTime,flag,userId));
        if (currentPageNo == null || currentPageNo == 0)
            pagingVO.setToPageNo(1);
        else
            pagingVO.setToPageNo(currentPageNo);
        list = financeService.findByPaging(beginTime,endTime,flag,pagingVO,userId);
        result.put("list", list);
        result.put("pagingVO", pagingVO);
        return result;
	}
	
	
	//查询所有消费信息
	@RequestMapping("queryExpense")
	public ModelAndView queryExpense(String beginTime,String endTime,Integer currentPageNo)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("beginTime", beginTime);
		mv.addObject("endTime", endTime);
		mv.addObject("flag", 0);
		mv.addObject("currentPageNo", currentPageNo);
		mv.setViewName("redirect:queryFinance.do");//转交给别的处理请求去处理,避免出现大量重复的代码.
		return mv;
	}
	
	//查询所有收入信息
	@RequestMapping("queryIncome")
	public ModelAndView queryIncome(String beginTime,String endTime,Integer currentPageNo)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("beginTime", beginTime);
		mv.addObject("endTime", endTime);
		mv.addObject("flag", 1);
		mv.addObject("currentPageNo", currentPageNo);
		mv.setViewName("redirect:queryFinance.do");//转交给别的处理请求去处理,避免出现大量重复的代码.
		return mv;
	}
	
	
	//查询所有财政信息
	@RequestMapping("queryAllFinance")
	public ModelAndView queryAllFinance(String beginTime,String endTime,Integer currentPageNo)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("beginTime", beginTime);
		mv.addObject("endTime", endTime);
		mv.addObject("flag", 2);
		mv.addObject("currentPageNo", currentPageNo);
		mv.setViewName("redirect:queryFinance.do");//转交给别的处理请求去处理,避免出现大量重复的代码.
		return mv;
	}
}
