package com.test.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.demo.model.Member;
import com.test.demo.service.AdviceService;
import com.test.demo.service.BoardService;
import com.test.demo.service.MemberService;

@Controller
@RequestMapping("/expert/*")
public class AdviceController {
	
	@Autowired
	private AdviceService aService;
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private MemberService mService;
	
	@GetMapping("advicelist")
	public String memlist(Model model) {
		List<Member> subList = aService.sublist();
		ArrayList<Integer> CntBoard = new ArrayList<>();
		for(int i =0; i<subList.size(); i++) {
			int count = bService.countByMember(subList.get(i));
			CntBoard.add(count);
				};
					model.addAttribute("member", subList);
	
					model.addAttribute("cmpBoardCnt", CntBoard);
		
		return "/advice/advicelist";
	}

}
