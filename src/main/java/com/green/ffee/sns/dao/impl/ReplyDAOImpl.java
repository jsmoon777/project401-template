package com.green.ffee.sns.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.ffee.sns.dao.ReplyDAO;
import com.green.ffee.sns.vo.ReplyVO;

@Repository("replydao")
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private  SqlSession sqlSession;
	
	//댓글조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return sqlSession.selectList("replyMapper.readReply",bno);
	}

	//댓글작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		sqlSession.insert("replyMapper.writeReply",vo);
	}

	//선택된 댓글 조회
	@Override
	public Object selectReply(int rno) {
		return sqlSession.selectOne("replyMapper.selectReply",rno);
	}

	//선택된 댓글 수정
	@Override
	public void updateReply(ReplyVO vo) {
		sqlSession.update("replyMapper.updateReply",vo);
	}

	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO vo) {
		sqlSession.delete("replyMapper.deleteReply",vo);
	}

	

}
