package com.test.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.demo.model.Job;
import com.test.demo.model.Member;
import com.test.demo.repository.MemberRepository;
import com.test.demo.service.BoardService;
import com.test.demo.service.MemberService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private BoardService bService;

	@Autowired
	private MemberService mService;
	
	@Autowired
	private MemberRepository mRepository;
	
	@GetMapping("memlist")
	public String memlist(Model model) {
		model.addAttribute("member", mService.findAll());
		System.out.println(mService.findAll().toString());
		return "/admin/memlist";
	}
	
	@GetMapping("requestQual")
	public String quelList(Model model) {
		model.addAttribute("request", mService.qualList());
		return "/admin/requestqual";
	}
	
	@DeleteMapping("deleteuser/{num}")
	@ResponseBody
	public String deleteuser(@PathVariable Long num) {
		mService.userDelete(num);
		return "success";
	}
	
	@PutMapping("updateuser/{num}")
	@ResponseBody
	public String updateuser(@PathVariable Long num ,@RequestBody Job job) {
		Member member = new Member();
		member.setNum(num);
		member.setJob(job);
		mService.userUpdate(member);
		
		return "success";
	}
	
	@PutMapping("modiRole/{num}")
	@ResponseBody
	public String modiRole(@PathVariable Long num) {
		mService.modiRole(num);
		Member m = mRepository.findById(num).get();
		return m.getJob().getRole();
	}
	
	@PutMapping("rejectRequest/{num}")
	@ResponseBody
	public String rejectRequest(@PathVariable Long num) {
		mService.delQualName(num);
		return "success";
	}
	
}
