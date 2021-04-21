package com.green.ffee.sns.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.ffee.sns.dao.ReplyDAO;
import com.green.ffee.sns.dao.SnsDao;
import com.green.ffee.sns.service.ReplyService;
import com.green.ffee.sns.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private   ReplyDAO  replydao;
	
	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return replydao.readReply(bno);
	}

	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		replydao.writeReply(vo);
	}

	//댓글 조회
	@Override
	public Object selectReply(int rno) {
		return replydao.selectReply(rno);
	}

	// 댓글 수정
	@Override
	public void updateReply(ReplyVO vo) {
		replydao.updateReply(vo);
	}

	//댓글삭제
	@Override
	public void deleteReply(ReplyVO vo) {
		replydao.deleteReply(vo);
	}
	

}
