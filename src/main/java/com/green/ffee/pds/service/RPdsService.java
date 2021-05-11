package com.green.ffee.pds.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.ffee.pds.vo.RFilesVo;
import com.green.ffee.pds.vo.RPdsVo;
import com.green.ffee.reg.vo.RBoardFileVo;

public interface RPdsService {

	List<RPdsVo> getPdsList(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map, HttpServletRequest request);

	RPdsVo getPdsView(HashMap<String, Object> map);

	List<RFilesVo> getFileList(HashMap<String, Object> map);

	void setDelete(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void deleteUploadedFile(HashMap<String, Object> map);



}
