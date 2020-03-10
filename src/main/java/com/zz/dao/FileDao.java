package com.zz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zz.entity.myFile;

public interface FileDao {

	public int insertFile(@Param("file")myFile file);
	public int getCount(@Param("fName")String fName,@Param("userId")int userId);
	public List<Object> queryFiles(@Param(value="fName") String fName, int currentPage,int pageSize,@Param("userId")int userId);
	public String queryfNameByfId(@Param("fId")int id);
	public int updateFile(@Param("file")myFile file);
	public int delete(@Param("fId")int id);
}
