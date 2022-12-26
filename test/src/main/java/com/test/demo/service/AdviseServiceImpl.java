package com.test.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.demo.model.Member;
import com.test.demo.repository.MemberRepository;

@Service
public class AdviseServiceImpl implements AdviceService{
		
	@Autowired
	private MemberRepository memberRepository;

	@Override
	public List<Member> sublist() {
		return memberRepository.findByRole();
	}
	

}
