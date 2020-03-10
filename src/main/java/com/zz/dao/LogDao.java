package com.zz.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.zz.entity.Log;

public interface LogDao {
	public int insertLog(@Param("log") Log log);
	public List<Object> queryLog(@Param(value="logName") String logName, int currentPage,int pageSize,@Param("userId")int userId);
	public int getTotal(@Param(value="logName") String logName,@Param("userId") int userId);
	public int updateLog(@Param("log") Log log);
	public int deleteLogBylogId(int fId);
}
