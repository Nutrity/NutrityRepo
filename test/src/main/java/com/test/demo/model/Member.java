package com.test.demo.model;

import java.util.Date;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@Entity
@DynamicInsert
@ToString
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
	
	
}
