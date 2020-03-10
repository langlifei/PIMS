package com.zz.service;

import java.util.List;

import com.zz.entity.FinanicialList;
import com.zz.entity.PagingVO;

public interface FinanceService extends Service{
	public List<Object> queryTypes(String tableName);
	public int insertAccounts(String jsonStr ,int userId);
	public List<Object> findByPaging(String beginTime,String endTime,int flag,PagingVO pagingVO,int userId);
	public int getCount(String beginTime,String endTime,int flag,int userId);
}
