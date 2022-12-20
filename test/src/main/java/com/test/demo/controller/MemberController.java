package com.test.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.demo.model.Address;
import com.test.demo.model.Member;
import com.test.demo.repository.MemberRepository;
import com.test.demo.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;	
	
	@Autowired
	private MemberRepository mRepository;
		
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
	@ResponseBody
	public String join(@RequestBody Member member, 
//			@RequestParam(name = "useremail") String useremail
//			, @RequestParam(name = "server") String server,
			HttpServletRequest request) {
		if(mRepository.findByUsername(member.getUsername()) != null) {
			return "fail";
		}
				member.setIp(request.getRemoteAddr());	 	
				
//				member.setUseremail(useremail+"@"+server);
				mService.join(member);
				return "success";			 	
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
		System.out.println(member.toString());
		mService.modify(member);
		return "success";
	}
	
	@PutMapping("subscribe")
	public String subscribe(Member member) {
		mService.subscribe(member);
		return "";
	}
	
	@DeleteMapping("userDelete/{num}")
	@ResponseBody
	public String userDelete(@PathVariable Long num) {
		mService.userDelete(num);
		return "success";
	}

}
