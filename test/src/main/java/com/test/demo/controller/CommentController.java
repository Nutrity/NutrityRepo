package com.test.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.demo.config.auth.PrincipalUser;
import com.test.demo.model.CommentBoard;
import com.test.demo.model.DietBoard;
import com.test.demo.repository.BoardRepository;
import com.test.demo.service.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private BoardRepository boardRepository;
	
	@PostMapping("insert/{bnum}")
	@ResponseBody
	public String insert(@PathVariable Long bnum, @
			RequestBody CommentBoard comment,
			@AuthenticationPrincipal PrincipalUser principal) {
		DietBoard db = boardRepository.findById(bnum).get();
		comment.setDietboard(db);
		comment.setMember(principal.getUser());
		System.out.println("member : " + comment.getMember().toString());
		System.out.println("board : " + comment.getDietboard().toString());
		commentService.insert(comment);
		return "success";
	}
	
	@GetMapping("list/{bnum}")
	@ResponseBody
	public List<CommentBoard> list(@PathVariable Long bnum, CommentBoard comment){
		List<CommentBoard> clist = commentService.list(bnum);
		return clist;
	}

}
