package com.zz.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.zz.entity.User;

@Component("userDao")
public interface UserDao {
	public int updatePassword(User user);
	public User getUserByName(String name);
	public int updateUserInfo(@Param("user")User user);
	public int regist(@Param("user")User user);
}
