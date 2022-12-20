package com.test.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		String rawPwd = member.getPassword();
		String encPwd = encoder.encode(rawPwd);
		m.setPassword(encPwd);
		m.setUseremail(member.getUseremail());
		m.setAddress(member.getAddress());
		m.setPhone(member.getPhone());
		
	}
	
	public Member detailMember(Long num) {
		return memberRepository.findById(num).get();
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
	public Member findByUsername(String username) {
		
		return memberRepository.findByUsername(username);
	}

	@Override
	public List<Member> findAll() {
		return memberRepository.findAll();
	}

	
	
	
}
