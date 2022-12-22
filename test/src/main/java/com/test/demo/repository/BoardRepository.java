package com.test.demo.repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.DietBoard;
import com.test.demo.model.Member;

public interface BoardRepository extends JpaRepository<DietBoard, Long>{

	List<DietBoard> findAllByMember(Optional<Member> member);

	void save(Set<String> foodcode);
	
	DietBoard findByRegdate(Date regdate);
	
}
