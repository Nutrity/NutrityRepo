package com.test.demo.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Entity
public class DietBoard {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long bnum;
	private String memo;
	private String title;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date regdate;
	
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date updatedate;
	
	@ManyToOne
	@JoinColumn(name = "num")
	private Member member;
	
	@OneToOne
	@JoinColumn(name = "snum")
	private SuggestNutrient snum;
	
	@OneToMany(mappedBy = "dietBoard")
	private List<SelectedFoods> sfoods;
	
	
	
}
