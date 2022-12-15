package com.test.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.demo.model.FoodList;
import com.test.demo.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("foodList/{foodname}")
	@ResponseBody
	public String foodlist(@PathVariable String foodname ,Model model) {
		List<FoodList> foodlists = boardService.foodLists(foodname);
		model.addAttribute("foodlist", foodlists);
		return "success";
	}
	
	
	

}
