package com.test.demo.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.test.demo.model.DietBoard;
import com.test.demo.model.FoodList;
import com.test.demo.model.Member;
import com.test.demo.model.SuggestNutrient;
import com.test.demo.repository.BoardRepository;
import com.test.demo.repository.FoodRepository;
import com.test.demo.repository.MemberRepository;
import com.test.demo.repository.SuggestNutrientRepository;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private FoodRepository foodRepository;
	
	@Autowired
	private SuggestNutrientRepository suggestNutrientRepository;
	
	@Override
	@Transactional
	public void dietInsert(DietBoard board) {
		 boardRepository.save(board);
	}

	@Override
	@Transactional
	public void dietUpdate(DietBoard board) {
		DietBoard b = boardRepository.findById(board.getBnum()).get();
		Set<String> updateSet = b.getFoodcode();
		updateSet.addAll(board.getFoodcode());
		b.setFoodcode(updateSet);
		b.setTitle(board.getTitle());
		b.setMemo(board.getMemo());
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
	public List<FoodList> foodListsDesc(String foodname) {
		return foodRepository.findByFoodnameDesc(foodname);
	}

	@Override
	public List<DietBoard> dietLists(Long num) {
		Optional<Member> member = memberRepository.findById(num);
		return boardRepository.findAllByMember(member);
	}

	@Override
	public List<FoodList> foodList(Long foodcode) {
		boardRepository.findById(foodcode);
		return null;
	}

	@Override
	public SuggestNutrient findByGender(String gender) {
		return suggestNutrientRepository.findByGender(gender);
	}

	@Override
	public DietBoard findByRegDatenMember(Date date, Member member) {
		return boardRepository.findByRegDatenMember(date, member);
	}

	@Override
	public int countByMember(Member member) {
		return boardRepository.countByMember(member);
	}	
}
