package com.zz.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zz.entity.Log;
import com.zz.entity.User;
import com.zz.service.LogService;
import com.zz.util.Universal;

@Controller
public class LogController {
	@Autowired
	private LogService logService;
	
	//添加日记
	@RequestMapping("submitLog")
	public @ResponseBody Map<String,String> submitLog(@RequestBody Log log,HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("User");
		log.setUserId(user.getUserId());//将用户ID存入;
		return Universal.insert(logService, log);
	}
	
	//显示日记
	@RequestMapping("showLog")
	public @ResponseBody Map<String,Object> showLog(String logName,Integer currentPageNo,HttpServletRequest  request){
		int userId = Universal.getUserId(request);
		return Universal.query(logService, logName, currentPageNo,userId);
	}
	
	//根据名字显示信息
	@RequestMapping("queryLogBylogName")
	public ModelAndView queryLogBylogName(String name,Integer currentPageNo)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("logName", name);
		mv.addObject("currentPageNo", currentPageNo);
		mv.setViewName("redirect:showLog.do");//转交给别的处理请求去处理,避免出现大量重复的代码.
		return mv;
	}
	
	/*
	 * 用于给修改页面传输要修改的数据
	 * */
	@RequestMapping("updateL")
	public ModelAndView updateL()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:jsp/updateLog.jsp");//转交给修改页面.
		return mv;
	}
	
	//修改日记
	@RequestMapping("updateLog")
	public @ResponseBody Map<String,String> upDateLog(@RequestBody Log log,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("User");
		//将uerId添加上去,避免修改错误.
		log.setUserId(user.getUserId());
		return Universal.update(logService, log);
	}
	
	//删除日记
	@RequestMapping("deleteLog")
	public @ResponseBody Map<String,String> deleteLog(Integer logId)
	{
		return Universal.delete(logService,logId);
	}
}
