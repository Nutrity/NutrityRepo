package com.test.demo.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.demo.model.DietBoard;
import com.test.demo.model.FoodList;
import com.test.demo.model.SelectedFoods;
import com.test.demo.repository.FoodRepository;
import com.test.demo.repository.SelectedFoodsRepository;
import com.test.demo.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private FoodRepository foodRepository;
	
//	@Autowired
//	private SelectedFoodsRepository selectedFoodsRepository;
	
	@GetMapping("foodList")
	@ResponseBody
	public List<FoodList> foodlist(String foodname) {
	//	System.out.println(flist.getFoodname());
		List<FoodList> foodlists = boardService.foodLists(foodname);
		System.out.println(foodlists.size());
		return foodlists;
	}

	@PostMapping("findfoods")
	@ResponseBody
	public List<FoodList> findfoods(@RequestParam(value = "foodArr") String[] foodArr){
//		System.out.println(Arrays.toString(foodArr));
		List<FoodList> fdlist = new ArrayList<>();
		for(int i=0; i <foodArr.length; i++ ) {
			fdlist.add(foodRepository.findByFoodcode(foodArr[i]));
		}
		System.out.println(Arrays.toString(foodArr));
		return fdlist;
	}

	@GetMapping("foodListDesc")
	@ResponseBody
	public List<FoodList> foodlistDesc(String foodname) {
		//	System.out.println(flist.getFoodname());
		List<FoodList> foodlistsDesc = boardService.foodListsDesc(foodname);
		System.out.println(foodlistsDesc.size());
		return foodlistsDesc;
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
	
//	@PostMapping("insertSelectFoods")
//	@ResponseBody
//	public String insertSelectFoods(
//			@RequestParam(value = "fdlistFoodcodes") String[] fdlistFoodcodes) {
//		
//		SelectedFoods sf = new SelectedFoods();
//		for(int i=0; i <fdlistFoodcodes.length; i++ ) {
//			sf.setEx(1);
//			sf.setFoodList(foodRepository.findByFoodcode(fdlistFoodcodes[i]));
//			System.out.println(sf.toString());
//			selectedFoodsRepository.save(sf);
//		}
//		
//		return null;
//	}
	
	@GetMapping("list")
	public String boardList(DietBoard board) {
		return "calendarTest";
	}
	
	@GetMapping("selectfood")
	public String selectfood(){
		return "/dietboard/selectfood";
	}
	
	


}
