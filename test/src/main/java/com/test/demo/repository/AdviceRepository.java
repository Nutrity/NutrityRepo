package com.test.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.CommentBoard;

public interface AdviceRepository extends JpaRepository<CommentBoard, Long>{
	

	
}
