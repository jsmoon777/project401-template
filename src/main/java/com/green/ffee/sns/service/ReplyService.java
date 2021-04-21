package com.green.ffee.sns.service;

import java.util.List;

import com.green.ffee.sns.vo.ReplyVO;

public interface ReplyService {
	
	//댓글 조회 
	public List<ReplyVO> readReply(int bno) throws Exception;
	
	//댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;

	//선택된 댓글 조회
	public Object selectReply(int rno);
	
	//댓글수정
	public void updateReply(ReplyVO vo);

	//댓글 삭제
	public void deleteReply(ReplyVO vo);
	
	
}
