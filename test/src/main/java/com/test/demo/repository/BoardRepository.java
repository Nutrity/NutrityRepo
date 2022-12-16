package com.test.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.DietBoard;

public interface BoardRepository extends JpaRepository<DietBoard, Long>{

	List<DietBoard> findByMember(Long num);
	
}
