package com.test.demo.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity
public class CommentBoard {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cnum;
	private String content;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date c_regdate;
	 
	@ManyToOne
	@JoinColumn(name = "num")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "bnum")
	@JsonIgnore
	private DietBoard dietboard;
}
