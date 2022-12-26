package com.test.demo.model;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
@Entity
@DynamicInsert
public class Member {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY )
	private Long num;
	private String useremail;
	private String username;
	private String realname;
	private String password;
	private String gender;
	private String phone;
	private String birth;
	private String age;
	
	@ColumnDefault("0")
	private int subscribe;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date user_regdate;
	private String ip;
 
	@Embedded
	private Address address;
	
	@Embedded
	private Job job;
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
	@JsonIgnore
	private Set<DietBoard> dietBoard;
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonIgnore
	private List<PayInfo> payInfo;
	
	@OneToMany(mappedBy = "member" ,cascade = CascadeType.REMOVE)
	@JsonIgnore
	private Set<CommentBoard> commentBoards;
}
