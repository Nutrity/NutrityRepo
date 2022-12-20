package com.test.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.demo.model.Member;
import com.test.demo.service.BoardService;
import com.test.demo.service.MemberService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private BoardService bService;

	@Autowired
	private MemberService mService;
	
	@GetMapping("memlist")
	public String memlist(Model model) {
		model.addAttribute("member", mService.findAll());
		System.out.println(mService.findAll().toString());
		return "/admin/memlist";
	}
	
}