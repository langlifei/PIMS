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
import com.zz.entity.Friends;
import com.zz.entity.User;
import com.zz.service.FriendsService;
import com.zz.util.Universal;

@Controller
public class FriendsController {
	@Autowired
	private FriendsService friendsService;
	
	@RequestMapping("insertFriends")
	public @ResponseBody Map<String,String> insertFriends(@RequestBody Friends friends,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("User");
		friends.setUserId(user.getUserId());//将用户ID存入;
		return Universal.insert(friendsService, friends);
	}
	
	@RequestMapping("showFriends")
	public @ResponseBody Map<String,Object> showFriends(String fName,Integer currentPageNo,HttpServletRequest request){
        int userId = Universal.getUserId(request);
		return Universal.query(friendsService, fName, currentPageNo,userId);
	}
	
	@RequestMapping("deleteFriends")
	public @ResponseBody Map<String,String> deleteFriends(Integer fId)
	{
		return Universal.delete(friendsService,fId);
	}
	
	@RequestMapping("queryFriendsByfName")
	public ModelAndView queryFriendsByfName(String name,Integer currentPageNo)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("fName", name);
		mv.addObject("currentPageNo", currentPageNo);
		mv.setViewName("redirect:showFriends.do");//转交给别的处理请求去处理,避免出现大量重复的代码.
		return mv;
	}
	
	/*
	 * 用于给修改页面传输要修改的数据
	 * */
	@RequestMapping("updateF")
	public ModelAndView updateF()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:jsp/updateFriends.jsp");//转交给修改页面.
		return mv;
	}
	
	@RequestMapping("updateFriends")
	public @ResponseBody Map<String,String> upDateFriends(@RequestBody Friends friends,HttpServletRequest request)
	{
		friends.setUserId(Universal.getUserId(request));
		return Universal.update(friendsService, friends);
	}
}
