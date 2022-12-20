package com.test.demo.service;

import java.util.List;

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
	
	//회원 찾기
	public Member findByUsername(String username);
	
	//관리자 용 회원 전체 찾기
	public List<Member> findAll();
	
}
