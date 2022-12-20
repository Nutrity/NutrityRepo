package com.test.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.CommentBoard;

public interface CommentRepository extends JpaRepository<CommentBoard, Long>{
	
	List<CommentBoard> findByBnum(Long bnum);

}
