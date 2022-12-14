package com.test.demo.repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.test.demo.model.DietBoard;
import com.test.demo.model.Member;

public interface BoardRepository extends JpaRepository<DietBoard, Long>{

	List<DietBoard> findAllByMember(Optional<Member> member);
	
	int countByMember(Member member);

	void save(Set<String> foodcode);
	
	@Query(value = "select * from diet_board where regdate = ?1 and num=?2", nativeQuery = true)
	DietBoard findByRegDatenMember(Date date, Member member); 
	
	
//	DietBoard findByRegdate(Date regdate);
	

	
}
