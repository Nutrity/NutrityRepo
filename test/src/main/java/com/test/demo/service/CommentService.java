package com.test.demo.service;

import java.util.List;

import com.test.demo.model.CommentBoard;
import com.test.demo.model.DietBoard;
import com.test.demo.model.Member;

public interface CommentService {
	
	public void insert(CommentBoard comment);
	
	public List<CommentBoard> list(DietBoard db);
	
	public void delete(Long cnum);
	
	public void deleteALL(Member member);

}
