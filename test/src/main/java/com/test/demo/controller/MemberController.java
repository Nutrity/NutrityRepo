package com.test.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public void calendar() {
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
	 	System.out.println(address2+ ", " + address1 + ", " + zipcode);
		mService.join(member, addr);
		return "redirect:/";
	}
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("login")
	public String login(Member member, HttpSession session) {
		session.setAttribute("member", mService.login(member));
		return "calendarTest";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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
