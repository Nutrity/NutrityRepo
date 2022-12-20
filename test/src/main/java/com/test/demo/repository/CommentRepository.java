package com.test.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.CommentBoard;
import com.test.demo.model.DietBoard;

public interface CommentRepository extends JpaRepository<CommentBoard, Long>{
	
	List<CommentBoard> findByDietBoard(DietBoard dietBoard);

}
