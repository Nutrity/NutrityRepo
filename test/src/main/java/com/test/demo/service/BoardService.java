package com.test.demo.service;

import java.util.List;

import com.test.demo.model.DietBoard;
import com.test.demo.model.FoodList;

public interface BoardService {

	//추가
	public void dietInsert(DietBoard board);
	//수정
	public void dietUpdate(DietBoard board);
	//삭제
	public void dietDelete(Long bnum);
	//상세보기
	public DietBoard dietDetail(Long bnum);
	//음식리스트
	public List<FoodList> list(String foodname);
	
}