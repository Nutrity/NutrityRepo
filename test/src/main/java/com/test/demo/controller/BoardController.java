package com.test.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.demo.model.DietBoard;
import com.test.demo.model.FoodList;
import com.test.demo.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("foodList")
	@ResponseBody
	public List<FoodList> foodlist(String foodname ,Model model) {
	//	System.out.println(flist.getFoodname());
		List<FoodList> foodlists = boardService.foodLists(foodname);
		System.out.println(foodlists.size());
		return foodlists;
	}
	
	@GetMapping("insert")
	public String boardInsert() {
		return "/dietboard/dietinsert";
	}
	
	@PostMapping("insert")
	@ResponseBody
	public String boardInsert(@RequestBody DietBoard board) {
		boardService.dietInsert(board);
		return "success";
	}
	
	@GetMapping("list")
	public String boardList(DietBoard board) {
		
		return "calendarTest";
	}
	
	@GetMapping("selectfood")
	public String selectfood(){
		return "/dietboard/selectfood";
	}
	
	


}
