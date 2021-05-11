package com.green.ffee.pds.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.ffee.pds.dao.RPdsDao;
import com.green.ffee.pds.vo.RFilesVo;
import com.green.ffee.pds.vo.RPdsVo;
import com.green.ffee.reg.vo.RBoardFileVo;

@Repository("pdsDao")
public class RPdsDaoImpl  implements RPdsDao {
	
	@Autowired
	private SqlSession  sqlSession;
	
	@Override
	public List<RPdsVo> getPdsList(HashMap<String, Object> map) {
		sqlSession.selectList("PDS.PdsList", map);
		
		List<RPdsVo> pdsList = (List<RPdsVo>) map.get("result");
		
		return pdsList;
	}

	@Override
	public void setWrite(HashMap<String, Object> map) {

		//System.out.println("dao1 map:" + map);
		
		sqlSession.insert("PDS.PdsWrite", map);
		
	}

	@Override
	public RPdsVo getPdsView(HashMap<String, Object> map) {
		
		// PdsVo pdsVo = sqlSession.selectOne( map ); 
		  // mapper.xml
		  // <select>SELECT * FROM MBOARD WHERE IDX= 1</select>
		
		// CURSOR 사용시
		sqlSession.selectList( "PDS.PdsView", map );
		
		List<RPdsVo> pdsList = (List<RPdsVo>) map.get("result");
		RPdsVo       pdsVo   = pdsList.get(0); 
		
		return   pdsVo;
	}

	@Override
	public List<RFilesVo> getFileList(HashMap<String, Object> map) {
		
		sqlSession.selectList("PDS.FileList", map);
		
		List<RFilesVo>  filesList = (List<RFilesVo>) map.get("result");
		System.out.println("dao" + filesList);
		return      filesList;
	}

	@Override
	public void setUpdate(HashMap<String, Object> map) {
		
		System.out.println("setupdate():" + map);
		sqlSession.update("PDS.PdsUpdate", map);
		
	}

	@Override
	public void setDelete(HashMap<String, Object> map) {
		
		sqlSession.delete("PDS.PdsDelete", map);
		
	}

	@Override
	public void deleteUploadedFile(HashMap<String, Object> map) {
		
		sqlSession.delete("PDS.PdsUpFileDelete", map);
		
	}


}










