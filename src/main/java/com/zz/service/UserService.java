package com.zz.service;

import com.zz.entity.User;

public interface UserService{

	public User login(User user);
	public boolean updatePassword(String newPassword,User pastUser);
	public boolean updateUserInfo(User user);
	public boolean isRepeatUserName(String userName);
	public boolean regist(User user);
}
