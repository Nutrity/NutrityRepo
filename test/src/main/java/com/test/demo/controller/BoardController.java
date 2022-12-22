package com.test.demo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.test.demo.config.auth.PrincipalUser;
import com.test.demo.model.DietBoard;
import com.test.demo.model.FoodList;
import com.test.demo.model.SuggestNutrient;
import com.test.demo.repository.FoodRepository;
import com.test.demo.service.BoardService;
import com.test.demo.service.MemberService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private FoodRepository foodRepository;
	
	@Autowired
	private MemberService memberService;

	
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
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("insert")
	@ResponseBody
	public String boardInsert(@RequestBody DietBoard board) {
		SecurityContext context = SecurityContextHolder.getContext();
		PrincipalUser p = (PrincipalUser)context.getAuthentication().getPrincipal();
		board.setMember(p.getUser());
		boardService.dietInsert(board);
		System.out.println(board);
		return "success";
	}
	
	@GetMapping("list")
	public String boardList() {
		return "/dietboard/calendarTest(Anonymous)";
	}
	
	@GetMapping("list/{num}")
	public String boardListAuth() {
		return "/dietboard/calendarTest";
	}
	
	@GetMapping("calendar/{num}")
	@ResponseBody
	public List<DietBoard> boardList(@PathVariable Long num) {
		return boardService.dietLists(num);
	}
	
	@GetMapping("selectfood")		
	public String selectfood(){	
		return "/dietboard/selectfood";
	}
	
	@GetMapping("selectfood/{bnum}")
	@ResponseBody
	public List<FoodList> selectfood(@PathVariable Long bnum){
		DietBoard dboard = boardService.dietDetail(bnum);
			Set<String> foodcode = dboard.getFoodcode();
			Iterator<String> it = foodcode.iterator();
			List<FoodList> fdlist = new ArrayList<>();
			while(it.hasNext()) {
			fdlist.add(foodRepository.findByFoodcode(it.next()));
			}
		return fdlist;
	}
	
	@GetMapping("detail/{bnum}")
	public String boardDetail(@PathVariable Long bnum, Model model) {
		model.addAttribute("board", boardService.dietDetail(bnum));
		return "/dietboard/dietdetail";
	}
	
	@GetMapping("nGraph/{gender}")
	@ResponseBody
	public SuggestNutrient suggestNutrient(@PathVariable String gender) {
		return boardService.findByGender(gender);
	}

	@PutMapping("update/{bnum}")
	@ResponseBody
	public String boardUpdate(@PathVariable Long bnum ,@RequestBody DietBoard board) {
		board.setBnum(bnum);
		boardService.dietUpdate(board);
		return "success";
	}
	
	@DeleteMapping("delete/{bnum}")
	@ResponseBody
	public String boardDelete(@PathVariable Long bnum) {
		boardService.dietDelete(bnum);
		return "success";
	}
	
	@GetMapping("sbmemo/{date}")
	@ResponseBody
	public DietBoard sbmemo(@PathVariable String date) throws ParseException {
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 Date formdate = formatter.parse(date);
		return boardService.findByRegDate(formdate);
	}
	
}
