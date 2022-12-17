package com.test.demo.service;

import com.test.demo.model.Address;
import com.test.demo.model.Member;

public interface MemberService {
	
	//회원가입
	public void join(Member member);
	
	//회원수정 
	public void modify(Member member);
	
	//구독 추가
	public void subscribe(Member member);
	
	//구독 삭제
	public void unsubscribe(Member member);
	
	//회원 탈퇴
	public void userDelete(Long num);
	
	//로그인 
	public Member login(Member member);
	

}
