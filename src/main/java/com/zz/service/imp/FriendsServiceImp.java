package com.zz.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zz.dao.FriendsDao;
import com.zz.entity.Friends;
import com.zz.entity.PagingVO;
import com.zz.service.FriendsService;

@Service
public class FriendsServiceImp implements FriendsService{

	@Autowired
	private FriendsDao friendsDao;

	@Override
	public boolean insert(Object object) {
		Friends friends = (Friends)object;
		if(friendsDao.insertFriends(friends)==1)
			return true;
		else
			return false;
	}
	
	@Override
	public List<Object> findByPaging(String fName,PagingVO pagingVO,int userId) {
		int begin = (pagingVO.getCurrentPageNo()-1)*pagingVO.getPageSize();
		int end = pagingVO.getPageSize();
		return friendsDao.queryFriends(fName,begin,end,userId);
	}

	@Override
	public boolean update(Object object) {
		Friends friends = (Friends)object;
		if(friendsDao.updateFriends(friends) == 1)
			return true;
		else
			return false;
	}

	@Override
	public boolean delete(int fId) {
		if(friendsDao.deleteFriendsByfId(fId) == 1)
			return true;
		else
			return false;
	}

	@Override
	public int getCount(String fName,int userId) {
		return friendsDao.getTotal(fName,userId);
	}
}
