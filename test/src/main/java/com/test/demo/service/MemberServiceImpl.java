package com.test.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.demo.model.Address;
import com.test.demo.model.Member;
import com.test.demo.repository.MemberRepository;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private BCryptPasswordEncoder encoder;

	@Autowired
	private MemberRepository memberRepository;
	

	
	@Transactional
	public void join(Member member) {
		
		String rawPwd = member.getPassword();
		String encPwd = encoder.encode(rawPwd);
		member.setPassword(encPwd);
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

	@Override
	public Member login(Member member) {
		return memberRepository.findByUsername(member.getUsername());
	}
	
	
	
}
