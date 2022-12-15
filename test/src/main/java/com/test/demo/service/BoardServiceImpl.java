package com.test.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.demo.model.DietBoard;
import com.test.demo.model.FoodList;
import com.test.demo.repository.BoardRepository;
import com.test.demo.repository.FoodRepository;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private FoodRepository foodRepository;

	@Override
	public void dietInsert(DietBoard board) {
		boardRepository.save(board);
	}

	@Override
	public void dietUpdate(DietBoard board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void dietDelete(Long bnum) {
		boardRepository.deleteById(bnum);
	}

	@Override
	public DietBoard dietDetail(Long bnum) {
		return boardRepository.findById(bnum).get();
	}

	@Override
	public List<FoodList> foodLists(String foodname) {
		
		return foodRepository.findByFoodname(foodname);
	}

	@Override
	public List<DietBoard> dietLists(DietBoard board) {
	boardRepository.findByNum(board.getMember().getNum());
		return null;
	}

}
