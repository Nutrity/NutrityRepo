package com.test.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.demo.model.Member;
import com.test.demo.service.AdviceService;
import com.test.demo.service.BoardService;

@Controller
@RequestMapping("/expert/*")
public class AdviceController {

	@Autowired
	private AdviceService aService;

	@Autowired
	private BoardService bService;

	@GetMapping("submemberlist")
	public String memlist(Model model) {
		List<Member> subList = aService.sublist();
		
		ArrayList<Integer> CntBoard = new ArrayList<>();
		for (int i = 0; i < subList.size(); i++) {
			int count = bService.countByMember(subList.get(i));
			CntBoard.add(count);
		}
		;
		model.addAttribute("member", subList);

		model.addAttribute("cmpBoardCnt", CntBoard);

		return "/advice/submemberlist";
	}

	@GetMapping("adviceList/{num}")
	public String advicelist(@PathVariable Long num, Model model) {
		model.addAttribute("board", bService.dietLists(num));
		return "/advice/adviceList";
	}

}
