package com.test.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.demo.model.CommentBoard;
import com.test.demo.repository.AdviceRepository;

@Service
public class AdviseServiceImpl implements AdviceService{
	
	@Autowired
	private AdviceRepository adviceRepository;

	@Override
	public void adviceInsert(CommentBoard advice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void adviceUpdate(CommentBoard advice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void adviceDelete(Long cnum) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CommentBoard> adviceList(CommentBoard advice) {
		// TODO Auto-generated method stub
		return null;
	}

}
