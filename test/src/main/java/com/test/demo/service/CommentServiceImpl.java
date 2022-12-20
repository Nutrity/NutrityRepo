package com.test.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.demo.model.CommentBoard;
import com.test.demo.model.DietBoard;
import com.test.demo.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentRepository commentRepository; 

	@Override
	public void insert(CommentBoard comment) {		
		commentRepository.save(comment);
	}

	@Override
	public List<CommentBoard> list(DietBoard db) {
		return commentRepository.findByBnum(db.getBnum());
	}

}
