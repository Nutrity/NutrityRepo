package com.test.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.demo.service.AdviceService;
import com.test.demo.service.MemberService;

@Controller
@RequestMapping("/expert/*")
public class AdviceController {
	
	@Autowired
	private AdviceService aService;
	
	@Autowired
	private MemberService mService;
	
	@GetMapping("advicelist")
	public String memlist(Model model) {
		model.addAttribute("member", aService.sublist());
		return "/advice/advicelist";
	}

}
