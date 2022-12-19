package com.test.demo.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "num")
	private Member member;
	
	@OneToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "snum")
	private SuggestNutrient snum;
	
//	@OneToMany(mappedBy = "dietBoard")
//	private List<SelectedFoods> sfoods;
	
    // Basic type
    @ElementCollection(fetch = FetchType.LAZY)
    @Column(name = "foodcode")//String인 경우에 한해서 예외적으로 허용, 이외 타입은 @AttributeOverride를 사용해서 테이블 속성을 재정의한다.
    private Set<String> foodcode = new HashSet<String>();
	
}
