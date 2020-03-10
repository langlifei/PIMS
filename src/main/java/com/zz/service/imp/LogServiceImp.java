package com.zz.service.imp;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zz.dao.LogDao;
import com.zz.entity.Log;
import com.zz.entity.PagingVO;
import com.zz.service.LogService;

@Service
public class LogServiceImp implements LogService{

	@Autowired
	private LogDao logDao;

	@Override
	public boolean insert(Object object) {
		Log log = (Log)object;
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		log.setDateTime(df.format(date));
		if(logDao.insertLog(log)==1)
			return true;
		else
			return false;
	}
	
	@Override
	public List<Object> findByPaging(String logName,PagingVO pagingVO,int userId) {
		int begin = (pagingVO.getCurrentPageNo()-1)*pagingVO.getPageSize();
		int end = pagingVO.getPageSize();
		return logDao.queryLog(logName,begin,end,userId);
	}

	@Override
	public boolean update(Object object) {
		Log log = (Log)object;
		if(logDao.updateLog(log) == 1)
			return true;
		else
			return false;
	}

	@Override
	public boolean delete(int logId) {
		if(logDao.deleteLogBylogId(logId) == 1)
			return true;
		else
			return false;
	}

	@Override
	public int getCount(String logName,int userId) {
		return logDao.getTotal(logName,userId);
	}
}
