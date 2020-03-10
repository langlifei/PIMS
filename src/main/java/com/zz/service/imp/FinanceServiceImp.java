package com.zz.service.imp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zz.dao.FinanceDao;
import com.zz.entity.Etype;
import com.zz.entity.FinanicialList;
import com.zz.entity.PagingVO;
import com.zz.entity.Ptype;
import com.zz.service.FinanceService;
import com.zz.util.JsonUtil;

@Service
public class FinanceServiceImp implements FinanceService{

	@Autowired
	private FinanceDao financeDao;
	
	@Override
	public boolean insert(Object object) {
		return false;
	}

	@Override
	public List<Object> findByPaging(String dateTime, PagingVO pagingVO,int userId) {
		//第一个字符为1表示查询收入,0表示查询消费记录,2表示查询所有;
		/*String date = dateTime.substring(1);//截取真的日期;
		int flag = Integer.parseInt(dateTime.substring(0, 1));
		int begin = (pagingVO.getCurrentPageNo()-1)*pagingVO.getPageSize();
		int end = pagingVO.getPageSize();
		return financeDao.queryFinance(date,begin,end,flag,userId);*/
		return null;
	}

	@Override
	public int getCount(String dateTime,int userId) {
		//第一个字符为1表示查询收入,0表示查询消费记录,2表示查询所有;
		return 0;
	}

	@Override
	public boolean update(Object friends) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int Id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Object> queryTypes(String tName) {
		if(tName.equals("eType"))
			return financeDao.queryeTypeItem();
		else if(tName.equals("pType"))
			return financeDao.querypTypeItem();
		else
			return null;
	}

	@Override
	public int insertAccounts(String jsonStr, int userId) {
				//存储需要insert的账单信息
				List<FinanicialList> fList = new ArrayList<FinanicialList>();//存放对象的数组；
				FinanicialList finanicialList = null;
				Ptype pType = null;
				Etype eType = null;
				JSONArray jsonArray = JsonUtil.parseArray(jsonStr);//转换字符窜为json对象数组
				for(Object obj:jsonArray){
					JSONObject jObj = (JSONObject)obj;//将json对象转换为javaBean对象
					finanicialList = new FinanicialList();
					finanicialList.setAmount(jObj.getDoubleValue("amount"));
					finanicialList.setNotes(jObj.getString("notes"));
					finanicialList.setDateTime(jObj.getDate("dateTime"));
					pType = new Ptype();
					eType = new Etype();
					if(jObj.getInteger("IncomeOrExpense")==1)//收入为1；支出为0
					{
						finanicialList.setIncomeOrExpense(true);
					}else{
						finanicialList.setIncomeOrExpense(false);
					}
					JSONObject e = jObj.getJSONObject("eType");
					JSONObject p = jObj.getJSONObject("pType");
					eType.setId(e.getInteger("id"));
					eType.setName(e.getString("name"));
					pType.setId(p.getInteger("id"));
					pType.setName(p.getString("name"));
					finanicialList.setpType(pType);
					finanicialList.seteType(eType);
					finanicialList.setUserId(userId);
					fList.add(finanicialList);
				}
				return financeDao.insertAccounts(fList);
	}

	@Override
	public List<Object> findByPaging(String beginTime, String endTime,
			int flag, PagingVO pagingVO, int userId) {
		// TODO Auto-generated method stub
		int begin = (pagingVO.getCurrentPageNo()-1)*pagingVO.getPageSize();
		int end = pagingVO.getPageSize();
		//将截止日期的所有记录显示出来
		if(beginTime == null || beginTime =="")//如果没有开始时间，就是默认初始时间
			beginTime="1970-01-01";
		if(endTime == null || endTime =="")//如果没有截止时间那么就是当前时间
			endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString();
		//将截止日期的所有记录显示出来
		if(endTime != null || endTime != "")
			endTime+=" 23:59:59";
		return financeDao.queryFinance(beginTime,endTime,begin,end,flag,userId);
	}

	@Override
	public int getCount(String beginTime, String endTime, int flag, int userId) {
		//将截止日期的所有记录显示出来
		if(beginTime == null || beginTime =="")//如果没有开始时间，就是默认初始时间
			beginTime="1970-01-01";
		if(endTime == null || endTime =="")//如果没有截止时间那么就是当前时间
			endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString();
		if(endTime != null || endTime != "")
			endTime+=" 23:59:59";
		return financeDao.getCount(beginTime, endTime, flag, userId);
	}
}
