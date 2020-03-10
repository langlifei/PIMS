package com.zz.service;

import com.zz.entity.myFile;

public interface FileService extends Service{
	public boolean deleteFile(int Id,String realPath);
	public boolean updateFileName(myFile file , String realPath);
}
