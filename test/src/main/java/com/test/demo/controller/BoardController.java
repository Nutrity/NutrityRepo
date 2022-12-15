package com.test.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String foodlist(@RequestBody String foodname ,Model model) {
		System.out.println(foodname);
		List<FoodList> foodlists = boardService.foodLists(foodname);
		model.addAttribute("foodlist", foodlists);
		return "success";
	}
	
	


}
