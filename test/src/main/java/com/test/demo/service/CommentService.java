package com.test.demo.service;

import java.util.List;

import com.test.demo.model.CommentBoard;
import com.test.demo.model.DietBoard;

public interface CommentService {
	
	public void insert(CommentBoard comment);
	
	public List<CommentBoard> list(DietBoard db);
	
	public void delete(Long cnum);

}
