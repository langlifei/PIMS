package com.zz.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.zz.entity.Friends;

public interface FriendsDao {
	public int insertFriends(@Param("friends") Friends friends);
	public List<Object> queryFriends(@Param(value="fName") String fName, int currentPage,int pageSize,@Param("userId")int userId);
	public int getTotal(@Param(value="fName") String fName,@Param("userId")int userId);
	public int updateFriends(@Param("friends") Friends friends);
	public int deleteFriendsByfId(int fId);
}
