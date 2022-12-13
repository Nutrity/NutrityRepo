package com.test.demo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class CommentBoard {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cnum;
	private String content;
	private Date c_regdate;
	
	@ManyToOne
	@JoinColumn(name = "num")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "bnum")
	private DietBoard bnum;
}
