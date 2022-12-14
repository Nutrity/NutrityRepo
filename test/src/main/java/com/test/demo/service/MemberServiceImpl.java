package com.test.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.demo.model.Member;
import com.test.demo.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberRepository memberRepository;
	
	public void join(Member member) {
		memberRepository.save(member);
	}
	
	public void modify(Member member) {
		Member m = memberRepository.findById(member.getNum()).get();
		m.setAddress(member.getAddress());
		m.setPassword("");
		m.setPhone(member.getPhone());
		m.setUseremail(member.getUseremail());
	}
	
	public void subscribe(Member member) {
		Member subscribe = memberRepository.findById(member.getNum()).get();
		subscribe.setSubscribe(1);
	}
	
	public void userDelete(Long num) {
		memberRepository.deleteById(num);
	}

	@Override
	public void unsubscribe(Member member) {
		Member subscribe = memberRepository.findById(member.getNum()).get();
		subscribe.setSubscribe(0);
	}
	
	
	
}
