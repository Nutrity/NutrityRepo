package com.test.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
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
		comment.setMember(principal.getUser());
		comment.setDietboard(boardRepository.findById(bnum).get());
		
		commentService.insert(comment);
		return "success";
	}
	
	@GetMapping("list/{bnum}")
	@ResponseBody
	public List<CommentBoard> list(@PathVariable Long bnum){
		DietBoard db = boardRepository.findById(bnum).get();
		List<CommentBoard> clist = commentService.list(db);
		return clist;
	}
	
	@DeleteMapping("delete/{cnum}")
	@ResponseBody
	public Long delete(@PathVariable Long cnum) {
		commentService.delete(cnum);		
		return cnum;
	}

}


















