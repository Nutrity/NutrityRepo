package com.test.demo.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.DietBoard;
import com.test.demo.model.Member;

public interface BoardRepository extends JpaRepository<DietBoard, Long>{

	List<DietBoard> findAllByMember(Member member);

	void save(Set<String> foodcode);
	
}
