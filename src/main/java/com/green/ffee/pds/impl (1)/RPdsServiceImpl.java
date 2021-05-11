package com.green.ffee.pds.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.pds.dao.RPdsDao;
import com.green.ffee.pds.service.RPdsService;
import com.green.ffee.pds.vo.RFilesVo;
import com.green.ffee.pds.vo.RPdsVo;
import com.green.ffee.reg.vo.RBoardFileVo;

@Service("pdsServices")
public class RPdsServiceImpl implements RPdsService {

	@Autowired
	private  RPdsDao pdsDao;

	@Override
	public List<RPdsVo> getPdsList(HashMap<String, Object> map) {
		List<RPdsVo> pdsList = pdsDao.getPdsList( map );
		return   pdsList;
	}

	@Override
	public void setWrite(HashMap<String, Object> map,
			HttpServletRequest request) {

		//System.out.println("service1 map:" + map);
		
		// db 와 관련없는 로직처리 - 비지니스 로직
		// 1. request 처리  - 넘어온 파일을 처리
	    RPdsFile.save(map, request);
		
	    //	System.out.println("service2 map:" + map);
		
		// 2. 넘어온 정보 db 저장
		pdsDao.setWrite(map); 
		
	}

	@Override
	public RPdsVo getPdsView(HashMap<String, Object> map) {
		
		RPdsVo   pdsVo   =  pdsDao.getPdsView(  map  );
				
		return  pdsVo;
	}

	@Override
	public List<RFilesVo> getFileList(HashMap<String, Object> map) {
		
		List<RFilesVo> filesList  =  pdsDao.getFileList( map ); 
		System.out.println("service" + filesList);
		return   filesList;
	}
	
	@Override
	public void setDelete(HashMap<String, Object> map) {
		
		pdsDao.setDelete( map );
		
	}

	@Override
	public void setUpdate(HashMap<String, Object> map, 
			HttpServletRequest request) {
		// 수정파일처리 : request ( file )
		RPdsFile.save(map, request);
		
		// 수정정보처리 : map
		pdsDao.setUpdate(map);
		
	}

	@Override
	public void deleteUploadedFile(HashMap<String, Object> map) {
		
		// 1. c:\\upload\\ foleder에서 필요한 파일 삭제
		String  sfilename = (String) map.get("sfilename");
		String  filePath = "c:\\upload\\";
		String  fileName = sfilename;
		File  file = new File(filePath + fileName);	
		if(file.exists())
			file.delete();
		
		// 2. Files table 에서 file_num 에 해당되는 file 목록 삭제
		pdsDao.deleteUploadedFile( map );
		
	}
	
}















