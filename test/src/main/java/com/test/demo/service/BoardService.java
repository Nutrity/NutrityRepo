package com.test.demo.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.test.demo.model.DietBoard;
import com.test.demo.model.FoodList;
import com.test.demo.model.Member;
import com.test.demo.model.SuggestNutrient;

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
	public Page<FoodList> foodLists(String foodname, Pageable pageable);
	
	//음식리스트
	public List<FoodList> foodLists(String foodname);
	//음식리스트(내림차순)
	public List<FoodList> foodListsDesc(String foodname);
	//전체보기(유저 자신의 것)
	public List<DietBoard> dietLists(Long num);
	//음식리스트
	public List<FoodList> foodList(Long foodcode);
	//권장영양소(성별)
	public SuggestNutrient findByGender(String gender);
	
	// 사이드바 간략 표현
	public DietBoard findByRegDate(Date date);
	
	//Member로 count
	public int countByMember(Member member);
	
}
