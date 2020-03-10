package com.zz.service.imp;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zz.dao.FileDao;
import com.zz.entity.Friends;
import com.zz.entity.PagingVO;
import com.zz.entity.User;
import com.zz.entity.myFile;
import com.zz.service.FileService;

@Service
public class FileServiceImp implements FileService{
	
	@Autowired
	private FileDao fileDao;

	@Override
	public boolean insert(Object object) {
		myFile file = (myFile)object;
		if(fileDao.insertFile(file)==1)
			return true;
		else
			return false;
	}

	@Override
	public List<Object> findByPaging(String fName, PagingVO pagingVO, int userId) {
		int begin = (pagingVO.getCurrentPageNo()-1)*pagingVO.getPageSize();
		int end = pagingVO.getPageSize();
		return fileDao.queryFiles(fName,begin,end,userId);
	}

	@Override
	public int getCount(String object, int userId) {
		return fileDao.getCount(object,userId);
	}

	@Override
	public boolean update(Object object) {
		myFile file = (myFile)object;
		if(fileDao.updateFile(file) == 1)
			return true;
		else
			return false;
	}

	@Override
	public boolean delete(int Id) {
		if(fileDao.delete(Id)==1)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteFile(int Id, String realPath) {
		String fName = fileDao.queryfNameByfId(Id);
		if(fName==null)
			return false;
		File file = new File(realPath,fName);
		if(file.exists())
		{
			return file.delete();
		}else
			return false;
	}

	@Override
	public boolean updateFileName(myFile myFile, String realPath) {
		String pastName = fileDao.queryfNameByfId(myFile.getfId());
		File file = new File(realPath,pastName);//获取原文件的对象;
		if(file.renameTo(new File(realPath,myFile.getfName())))//对文件进行重命名
			return true;
		else
			return false;
	}

}
