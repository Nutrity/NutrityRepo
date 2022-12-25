package com.test.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.test.demo.model.CommentBoard;
import com.test.demo.model.Member;


public interface CommentRepository extends JpaRepository<CommentBoard, Long>{
	
	@Query("select sc from CommentBoard sc where bnum = ?1")
	List<CommentBoard> findByBnum(Long bnum);
	
	void deleteAllByMember(Member member);

}
