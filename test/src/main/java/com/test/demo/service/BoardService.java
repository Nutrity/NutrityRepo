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
	public List<FoodList> foodLists(String foodname);
	//음식리스트(내림차순)
	public List<FoodList> foodListsDesc(String foodname);
	//전체보기(유저 자신의 것)
	public List<DietBoard> dietLists(Long num);
	
	//음식리스트
	public List<FoodList> foodList(Long foodcode);
}
