package com.test.demo.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.test.demo.model.Member;
import com.test.demo.repository.MemberRepository;

@Service
public class PrincipalDetails implements UserDetailsService{
	
	@Autowired
	private MemberRepository memberRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member member = memberRepository.findByUsername(username);
		if(member == null) {
			return null;
		}
		PrincipalUser pmember = new PrincipalUser(member);
		System.out.println("pmember : " + pmember);
		return pmember;
	}

}
