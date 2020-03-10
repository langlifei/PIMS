package com.zz.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.zz.entity.User;
import com.zz.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("userLogin")
	public @ResponseBody Map<String,String> login(@RequestBody User user, HttpServletRequest request)
	{
		String flag;
		User newUser = userService.login(user);
		Map<String,String> result = new HashMap<String,String>();
		if(newUser != user && newUser != null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("User", newUser);
			flag="登录成功";
		}else if(newUser == user)
			flag="密码不正确!";
		else
			flag = "账户名不存在!";
		result.put("flag", flag);
		return result;
	}
	//用于跳转到主页
	@RequestMapping("login")
	public String login()
	{
		return "main";
	}
	
	//@ResponseBody表示返回的是数据,而非视图.
	@RequestMapping(value="updatePass", method= RequestMethod.POST)
	public @ResponseBody Map<String,String> updatePassword(@RequestBody Map<String, String> map,HttpServletRequest request) throws IOException
	{
		String oldPassword = map.get("oldPassword");
		String password = map.get("password");
		String flag;
		HttpSession session = request.getSession();
		User pastUser = (User) session.getAttribute("User");
		Map<String,String> result = new HashMap<String,String>();
		if(pastUser.getPassword().equals(oldPassword))
		{
			if(userService.updatePassword(password,pastUser))
				flag="修改成功!";
			else
				flag = "修改失败!";
		}else
			flag = "初试密码错误!";
		result.put("flag", flag);
		return result;
	}
	
	@RequestMapping("updateUserInfo")
	public @ResponseBody Map<String,String> updateUserInfo(@RequestBody User user,HttpServletRequest request){
		String flag;
		HttpSession session = request.getSession();
		User pastUser = (User)session.getAttribute("User");
		//将uerId添加上去,避免修改错误.
		user.setUserId(pastUser.getUserId());
		Map<String,String> result = new HashMap<String,String>();
		if(userService.updateUserInfo(user))
			flag="修改成功";
		else
			flag="修改失败";
		result.put("flag", flag);
		return result;
	}
	
	//注销
	@RequestMapping("logout")
	public String logOut(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("User");
		return "redirect:index.jsp";
	}
	
	//注册
	@RequestMapping("regist")
	public @ResponseBody Map<String,String> registUser(@RequestBody User user){
		String flag="";
		if(userService.isRepeatUserName(user.getUserName()))
		{
			flag="该用户名已存在!";
		}else{
			if(userService.regist(user))
				flag = "注册成功!";
			else
				flag = "注册失败!";
		}
		Map<String,String> result = new HashMap<String,String>();
		result.put("flag", flag);
		return result;
	}
}
