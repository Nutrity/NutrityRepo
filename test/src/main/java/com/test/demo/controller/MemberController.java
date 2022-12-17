package com.test.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.demo.model.Address;
import com.test.demo.model.Member;
import com.test.demo.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@GetMapping("/")
	public String main() {
		return "home";
	}
	
	@GetMapping("calendar")
	public String calendar() {
		return "calendarTest";
	}
		
	@GetMapping("join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("join")
	public String join(Member member,String zipcode, 
		String address1, String address2, HttpServletRequest request) {
	 	member.setIp(request.getRemoteAddr());	 	
	 	Address addr = new Address();
	 	addr.setAddress2(address2);
	 	addr.setAddress1(address1);
	 	addr.setZipcode(zipcode);	 	
		mService.join(member,addr);
		return "redirect:/";
	}
	
	@GetMapping("login")
	public String login() {
		return "/member/login";
	}
			
	@GetMapping("modify")
	public String modify() {
		return "/member/update";
	}
	
	@PutMapping("modify")
	@ResponseBody
	public String modify(@RequestBody Member member) {
		mService.modify(member);
		return "success";
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
