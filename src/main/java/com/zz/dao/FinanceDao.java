package com.zz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zz.entity.FinanicialList;

public interface FinanceDao {
	
	//查询消费类型
	public List<Object> queryeTypeItem();
	//查询交易方式
	public List<Object> querypTypeItem();
	//插入多条交易记录
	public int insertAccounts(List<FinanicialList> list);
	//查询条数
	public int getCount(@Param("beginTime") String beginTime,@Param("endTime") String endTime,@Param("flag") int flag,@Param("userId") int userId);
	//查询财政记录
	public List<Object> queryFinance(@Param("beginTime") String beginTime,@Param("endTime") String endTime, int currentPage,int pageSize,@Param("flag")int flag,@Param("userId")int userId);
}
