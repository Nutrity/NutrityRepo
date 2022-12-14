package com.test.demo.service;

import java.util.List;

import com.test.demo.model.Job;
import com.test.demo.model.Member;
import com.test.demo.model.PayInfo;

public interface MemberService {
	
	//회원가입
	public void join(Member member);
	
	//회원수정 
	public void modify(Member member);
		
	
	//회원 탈퇴
	public void userDelete(Long num);
	
	//회원 찾기
	public Member findByUsername(String username);
	
	//관리자 용 회원 전체 찾기
	public List<Member> findAll();
	
	// 관리자 용 회원 수정
	public void userUpdate(Member member);
	
	//자격 인증 파일 업로드
	public void fileInsert (Job job, Member principal);
	
	//자격인증 요청 리스트
	public List<Member> qualList();
	
	// 전문가 권한 부여
	public void modiRole(Long num);
	
	// 결제 정보 저장
	public void savePayInfo(PayInfo payInfo);
	
	//구독 만료 확인
	public void subcheck(Member principal);
	
	//자격 요청 거절 
	public void delQualName(Long num);
	
	//멤버 찾기
	public Member detailMember(Long num);
	
}
