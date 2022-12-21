package com.test.demo.service;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;

import com.test.demo.model.Address;
import com.test.demo.model.Job;
import com.test.demo.model.Member;
import com.test.demo.model.PayInfo;
import com.test.demo.model.Product;

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
	
	//자격 인증 파일 업로드
	public void fileInsert (Job job, Member principal);
	
	//자격인증 요청 리스트
	public List<Member> qualList();
	
	// 결제 정보 저장
	public void savePayInfo(PayInfo payInfo);
	
	// 구독 날짜 계싼
	public void subscribeCheck(Member member);
}
