package com.test.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.test.demo.config.auth.PrincipalUser;
import com.test.demo.model.Job;
import com.test.demo.model.Member;
import com.test.demo.model.PayInfo;
import com.test.demo.model.Product;
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

	@GetMapping("qualify")
	public void qualify() {
	}
	
	@PostMapping("qual")
	public String qualify(Job job) {
		SecurityContext context = SecurityContextHolder.getContext();
		PrincipalUser p = (PrincipalUser)context.getAuthentication().getPrincipal();
		Member principal = (Member)p.getUser();
		mService.fileInsert(job, principal);
		return "redirect:/";
	}
		
	@GetMapping("pay")
	public String pay() {
		return "member/payplan";
	}
	
	@PostMapping("pay/{num}")
	@ResponseBody
	public String pay(@PathVariable Long num, @RequestBody Product product) {
		PayInfo payInfo = new PayInfo();
		payInfo.setMember(mRepository.findById(num).get());
		payInfo.setProduct(product);
		mService.savePayInfo(payInfo);
		return "success";
	}
	
	
	@RequestMapping("subcheck")
	public String subcheck() {
		SecurityContext context = SecurityContextHolder.getContext();
		PrincipalUser p = (PrincipalUser)context.getAuthentication().getPrincipal();
		
		//Member principal = (Member)p.getUser();
//		mService.subscribeCheck(p);
		//System.out.println("plistm : "+ principal);
		return"redirect:/";
	}

	
}
