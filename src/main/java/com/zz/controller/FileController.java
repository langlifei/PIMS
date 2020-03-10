package com.zz.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zz.entity.Friends;
import com.zz.entity.User;
import com.zz.entity.myFile;
import com.zz.service.FileService;
import com.zz.util.Universal;

@Controller
public class FileController {

	@Autowired
	private FileService fileService;
	
	@RequestMapping("uploadFile")
	public @ResponseBody Map<String,Object> uploadFile(@RequestParam("myFile") MultipartFile myFile,HttpServletRequest request) throws IllegalStateException, IOException{
		Map<String,Object> result = new HashMap<String,Object>();
		//获取上传后的地址,/upload表示文件上传后的目标文件夹;
		String realPath = Universal.getUserPath(request);
		//获取文件名;
		String fileName = myFile.getOriginalFilename();
		/*//获取文件后缀名;
		String extensionName = fileName.substring(fileName.lastIndexOf(".")+1);
		//给上传的文件起别名
		String newFileName = String.valueOf(System.currentTimeMillis())+"."+extensionName;*/
		//创建file对象,传入目标路径参数,和新的文件别名
		File dir = new File(realPath,fileName);
		if(!dir.exists()){
			dir.mkdirs();//创建多级目录;
			myFile.transferTo(dir);//将文件上传到服务器指定文件夹
			result.put("message","上传成功!");
		}else{
			result.put("message", "文件已存在,无需重复上传");
		}
		return result;
	}
	
	@RequestMapping("submitFile")
	public @ResponseBody Map<String,String> submitFile(@RequestBody myFile file,HttpServletRequest request){
		file.setUserId(Universal.getUserId(request));//获取用户ID;
		return Universal.insert(fileService, file);
	}
	
	
	@RequestMapping("showFiles")
	public @ResponseBody Map<String,Object> showFile(String fName,Integer currentPageNo,HttpServletRequest request){
        int userId = Universal.getUserId(request);
		return Universal.query(fileService, fName, currentPageNo,userId);
	}
	
	@RequestMapping("queryFileByfName")
	public ModelAndView queryFileByfName(String name,Integer currentPageNo)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("fName", name);
		mv.addObject("currentPageNo", currentPageNo);
		mv.setViewName("redirect:showFiles.do");//转交给别的处理请求去处理,避免出现大量重复的代码.
		return mv;
	}
	
	@RequestMapping("deleteFile")
	public @ResponseBody Map<String,String> deleteFile(Integer fId,HttpServletRequest request)
	{
		String realPath = Universal.getUserPath(request);
		if(fileService.deleteFile(fId, realPath))
			return Universal.delete(fileService, fId);
		else
			return Universal.returnString("该文件不存在!");
	}
	
	@RequestMapping("translateInfoToUpdate")
	public ModelAndView transInfoToUpdate()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:jsp/updateFile.jsp");//转交给修改页面.
		return mv;
	}
	
	@RequestMapping("updateFile")
	public @ResponseBody Map<String,String> upDateFile(@RequestBody myFile file,HttpServletRequest request)
	{
		file.setUserId(Universal.getUserId(request));
		String realPath = Universal.getUserPath(request);
		if(fileService.updateFileName(file,realPath))//修改文件名成功后,修改数据库.
			return Universal.update(fileService, file);
		else
			return Universal.returnString("该文件名已存在!");
	}
	
	@RequestMapping("downloadFile")
	public void downloadFile(String fName,HttpServletRequest request,HttpServletResponse response) throws IOException{
		String realPath = Universal.getUserPath(request);
		File file = new File(realPath,fName);
		if(!file.exists())
			return;
		else{
			//标识为下载,弹出框为文件名
			response.setHeader("content-disposition", "attachment;filename="+URLEncoder.encode(fName,"UTF-8"));
			response.setContentType("multipart/form-data");//标识为下载文件类型
			//读取要下载的文件,保存到文件输入流
			FileInputStream in = new FileInputStream(file);
			OutputStream out = response.getOutputStream();//获取输出流
			byte buffer[] =  new byte[1024];//缓冲区
			int len=0;
			while((len=in.read(buffer))>0){//一边读,一边写,长度为len
				out.write(buffer,0,len);
			}
			in.close();//关闭文件输入流
			out.close();//关闭文件输出流
		}
	}
	
}
