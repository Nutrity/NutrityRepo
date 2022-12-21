package com.test.demo.repository;

import java.util.List;

import org.springframework.data.annotation.QueryAnnotation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.test.demo.model.Member;

public interface MemberRepository extends JpaRepository<Member,Long>{
	
	public Member findByUsername(String username);
	
	public Member findByUseremail(String usermail);
	
	@Query(value = "select * from member where qual_name IS NOT NULL AND role = 'ROLE_USER'", nativeQuery = true)
	public List<Member> findRequest();

}
