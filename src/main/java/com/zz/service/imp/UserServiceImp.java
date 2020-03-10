package com.zz.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zz.dao.UserDao;
import com.zz.entity.User;
import com.zz.service.UserService;

@Service
public class UserServiceImp implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public User login(User user) {
		User newUser = userDao.getUserByName(user.getUserName());
		if(newUser == null)
			return null;
		if(newUser.getPassword().equals(user.getPassword()))
		{
			return newUser;
		}else
			return user;
	}

	@Override
	public boolean updatePassword(String newPassword,User pastUser) {
		if(pastUser!=null)
		{
			if(pastUser.getPassword().equals(newPassword))
				return true;
			else{
				pastUser.setPassword(newPassword);
			}
			if(userDao.updatePassword(pastUser)==1)
				return true;
			else
				return false;
		}
		return false;
	}

	@Override
	public boolean updateUserInfo(User user) {
		if(userDao.updateUserInfo(user)==1)
			return true;
		else
			return false;
	}

	@Override
	public boolean isRepeatUserName(String userName) {
		// TODO Auto-generated method stub
		User user = userDao.getUserByName(userName);
		if(user != null)
			return true;
		else
			return false;
	}

	@Override
	public boolean regist(User user) {
		if(userDao.regist(user)==1)
			return true;
		else
			return false;
	}
}
