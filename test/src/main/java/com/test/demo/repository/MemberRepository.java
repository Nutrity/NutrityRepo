package com.test.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.Member;

public interface MemberRepository extends JpaRepository<Member,Long>{
	
	public Member findByUsername(String username);
	
	public Member findByUseremail(String usermail);

}
