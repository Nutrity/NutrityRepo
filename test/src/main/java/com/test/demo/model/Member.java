package com.test.demo.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
@Entity
public class Member {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY )
	private Long num;
	
	private String useremail;
	private String platform_type;
	private String access_token;
	private String username;
	private String password;
	private String gender;
	private String phone;
	private String birth;
	private String age;
	private int subscribe;
	private Date user_regdate;
	private String ip;

	@OneToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "addrnum")
	private Address address;
	
	@OneToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "role")
	private Job job;
	
	
}