package com.test.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;

import lombok.Data;

@Data
@Entity
@DynamicInsert
public class Job {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long jnum;
	
	@ColumnDefault("'role_user'")
	private String role;
	
	private String job;
	private String qualName;
}
