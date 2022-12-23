package com.test.demo.service;

import java.util.List;

import com.test.demo.model.CommentBoard;
import com.test.demo.model.Member;

public interface AdviceService {
	
	//추가
	public void adviceInsert(CommentBoard advice);
	//수정
	public void adviceUpdate(CommentBoard advice);
	//삭제
	public void adviceDelete(Long cnum);
	//전체보기(bnum에 대한)
	public List<CommentBoard> adviceList(CommentBoard advice);
	//전체보기(전문가 자신이 쓴글
	
	// 구독자 목록
	public List<Member> sublist();
	
}
