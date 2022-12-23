package com.test.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.demo.model.CommentBoard;
import com.test.demo.model.Member;
import com.test.demo.repository.AdviceRepository;
import com.test.demo.repository.MemberRepository;

@Service
public class AdviseServiceImpl implements AdviceService{
	
	@Autowired
	private AdviceRepository adviceRepository;
	
	@Autowired
	private MemberRepository memberRepository;

	@Override
	public void adviceInsert(CommentBoard advice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void adviceUpdate(CommentBoard advice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void adviceDelete(Long cnum) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CommentBoard> adviceList(CommentBoard advice) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> sublist() {
		return memberRepository.findByRole();
	}
	
	

}
