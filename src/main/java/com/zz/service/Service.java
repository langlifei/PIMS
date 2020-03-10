package com.zz.service;

import java.util.List;

import com.zz.entity.PagingVO;

public interface Service {
	public boolean insert(Object object);
	public List<Object> findByPaging(String fName,PagingVO pagingVO,int userId);
	public int getCount(String object,int userId);
	public boolean update(Object object);
	public boolean delete(int Id);
}
