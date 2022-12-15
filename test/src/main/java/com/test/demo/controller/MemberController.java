package com.test.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.test.demo.model.Member;
import com.test.demo.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@GetMapping("/")
	public String main() {
		return "calender";
	}
	
	@GetMapping("login")
	public String login() {
		return "login";
	}
	
	@GetMapping("join")
	public String join() {
		return "join";
	}
	
	@PostMapping("join")
	public String join(Member member, HttpServletRequest request) {
	 	member.setIp(request.getRemoteAddr());
		mService.join(member);
		return "main";
	}
	
	@GetMapping("modify")
	public String modify() {
		return "modify";
	}
	
	@PutMapping("modify")
	public String modify(Member member) {
		mService.modify(member);
		return "";
	}
	
	@PutMapping("subscribe")
	public String subscribe(Member member) {
		mService.subscribe(member);
		return "";
	}
	
	@Delete("userDelete/{num}")
	public String userDelete(@PathVariable Long num) {
		mService.userDelete(num);
		return "";
	}

}
