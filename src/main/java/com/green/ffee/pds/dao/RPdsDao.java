package com.green.ffee.pds.dao;

import java.util.HashMap;
import java.util.List;

import com.green.ffee.pds.vo.RFilesVo;
import com.green.ffee.pds.vo.RPdsVo;
import com.green.ffee.reg.vo.RBoardFileVo;

public interface RPdsDao {

	List<RPdsVo> getPdsList(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map);

	RPdsVo getPdsView(HashMap<String, Object> map);

	List<RFilesVo> getFileList(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map);

	void setDelete(HashMap<String, Object> map);

	void deleteUploadedFile(HashMap<String, Object> map);
	
	 

}
