package com.test.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	


}
