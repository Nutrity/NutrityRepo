package com.test.demo.service;

import java.util.List;

import com.test.demo.model.CommentBoard;

public interface CommentService {
	
	public void insert(CommentBoard comment);
	
	public List<CommentBoard> list(Long bnum);

}
